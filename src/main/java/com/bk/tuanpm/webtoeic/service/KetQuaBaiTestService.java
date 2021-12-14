package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import com.bk.tuanpm.webtoeic.entities.TestResult;
import com.bk.tuanpm.webtoeic.entities.User;

public interface KetQuaBaiTestService {
	void save(TestResult ketquabaitest);

	List<TestResult> getResultMember(User user);
}
