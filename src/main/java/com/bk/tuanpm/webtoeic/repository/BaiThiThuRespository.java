package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.ContentAdmin;
import com.bk.tuanpm.webtoeic.entities.Exam;
@Repository
public interface BaiThiThuRespository extends JpaRepository<Exam,Integer>
				, PagingAndSortingRepository<Exam, Integer>{
	List<Exam> findByBaithithuid(int id);
	
	@Query("SELECT e FROM Exam e ORDER BY e.dateAdd DESC")
	Page<Exam> findAll(Pageable pageRequest);
	
	List<Exam> findTop10ByOrderByCountRateDesc();
	
	List<Exam> findTop10ByOrderByCountTestDesc();

	List<Exam> findAllByIsActive(String isActive);

}
