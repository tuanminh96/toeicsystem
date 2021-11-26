package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.BaiThiThu;
@Repository
public interface BaiThiThuRespository extends JpaRepository<BaiThiThu,Integer>{
	List<BaiThiThu> findByBaithithuid(int id);

}
