package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.TestResult;
import com.bk.tuanpm.webtoeic.entities.User;

@Repository
public interface KetQuaBaiTestRepository extends JpaRepository<TestResult,Integer> {
	
	public List<TestResult> findByNguoidung(User user);
}
