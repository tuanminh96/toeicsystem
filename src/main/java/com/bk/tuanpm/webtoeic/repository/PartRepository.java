package com.bk.tuanpm.webtoeic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bk.tuanpm.webtoeic.entities.PartToeic;

@Repository
public interface PartRepository extends JpaRepository<PartToeic, Integer> {
	public List<PartToeic> findAll();
	public List<PartToeic> findByType(String type);
	public PartToeic findByPartName(String part);
}
