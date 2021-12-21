package com.bk.tuanpm.webtoeic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Remark;
import com.bk.tuanpm.webtoeic.repository.RemarkRepository;
import com.bk.tuanpm.webtoeic.service.RemarkService;

@Service
public class RemarkServiceImpl implements RemarkService{
	
	@Autowired
	private RemarkRepository remarkRepository;
	
	@Override
	public Remark saveRemarkForUser(Remark remark) {
		return remarkRepository.save(remark);
	}
}
