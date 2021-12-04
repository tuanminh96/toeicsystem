package com.bk.tuanpm.webtoeic.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Exam;
import com.bk.tuanpm.webtoeic.entities.Question;
import com.bk.tuanpm.webtoeic.entities.PartToeic;
import com.bk.tuanpm.webtoeic.repository.QuestionRespository;
import com.bk.tuanpm.webtoeic.service.QuestionService;
import com.bk.tuanpm.webtoeic.service.PartService;
@Service
public class QuestionImpl implements QuestionService{
	
	@Autowired
	QuestionRespository cauhoibaithithuRepo;
	
	@Autowired
	PartService partService;
	@Override
	public void  save(Question cauhoibaithithu) {
		 cauhoibaithithuRepo.save(cauhoibaithithu);
	}
	
	@Override 
	public List<Question> getListCauHoi(Exam baithithu){
		return cauhoibaithithuRepo.findByBaithithu(baithithu);
	}
	
	@Override 
	public List<Question> getListCauHoiByPart(List<PartToeic> part){
		return cauhoibaithithuRepo.findByPartToeic(part);
	}

	@Override
	public Map<String, List<Question>> getMapPartQuestionListen(List<Question> list) {
		// TODO Auto-generated method stub
		Map<PartToeic, List<Question>> mapPartQuestion = list.stream()
				.collect(Collectors.groupingBy(Question::getPartToeic));
		Map<String, List<Question>> newMapPartQuestion = new HashMap<>();
		Set<PartToeic> partToeics = mapPartQuestion.keySet();
		for (PartToeic partToeic : partToeics) {
			if("Listening".equals(partToeic.getType()))
			newMapPartQuestion.put("part"+partToeic.getIdPart(), mapPartQuestion.get(partService.getPartByName(partToeic.getPartName())));
		}
		return newMapPartQuestion;
	}
	@Override
	public Map<String, List<Question>> getMapPartQuestionReading(List<Question> list) {
		// TODO Auto-generated method stub
		Map<PartToeic, List<Question>> mapPartQuestion = list.stream()
				.collect(Collectors.groupingBy(Question::getPartToeic));
		Map<String, List<Question>> newMapPartQuestion = new HashMap<>();
		Set<PartToeic> partToeics = mapPartQuestion.keySet();
		for (PartToeic partToeic : partToeics) {
			if("Reading".equals(partToeic.getType()))
			newMapPartQuestion.put("part"+partToeic.getIdPart(), mapPartQuestion.get(partService.getPartByName(partToeic.getPartName())));
		}
		return newMapPartQuestion;
	}
}
