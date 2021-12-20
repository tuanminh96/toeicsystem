package com.bk.tuanpm.webtoeic.controller.client;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import com.bk.tuanpm.webtoeic.dto.ExamQuestionDTO;
import com.bk.tuanpm.webtoeic.request.DataExamDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.bk.tuanpm.webtoeic.entities.Question;
import com.bk.tuanpm.webtoeic.entities.PartToeic;
import com.bk.tuanpm.webtoeic.service.BaiThiThuService;
import com.bk.tuanpm.webtoeic.service.QuestionService;
import com.bk.tuanpm.webtoeic.service.PartService;

import javax.servlet.http.HttpSession;

@Controller
public class BaiFullTestReadingController {
    @Autowired
    BaiThiThuService baithithuService;

    @Autowired
    QuestionService questionService;

    @Autowired
    PartService partService;

    @RequestMapping(value = "/reading/{examId}", method = RequestMethod.POST)
    public String DetailReading(Model model, HttpSession session, @PathVariable("examId") int examId,
                                @RequestBody DataExamDTO dataExamDTO) {
        HashMap<String, String> mapAnswerListen = dataExamDTO.getJsonAnswerUser();
        String timeDoListenExam = dataExamDTO.getTimeDoExam();

        session.setAttribute("mapAnswerListen", mapAnswerListen);
        session.setAttribute("timeDoListenExam", timeDoListenExam);

        // Get All Question of question, part, set_question, exam
        List<ExamQuestionDTO> listExamQuestionDTO = questionService.getListExamQuestionDTO(examId, "Reading");
        for (int i = 5; i <= 7; i++) {
            int idPart = i;
            List<ExamQuestionDTO> listQuestionPart = listExamQuestionDTO.stream().filter(item -> item.getIdPart() == idPart).collect(Collectors.toList());
            model.addAttribute("listQuestionPart" + idPart, listQuestionPart);
        }

        return "client/fullTestReading";
    }

    @RequestMapping(value = "/showResultReading/{examId}/{socaudung}", method = RequestMethod.POST)
    public String showResult(Model model, @RequestBody String[] jsonAnswerUser, @PathVariable("examId") int examId,
                             @PathVariable("socaudung") int socaudung) {

        List<Question> list = questionService.getListCauHoi(baithithuService.getBaiThiThu(examId).get(0));
        List<PartToeic> readParts = partService.getPartByType("Reading");
        List<Question> listRead = questionService.getListCauHoiByPart(readParts);

        model.addAttribute("listQuestion", list);
        model.addAttribute("socaudung", socaudung);
        model.addAttribute("socauListeningCorrect", socaudung);

        return "client/readingResult";
    }

}
