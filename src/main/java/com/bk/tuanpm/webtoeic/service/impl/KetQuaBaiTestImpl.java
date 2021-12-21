package com.bk.tuanpm.webtoeic.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

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
	
	@Override
	public List<TestResult> getResultMemberDateRange(int idUser, Date dateFrom, Date dateTo) {
		return ketquabaitestRepo.getAllResultBetween(idUser, dateFrom, dateTo);
	}
	
	@Override
	public List<Integer> getExamOfUsers(User user) {
		
		return ketquabaitestRepo.getExamsTested(user.getId());
	}
	
	@Override
	public List<Integer> getListExamNotAllowedTest(User user) {
		List<TestResult> listResult = ketquabaitestRepo.findByNguoidung(user);
		List<Integer> listNotAllow = new ArrayList<Integer>();
		for (TestResult tr  : listResult) {
			Date dateTest = tr.getNgaythi();
			long current = (new Date()).getTime();
			if(dateTest.getTime()+24*60*60*1000 > current) {
				listNotAllow.add(tr.getBaithithu().getBaithithuid());
			}
		}
		List<Integer> deduped = listNotAllow.stream().distinct().collect(Collectors.toList());
		return deduped;
	}
}
