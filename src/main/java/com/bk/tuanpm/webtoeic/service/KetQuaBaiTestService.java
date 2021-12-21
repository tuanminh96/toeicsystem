package com.bk.tuanpm.webtoeic.service;

import java.util.Date;
import java.util.List;

import com.bk.tuanpm.webtoeic.entities.Exam;
import com.bk.tuanpm.webtoeic.entities.TestResult;
import com.bk.tuanpm.webtoeic.entities.User;

public interface KetQuaBaiTestService {
	void save(TestResult ketquabaitest);

	List<TestResult> getResultMember(User user);

	List<Integer> getExamOfUsers(User user);

	List<Integer> getListExamNotAllowedTest(User user);

	List<TestResult> getResultMemberDateRange(int idUser, Date dateFrom, Date dateTo);
}
