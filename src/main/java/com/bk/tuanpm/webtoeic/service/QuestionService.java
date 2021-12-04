package com.bk.tuanpm.webtoeic.service;

import java.util.List;
import java.util.Map;

import com.bk.tuanpm.webtoeic.entities.Exam;
import com.bk.tuanpm.webtoeic.entities.Question;
import com.bk.tuanpm.webtoeic.entities.PartToeic;

public interface QuestionService {
	 void  save(Question cauhoibaithithu);
	 
	 List<Question> getListCauHoi(Exam baithithu);
	 
	 Map<String, List<Question>> getMapPartQuestionListen(List<Question> list);
	 
	 Map<String, List<Question>> getMapPartQuestionReading(List<Question> list);
	 
	 public List<Question> getListCauHoiByPart(List<PartToeic> part);
}
