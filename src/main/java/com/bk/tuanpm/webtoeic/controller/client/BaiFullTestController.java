package com.bk.tuanpm.webtoeic.controller.client;

import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bk.tuanpm.webtoeic.dto.ExamQuestionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.bk.tuanpm.webtoeic.entities.Exam;
import com.bk.tuanpm.webtoeic.entities.Question;
import com.bk.tuanpm.webtoeic.entities.TestResult;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.PartToeic;
import com.bk.tuanpm.webtoeic.service.BaiThiThuService;
import com.bk.tuanpm.webtoeic.service.QuestionService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.service.KetQuaBaiTestService;
import com.bk.tuanpm.webtoeic.service.PartService;

@Controller
public class BaiFullTestController {
    @Autowired
    public BaiThiThuService baithithuService;

    @Autowired
    QuestionService questionService;

    @Autowired
    KetQuaBaiTestService ketquabaitestService;

    @Autowired
    PartService partService;

    @Autowired
    private UserAdminServiceImpl nguoiDungService;

    @ModelAttribute("loggedInUser")
    public Account getSessionUser(HttpServletRequest request) {
        return (Account) request.getSession().getAttribute("loggedInUser");
    }

    @GetMapping("/listExam")
    public String getListExam(@RequestParam(defaultValue = "1") int page, Model model) {

        // default value lấy từ kết quả đầu tiên

        try {

            Page<Exam> list = baithithuService.getBaiThiThu(page - 1, 4);

            int totalPage = list.getTotalPages();

            List<Integer> pagelist = new ArrayList<Integer>();

            // Lap ra danh sach cac trang
            if (page == 1 || page == 2) {
                for (int i = 2; i <= 3 && i <= totalPage; i++) {
                    pagelist.add(i);
                }
            } else if (page == totalPage) {
                for (int i = totalPage; i >= totalPage - 2 && i > 1; i--) {
                    pagelist.add(i);
                }
                Collections.sort(pagelist);
            } else {
                for (int i = page; i <= page + 1 && i <= totalPage; i++) {
                    pagelist.add(i);
                }
                for (int i = page - 1; i >= page - 1 && i > 1; i--) {
                    pagelist.add(i);
                }
                Collections.sort(pagelist);
            }
            //sort exam by date by stream java 8
            List<Exam> sortedList = list.getContent().stream().sorted(Comparator.comparing((Exam::getDateAdd)).reversed()).collect(Collectors.toList());
            model.addAttribute("pageList", pagelist);
            model.addAttribute("totalPage", totalPage);
            model.addAttribute("listData", sortedList);
            model.addAttribute("currentPage", page);

            return "client/listExam";

        } catch (Exception e) {
            System.out.println("error:" + e);
            return "client/error";
        }
    }

    @GetMapping("/doExam/{examId}")
    public String DetailListening(Model model, @PathVariable("examId") int examId) {
        try {
            // Get All Question of question, part, set_question, exam
            List<ExamQuestionDTO> listExamQuestionDTO = questionService.getListExamQuestionDTO(examId);
            model.addAttribute("listExamQuestionDTO", listExamQuestionDTO);
            for (int i = 1; i <= 4; i++) {
                int idPart = i;
                List<ExamQuestionDTO> listQuestionPart = listExamQuestionDTO.stream().filter(item -> item.getIdPart() == idPart).collect(Collectors.toList());
                model.addAttribute("listQuestionPart" + idPart, listQuestionPart);
            }

//            List<Question> list = questionService.getListCauHoi(baithithuService.getBaiThiThu(examId).get(0));
//            List<PartToeic> partToeicListening = partService.getPartByType("Listening");
//            // Get mapping Part toeic and questions
//            Map<String, List<Question>> newMapPartQuestion = questionService.getMapPartQuestionListen(list);
//            model.addAllAttributes(newMapPartQuestion);
//            model.addAttribute("listQuestion", list);
//            model.addAttribute("partListen", partToeicListening);
            return "client/doExam";

        } catch (Exception e) {
            System.out.println("error:" + e);
            return "client/error";
        }
    }

    @RequestMapping(value = "/saveResultTest/{examId}", method = RequestMethod.POST)
    public String showResultUser(Model model, HttpSession session, @RequestBody String[] jsonAnswerRead, @PathVariable("examId") int examId) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User currentUser = nguoiDungService.findUserByEmail(auth.getName());

        // Get list answer from session.
        session.setAttribute("listAnswerRead", jsonAnswerRead);
        String[] jsonAnswerListen = (String[]) session.getAttribute("listAnswerListen");

        List<Question> listQuestion = questionService.getListCauHoi(baithithuService.getBaiThiThu(examId).get(0));

        int correctAnswerListen = 0;
        for (int i = 0; i < jsonAnswerListen.length; i++) {
            int questionNumber = i + 1;
            String corectAnswer = listQuestion.stream().filter(item -> item.getNumber().equals(questionNumber)).findFirst().get().getCorrectanswer();
            if (corectAnswer.equals(jsonAnswerListen[i])) {
                correctAnswerListen++;
            }
        }


        Date time = new Date();
        TestResult ketquabaitest = new TestResult();
        ketquabaitest.setNgaythi(time);
        ketquabaitest.setBaithithu(baithithuService.getBaiThiThu(examId).get(0));
//        ketquabaitest.setCorrectlisten(correctListening);
//        ketquabaitest.setCorrectreading(correctReading);
        ketquabaitest.setNguoidung(currentUser);

        ketquabaitestService.save(ketquabaitest);
//        model.addAttribute("correctListening", correctListening);
//        model.addAttribute("correctReading", correctReading);
//        model.addAttribute("total", correctReading + correctListening);

        return "client/resultTestUser";
    }

    @GetMapping("/getTopRating")
    public String getTopRatingExam(Model model) {
        List<Exam> exams = baithithuService.getTopRatingExam();
        model.addAttribute("listData", exams);

        return "client/listTopRatingExam";
    }

    @GetMapping("/getTopView")
    public String getTopViewExam(Model model) {
        List<Exam> exams = baithithuService.getTopViewExam();
        model.addAttribute("listData", exams);

        return "client/listTopViewExam";
    }
}
