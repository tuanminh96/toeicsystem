package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import com.bk.tuanpm.webtoeic.entities.BaiTapTuVung;
import com.bk.tuanpm.webtoeic.entities.CommentTuVung;


public interface CommentTuVungService {
	
 List<CommentTuVung> findByBaiTapTuVung(BaiTapTuVung baitaptuvung);
 void save(CommentTuVung commentTuVung);
 
}
