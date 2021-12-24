package com.bk.tuanpm.webtoeic.repository;

import com.bk.tuanpm.webtoeic.entities.SetQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SetQuestionRespository extends JpaRepository<SetQuestion, Integer> {

}
