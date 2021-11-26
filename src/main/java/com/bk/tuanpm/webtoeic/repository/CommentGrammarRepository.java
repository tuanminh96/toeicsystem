package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.BaiGrammar;
import com.bk.tuanpm.webtoeic.entities.CommentGrammar;

@Repository
public interface CommentGrammarRepository  extends JpaRepository<CommentGrammar,Integer>{

	List<CommentGrammar> findByBaigrammar(BaiGrammar baigrammar);

}
