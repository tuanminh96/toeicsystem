package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.BaiThiThu;
import com.bk.tuanpm.webtoeic.entities.CauHoiBaiThiThu;
@Repository
public interface CauHoiBaiThiThuRespository extends JpaRepository<CauHoiBaiThiThu,Integer>{
	
	List<CauHoiBaiThiThu> findByBaithithu(BaiThiThu baithithu);

}
