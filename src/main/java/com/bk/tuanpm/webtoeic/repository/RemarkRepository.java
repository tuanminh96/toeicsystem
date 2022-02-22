package com.bk.tuanpm.webtoeic.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.Remark;
import com.bk.tuanpm.webtoeic.entities.User;

@Repository
public interface RemarkRepository extends JpaRepository<Remark, Integer> {
	
	public Remark findByDateRangeAndWeekNumAndUser(String range, String week, User user);

}
