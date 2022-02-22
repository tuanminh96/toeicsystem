package com.bk.tuanpm.webtoeic.service.impl;

import java.util.*;
import java.util.stream.Collectors;

import com.bk.tuanpm.webtoeic.dto.ExamQuestionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Exam;
import com.bk.tuanpm.webtoeic.entities.Question;
import com.bk.tuanpm.webtoeic.entities.PartToeic;
import com.bk.tuanpm.webtoeic.repository.QuestionRespository;
import com.bk.tuanpm.webtoeic.service.QuestionService;
import com.bk.tuanpm.webtoeic.service.PartService;

@Service
public class QuestionImpl implements QuestionService {

    @Autowired
    QuestionRespository questionRespository;

    @Autowired
    PartService partService;

    @Override
    public void save(Question question) {
        questionRespository.save(question);
    }

    @Override
    public List<ExamQuestionDTO> getListExamQuestionDTO(int examId, String tpye) {
        List<Object[]> listObject = questionRespository.getListExamQuestionDTO(examId, tpye);
        List<ExamQuestionDTO> listExamQuestionDTO = new ArrayList<>();
        for (Object[] obj : listObject) {
            ExamQuestionDTO examQuestionDTO = new ExamQuestionDTO();
            examQuestionDTO.setIdExam((int) obj[0]);
            examQuestionDTO.setTitle(String.valueOf(obj[1]));
            examQuestionDTO.setIdSet((int) obj[2]);
            examQuestionDTO.setAudio(String.valueOf(obj[3]));
            examQuestionDTO.setContent(String.valueOf(obj[4]));
            examQuestionDTO.setsImage(String.valueOf(obj[5]));
            examQuestionDTO.setsParagraph(String.valueOf(obj[6]));
            examQuestionDTO.setIdPart((int) obj[7]);
            examQuestionDTO.setPartName(String.valueOf(obj[8]));
            examQuestionDTO.setType(String.valueOf(obj[9]));
            examQuestionDTO.setIdQuestion((int) obj[10]);
            examQuestionDTO.setCorrectAnswer(String.valueOf(obj[11]));
            examQuestionDTO.setNumber((int) obj[12]);
            examQuestionDTO.setOption1(String.valueOf(obj[13]));
            examQuestionDTO.setOption2(String.valueOf(obj[14]));
            examQuestionDTO.setOption3(String.valueOf(obj[15]));
            examQuestionDTO.setOption4(String.valueOf(obj[16]));
            examQuestionDTO.setQuestion(String.valueOf(obj[17]));
            examQuestionDTO.setDescription(String.valueOf(obj[18]));
            listExamQuestionDTO.add(examQuestionDTO);
        }
        return listExamQuestionDTO;
    }

    @Override
    public List<ExamQuestionDTO> getAllListExamQuestionDTO(int examId) {
        List<Object[]> listObject = questionRespository.getAllListExamQuestionDTO(examId);
        List<ExamQuestionDTO> listExamQuestionDTO = new ArrayList<>();
        for (Object[] obj : listObject) {
            ExamQuestionDTO examQuestionDTO = new ExamQuestionDTO();
            examQuestionDTO.setIdExam((int) obj[0]);
            examQuestionDTO.setTitle(String.valueOf(obj[1]));
            examQuestionDTO.setIdSet((int) obj[2]);
            examQuestionDTO.setAudio(String.valueOf(obj[3]));
            examQuestionDTO.setContent(String.valueOf(obj[4]));
            examQuestionDTO.setsImage(String.valueOf(obj[5]));
            examQuestionDTO.setsParagraph(String.valueOf(obj[6]));
            examQuestionDTO.setIdPart((int) obj[7]);
            examQuestionDTO.setPartName(String.valueOf(obj[8]));
            examQuestionDTO.setType(String.valueOf(obj[9]));
            examQuestionDTO.setIdQuestion((int) obj[10]);
            examQuestionDTO.setCorrectAnswer(String.valueOf(obj[11]));
            examQuestionDTO.setNumber((int) obj[12]);
            examQuestionDTO.setOption1(String.valueOf(obj[13]));
            examQuestionDTO.setOption2(String.valueOf(obj[14]));
            examQuestionDTO.setOption3(String.valueOf(obj[15]));
            examQuestionDTO.setOption4(String.valueOf(obj[16]));
            examQuestionDTO.setQuestion(String.valueOf(obj[17]));
            examQuestionDTO.setIdExplainDetail((int) obj[18]);
            examQuestionDTO.setExplain(String.valueOf(obj[19]));
            examQuestionDTO.setDescription(String.valueOf(obj[20]));
            listExamQuestionDTO.add(examQuestionDTO);
        }
        return listExamQuestionDTO;
    }

    @Override
    public List<Question> getListCauHoi(Exam baithithu) {
        return questionRespository.findByBaithithu(baithithu);
    }

    @Override
    public List<Question> getListCauHoiByPart(List<PartToeic> part) {
        return questionRespository.findByPartToeic(part);
    }

    @Override
    public Map<String, List<Question>> getMapPartQuestionListen(List<Question> list) {
        Map<PartToeic, List<Question>> mapPartQuestion = list.stream()
                .collect(Collectors.groupingBy(Question::getPartToeic));
        Map<String, List<Question>> newMapPartQuestion = new HashMap<>();
        Set<PartToeic> partToeics = mapPartQuestion.keySet();
        for (PartToeic partToeic : partToeics) {
            if ("Listening".equals(partToeic.getType()))
                newMapPartQuestion.put("part" + partToeic.getIdPart(), mapPartQuestion.get(partService.getPartByName(partToeic.getPartName())));
        }
        return newMapPartQuestion;
    }

    @Override
    public Map<String, List<Question>> getMapPartQuestionReading(List<Question> list) {
        Map<PartToeic, List<Question>> mapPartQuestion = list.stream()
                .collect(Collectors.groupingBy(Question::getPartToeic));
        Map<String, List<Question>> newMapPartQuestion = new HashMap<>();
        Set<PartToeic> partToeics = mapPartQuestion.keySet();
        for (PartToeic partToeic : partToeics) {
            if ("Reading".equals(partToeic.getType()))
                newMapPartQuestion.put("part" + partToeic.getIdPart(), mapPartQuestion.get(partService.getPartByName(partToeic.getPartName())));
        }
        return newMapPartQuestion;
    }
    
    @Override
    public Question getQuestionId(int id) {
    	return questionRespository.findById(id).orElse(null);
    }
}
