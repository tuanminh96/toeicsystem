package com.bk.tuanpm.webtoeic.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.BaiThiThu;
import com.bk.tuanpm.webtoeic.entities.CauHoiBaiThiThu;
import com.bk.tuanpm.webtoeic.entities.PartToeic;
import com.bk.tuanpm.webtoeic.repository.CauHoiBaiThiThuRespository;
import com.bk.tuanpm.webtoeic.service.CauHoiBaiThiThuService;
import com.bk.tuanpm.webtoeic.service.PartService;
@Service
public class CauHoiBaiThiThuImpl implements CauHoiBaiThiThuService{
	
	@Autowired
	CauHoiBaiThiThuRespository cauhoibaithithuRepo;
	
	@Autowired
	PartService partService;
	@Override
	public void  save(CauHoiBaiThiThu cauhoibaithithu) {
		 cauhoibaithithuRepo.save(cauhoibaithithu);
	}
	
	@Override 
	public List<CauHoiBaiThiThu> getListCauHoi(BaiThiThu baithithu){
		return cauhoibaithithuRepo.findByBaithithu(baithithu);
	}

	@Override
	public Map<String, List<CauHoiBaiThiThu>> getMapPartQuestionListen(List<CauHoiBaiThiThu> list) {
		// TODO Auto-generated method stub
		Map<PartToeic, List<CauHoiBaiThiThu>> mapPartQuestion = list.stream()
				.collect(Collectors.groupingBy(CauHoiBaiThiThu::getPartToeic));
		Map<String, List<CauHoiBaiThiThu>> newMapPartQuestion = new HashMap<>();
		Set<PartToeic> partToeics = mapPartQuestion.keySet();
		for (PartToeic partToeic : partToeics) {
			if("Listening".equals(partToeic.getType()))
			newMapPartQuestion.put("part"+partToeic.getIdPart(), mapPartQuestion.get(partService.getPartByName(partToeic.getPartName())));
		}
		return newMapPartQuestion;
	}
	@Override
	public Map<String, List<CauHoiBaiThiThu>> getMapPartQuestionReading(List<CauHoiBaiThiThu> list) {
		// TODO Auto-generated method stub
		Map<PartToeic, List<CauHoiBaiThiThu>> mapPartQuestion = list.stream()
				.collect(Collectors.groupingBy(CauHoiBaiThiThu::getPartToeic));
		Map<String, List<CauHoiBaiThiThu>> newMapPartQuestion = new HashMap<>();
		Set<PartToeic> partToeics = mapPartQuestion.keySet();
		for (PartToeic partToeic : partToeics) {
			if("Reading".equals(partToeic.getType()))
			newMapPartQuestion.put("part"+partToeic.getIdPart(), mapPartQuestion.get(partService.getPartByName(partToeic.getPartName())));
		}
		return newMapPartQuestion;
	}
}
