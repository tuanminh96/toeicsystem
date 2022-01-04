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
	
	@Override
	public int getScoreListening() {
		// TODO Auto-generated method stub
		int score = 0;
		int totalQuest = 0;
		List<PartToeic> part = partRepository.findByType("Listening");
		for (PartToeic partToeic : part) {
			totalQuest = totalQuest + partToeic.getQuestionTotal();
		}
		score = totalQuest * 10;
		return score;
	}
	
	@Override
	public int getScoreReading() {
		// TODO Auto-generated method stub
		int score = 0;
		int totalQuest = 0;
		List<PartToeic> part = partRepository.findByType("Reading");
		for (PartToeic partToeic : part) {
			totalQuest = totalQuest + partToeic.getQuestionTotal();
		}
		score = totalQuest * 10;
		return score;
	}

}
