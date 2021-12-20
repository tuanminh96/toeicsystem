package com.bk.tuanpm.webtoeic.controller.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bk.tuanpm.webtoeic.dto.ExamQuestionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bk.tuanpm.webtoeic.entities.Question;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.service.BaiThiThuService;
import com.bk.tuanpm.webtoeic.service.QuestionService;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;
import com.bk.tuanpm.webtoeic.service.KetQuaBaiTestService;

@Controller
public class BaiFullTestListeningController {

    @Autowired
    BaiThiThuService baithithuServie;

    @Autowired
    QuestionService questionService;

    @Autowired
    KetQuaBaiTestService ketquabaitestService;

    @Autowired
    BaiThiThuService baithithuService;

    @Autowired
    private UserAdminServiceImpl nguoiDungService;

    @ModelAttribute("loggedInUser")
    public Account getSessionUser(HttpServletRequest request) {
        return (Account) request.getSession().getAttribute("loggedInUser");
    }

    @RequestMapping(value = "/showResultExam/{examId}", method = RequestMethod.GET)
    public String showResult(Model model, HttpSession session, @PathVariable("examId") int examId) {
//        int examId = Integer.valueOf(examIdString);
        List<Question> list = questionService.getListCauHoi(baithithuServie.getBaiThiThu(examId).get(0));
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Account currentUser = nguoiDungService.findByEmail(auth.getName());

        HashMap<String, String> mapAnswerListen = (HashMap<String, String>) session.getAttribute("mapAnswerListen");
        HashMap<String, String> mapAnswerRead = (HashMap<String, String>) session.getAttribute("mapAnswerRead");

        // Get All Question of question, part, set_question, exam
        List<ExamQuestionDTO> listExamQuestionDTO = questionService.getAllListExamQuestionDTO(examId);
        model.addAttribute("fullListExamQuestionDTO", listExamQuestionDTO);

        // Set them userAnswerListen vao listDTO
        for (Map.Entry<String, String> entry : mapAnswerListen.entrySet()) {
            String quesId = entry.getKey();
            String userAnser = entry.getValue();
            Optional<ExamQuestionDTO> examQuestionDTO = listExamQuestionDTO.stream().filter(item -> item.getIdQuestion().toString().equals(quesId)).findFirst();
            examQuestionDTO.get().setUserAnswer(userAnser);
        }

        // Set them userAnswerRead vao listDTO
        for (Map.Entry<String, String> entry : mapAnswerRead.entrySet()) {
            String quesId = entry.getKey();
            String userAnser = entry.getValue();
            Optional<ExamQuestionDTO> examQuestionDTO = listExamQuestionDTO.stream().filter(item -> item.getIdQuestion().toString().equals(quesId)).findFirst();
            examQuestionDTO.get().setUserAnswer(userAnser);
        }

        for (int i = 1; i <= 7; i++) {
            int idPart = i;
            List<ExamQuestionDTO> listQuestionPart = listExamQuestionDTO.stream().filter(item -> item.getIdPart() == idPart).collect(Collectors.toList());
            model.addAttribute("listQuestionPart" + idPart, listQuestionPart);
        }

        return "client/examResult";
    }

}
