package com.bk.tuanpm.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.PartToeic;
import com.bk.tuanpm.webtoeic.repository.PartRepository;
import com.bk.tuanpm.webtoeic.service.PartService;

@Service
public class PartServiceImpl implements PartService {
	
	@Autowired
	PartRepository partRepository;

	@Override
	public List<PartToeic> getAllPart() {
		// TODO Auto-generated method stub
		return partRepository.findAll();
	}

	@Override
	public List<PartToeic> getPartByType(String type) {
		// TODO Auto-generated method stub
		return partRepository.findByType(type);
	}

	@Override
	public PartToeic getPartByName(String part) {
		// TODO Auto-generated method stub
		return partRepository.findByPartName(part);
	}

}
