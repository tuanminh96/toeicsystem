package com.bk.tuanpm.webtoeic.service;

import java.util.List;

import com.bk.tuanpm.webtoeic.entities.PartToeic;

public interface PartService {
	public List<PartToeic> getAllPart();
	
	public List<PartToeic> getPartByType(String type);
	
	public PartToeic getPartByName(String type);

	int getScoreListening();

	int getScoreReading();
}
