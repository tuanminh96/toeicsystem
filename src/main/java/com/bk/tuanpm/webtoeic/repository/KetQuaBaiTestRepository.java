package com.bk.tuanpm.webtoeic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.TestResult;

@Repository
public interface KetQuaBaiTestRepository extends JpaRepository<TestResult,Integer> {
	
}
