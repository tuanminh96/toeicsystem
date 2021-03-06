package com.bk.tuanpm.webtoeic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.bk.tuanpm.webtoeic.entities.Exam;
import com.bk.tuanpm.webtoeic.repository.BaiThiThuRespository;
import com.bk.tuanpm.webtoeic.service.BaiThiThuService;

@Service
public class BaiThiThuImpl implements BaiThiThuService {

	@Autowired
	BaiThiThuRespository baithithuRepo;

	@Override
	public void save(Exam baithithu) {
		baithithuRepo.save(baithithu);
	}

	@Override
	public List<Exam> getBaiThiThu(int id) {
		return baithithuRepo.findByBaithithuid(id);
	}

	@Override
	public Page<Exam> getBaiThiThu(int page, int size) {
		return baithithuRepo.findAll(PageRequest.of(page, size));

	}

	@Override
	public List<Exam> getAllBaiThiThu() {
		return baithithuRepo.findAll();
	}

	@Override
	public void delete(int id) {
		baithithuRepo.deleteById(id);
	}

	@Override
	public List<Exam> getTopRatingExam() {
		return baithithuRepo.findTop10ByOrderByCountRate();
	};

	@Override
	public List<Exam> getTopViewExam() {
		return baithithuRepo.findTop10ByOrderByCountTest();
	};
}
