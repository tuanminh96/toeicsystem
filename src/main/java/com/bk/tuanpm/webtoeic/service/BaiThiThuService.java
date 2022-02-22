package com.bk.tuanpm.webtoeic.service;

import java.util.Collection;
import java.util.List;

import org.springframework.data.domain.Page;

import com.bk.tuanpm.webtoeic.entities.ContentAdmin;
import com.bk.tuanpm.webtoeic.entities.Exam;

public interface BaiThiThuService {
	void save(Exam baithithu);
	List<Exam> getBaiThiThu(int id);
	
	Page<Exam> getBaiThiThu(int page, int limit);
	
	List<Exam> getAllBaiThiThu();
	void delete(int id);
	List<Exam> getTopRatingExam();
	List<Exam> getTopViewExam();
	List<Exam> getAllExamSubmited(Collection<String> isActive);
	void approveExam(Exam exam);
	void rejectExam(Exam exam);
	long getTotalExam();
	List<Exam> getExamByAdmi(ContentAdmin admin);
}
