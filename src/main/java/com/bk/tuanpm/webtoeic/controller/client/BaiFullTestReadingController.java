package com.bk.tuanpm.webtoeic.controller.client;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    QuestionService cauhoibaithithuService;

    @Autowired
    PartService partService;

    @RequestMapping(value = "/reading/{examId}", method = RequestMethod.POST)
    public String DetailReading(Model model, HttpSession session, @RequestBody String[] jsonAnswerListen, @PathVariable("examId") int id) {
        session.setAttribute("listAnswerListen", jsonAnswerListen);

        List<Question> list = cauhoibaithithuService.getListCauHoi(baithithuService.getBaiThiThu(id).get(0));
        List<PartToeic> partReading = partService.getPartByType("Reading");
        Map<String, List<Question>> map = cauhoibaithithuService.getMapPartQuestionReading(list);

        model.addAllAttributes(map);
        model.addAttribute("listQuestion", list);
        model.addAttribute("socauListeningCorrect", 1);
        model.addAttribute("partReading", partReading);

        return "client/fullTestReading";
    }

    @RequestMapping(value = "/showResultReading/{examId}/{socaudung}", method = RequestMethod.POST)
    public String showResult(Model model, @RequestBody String[] jsonAnswerUser, @PathVariable("examId") int examId,
                             @PathVariable("socaudung") int socaudung) {

        List<Question> list = cauhoibaithithuService.getListCauHoi(baithithuService.getBaiThiThu(examId).get(0));
        List<PartToeic> readParts = partService.getPartByType("Reading");
        List<Question> listRead = cauhoibaithithuService.getListCauHoiByPart(readParts);

        model.addAttribute("listQuestion", list);
        model.addAttribute("socaudung", socaudung);
        model.addAttribute("socauListeningCorrect", socaudung);

        return "client/readingResult";
    }

}
