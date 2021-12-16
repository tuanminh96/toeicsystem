package com.bk.tuanpm.webtoeic.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Exam;
import com.bk.tuanpm.webtoeic.entities.TestResult;
import com.bk.tuanpm.webtoeic.entities.User;

@Repository
public interface KetQuaBaiTestRepository extends JpaRepository<TestResult,Integer> {
	
	public List<TestResult> findByNguoidung(User user);
	
	@Query("SELECT e "
			+ "FROM TestResult tr JOIN tr.baithithu e WHERE tr.nguoidung.id = :idUser")
	public List<Exam> getListExamOfUser(int idUser);
	
	@Query("SELECT DISTINCT e.baithithuid "
			+ "FROM TestResult tr JOIN tr.baithithu e WHERE tr.nguoidung.id = :idUser")
	public List<Integer> getExamsTested(int idUser);
}
