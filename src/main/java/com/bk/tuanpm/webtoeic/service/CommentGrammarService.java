package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import com.bk.tuanpm.webtoeic.entities.BaiGrammar;
import com.bk.tuanpm.webtoeic.entities.CommentGrammar;


public interface CommentGrammarService {
	List<CommentGrammar> findByBaiGrammar(BaiGrammar baigrammar);
	 void save(CommentGrammar commentGrammar);
}
