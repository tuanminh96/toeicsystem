package com.bk.tuanpm.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.BaiThiThu;
import com.bk.tuanpm.webtoeic.entities.CauHoiBaiThiThu;
import com.bk.tuanpm.webtoeic.repository.CauHoiBaiThiThuRespository;
import com.bk.tuanpm.webtoeic.service.CauHoiBaiThiThuService;
@Service
public class CauHoiBaiThiThuImpl implements CauHoiBaiThiThuService{
	
	@Autowired
	CauHoiBaiThiThuRespository cauhoibaithithuRepo;
	
	@Override
	public void  save(CauHoiBaiThiThu cauhoibaithithu) {
		 cauhoibaithithuRepo.save(cauhoibaithithu);
	}
	
	@Override 
	public List<CauHoiBaiThiThu> getListCauHoi(BaiThiThu baithithu){
		return cauhoibaithithuRepo.findByBaithithu(baithithu);
	}
}
