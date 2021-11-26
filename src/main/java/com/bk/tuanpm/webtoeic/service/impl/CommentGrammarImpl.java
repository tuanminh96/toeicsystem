package com.bk.tuanpm.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.BaiGrammar;
import com.bk.tuanpm.webtoeic.entities.CommentGrammar;
import com.bk.tuanpm.webtoeic.repository.CommentGrammarRepository;
import com.bk.tuanpm.webtoeic.service.CommentGrammarService;

@Service
public class CommentGrammarImpl implements  CommentGrammarService {
	@Autowired
	CommentGrammarRepository commentgrammarRepo;
	
	@Override
	public List<CommentGrammar> findByBaiGrammar(BaiGrammar baigrammar){
		return commentgrammarRepo.findByBaigrammar(baigrammar);
	}
	
	 @Override
	 public void save(CommentGrammar commentGrammar) {
		 commentgrammarRepo.save(commentGrammar);
		 
	 }
}
