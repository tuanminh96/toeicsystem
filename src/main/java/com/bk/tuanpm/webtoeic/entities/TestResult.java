package com.bk.tuanpm.webtoeic.entities;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "test_result")
public class TestResult {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "resultId", nullable = false)
	
	private Integer ketquaid;
	private int totalTimeTest;
	private int rightPart1;
	private int rightPart2;
	private int rightPart3;
	private int rightPart4;
	private int rightPart5;
	private int rightPart6;
	private int rightPart7;
	private int scoreListen;
	private int scoreReading;
	
	@Column(name = "date_test")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+7")
	private Date ngaythi;

	@Column(name = "correctread")
	private int correctreading;

	@Column(name = "correctlisten")
	private int correctlisten;

	@ManyToOne
	@JoinColumn(name = "nguoidungid", nullable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private NguoiDung nguoidung;

	@ManyToOne
	@JoinColumn(name = "baithithuid", nullable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private Exam baithithu;

	public TestResult() {

	}

	public TestResult(Integer ketquaid, int socaudung, int socausai, Date ngaythi, int correctreading,
			int correctlisten, NguoiDung nguoidung, Exam baithithu) {
		super();
		this.ketquaid = ketquaid;
		this.ngaythi = ngaythi;
		this.correctreading = correctreading;
		this.correctlisten = correctlisten;
		this.nguoidung = nguoidung;
		this.baithithu = baithithu;
	}

	public int getCorrectreading() {
		return correctreading;
	}

	public void setCorrectreading(int correctreading) {
		this.correctreading = correctreading;
	}

	public int getCorrectlisten() {
		return correctlisten;
	}

	public void setCorrectlisten(int correctlisten) {
		this.correctlisten = correctlisten;
	}

	public Integer getKetquaid() {
		return ketquaid;
	}

	public void setKetquaid(Integer ketquaid) {
		this.ketquaid = ketquaid;
	}

	public NguoiDung getNguoidung() {
		return nguoidung;
	}

	public void setNguoidung(NguoiDung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public Exam getBaithithu() {
		return baithithu;
	}

	public void setBaithithu(Exam baithithu) {
		this.baithithu = baithithu;
	}

	public Date getNgaythi() {
		return ngaythi;
	}

	public void setNgaythi(Date ngaythi) {
		this.ngaythi = ngaythi;
	}

	public int getTotalTimeTest() {
		return totalTimeTest;
	}

	public void setTotalTimeTest(int totalTimeTest) {
		this.totalTimeTest = totalTimeTest;
	}

	public int getRightPart1() {
		return rightPart1;
	}

	public void setRightPart1(int rightPart1) {
		this.rightPart1 = rightPart1;
	}

	public int getRightPart2() {
		return rightPart2;
	}

	public void setRightPart2(int rightPart2) {
		this.rightPart2 = rightPart2;
	}

	public int getRightPart3() {
		return rightPart3;
	}

	public void setRightPart3(int rightPart3) {
		this.rightPart3 = rightPart3;
	}

	public int getRightPart4() {
		return rightPart4;
	}

	public void setRightPart4(int rightPart4) {
		this.rightPart4 = rightPart4;
	}

	public int getRightPart5() {
		return rightPart5;
	}

	public void setRightPart5(int rightPart5) {
		this.rightPart5 = rightPart5;
	}

	public int getRightPart6() {
		return rightPart6;
	}

	public void setRightPart6(int rightPart6) {
		this.rightPart6 = rightPart6;
	}

	public int getRightPart7() {
		return rightPart7;
	}

	public void setRightPart7(int rightPart7) {
		this.rightPart7 = rightPart7;
	}

	public int getScoreListen() {
		return scoreListen;
	}

	public void setScoreListen(int scoreListen) {
		this.scoreListen = scoreListen;
	}

	public int getScoreReading() {
		return scoreReading;
	}

	public void setScoreReading(int scoreReading) {
		this.scoreReading = scoreReading;
	}
	
}
