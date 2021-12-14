package com.bk.tuanpm.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Exam;
import com.bk.tuanpm.webtoeic.entities.TestResult;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.repository.KetQuaBaiTestRepository;
import com.bk.tuanpm.webtoeic.service.KetQuaBaiTestService;

@Service
public class KetQuaBaiTestImpl implements KetQuaBaiTestService{
	@Autowired
	KetQuaBaiTestRepository ketquabaitestRepo;
	
	@Override
	public void save(TestResult ketquabaitest) {
		ketquabaitestRepo.save(ketquabaitest);
	}
	
	@Override
	public List<TestResult> getResultMember(User user) {
		return ketquabaitestRepo.findByNguoidung(user);
	}
}
