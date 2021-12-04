package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Exam;
import com.bk.tuanpm.webtoeic.entities.Question;
import com.bk.tuanpm.webtoeic.entities.PartToeic;
@Repository
public interface QuestionRespository extends JpaRepository<Question,Integer>{
	
	List<Question> findByBaithithu(Exam baithithu);
	
	@Query("SELECT q FROM Question q WHERE q.partToeic IN (:parts)")
	List<Question> findByPartToeic(List<PartToeic> parts);
	

}
