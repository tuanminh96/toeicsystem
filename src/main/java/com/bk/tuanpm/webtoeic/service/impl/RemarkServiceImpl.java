package com.bk.tuanpm.webtoeic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Remark;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.repository.RemarkRepository;
import com.bk.tuanpm.webtoeic.service.RemarkService;

@Service
public class RemarkServiceImpl implements RemarkService{
	
	@Autowired
	private RemarkRepository remarkRepository;
	
	@Autowired
	private UserAdminServiceImpl userAdminServiceImpl;
	
	@Override
	public Remark saveRemarkForUser(Remark remark) {
		return remarkRepository.save(remark);
	}
	
	@Override
	public Remark getById(int id) {
		return remarkRepository.findById(id).orElse(null);
	}
	
	@Override
	public boolean isPresentRemark(int user, String range, String week) {
		User user2 = userAdminServiceImpl.getUserById(user);
		Remark remark = remarkRepository.findByDateRangeAndWeekNumAndUser(range, week, user2);
		if (remark!=null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public Remark getRemark(int user, String range, String week) {
		User user2 = userAdminServiceImpl.getUserById(user);
		return remarkRepository.findByDateRangeAndWeekNumAndUser(range, week, user2);
	}
	
}
