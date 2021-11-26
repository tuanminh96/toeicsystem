package com.bk.tuanpm.webtoeic.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.BaiTapTuVung;
import com.bk.tuanpm.webtoeic.entities.CommentTuVung;
import com.bk.tuanpm.webtoeic.entities.NguoiDung;
import com.bk.tuanpm.webtoeic.repository.CommentTuVungRepository;
import com.bk.tuanpm.webtoeic.service.CommentTuVungService;

@Service
public class CommentTuVungImpl implements CommentTuVungService {
	
	@Autowired
	CommentTuVungRepository commenttuvungRepo;
	
	@Override
	public List<CommentTuVung> findByBaiTapTuVung(BaiTapTuVung baitaptuvung){
		return commenttuvungRepo.findByBaitaptuvung(baitaptuvung);
	}
	
	 @Override
	 public void save(CommentTuVung commentTuVung) {
		  commenttuvungRepo.save(commentTuVung);
		 
	 }
	

}
