package com.bk.tuanpm.webtoeic.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "exam")
public class Exam {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_exam", nullable = false)
	private Integer baithithuid;
	
	
	@Column(name = "title")
	private String tenbaithithu;
	
	@Column(name = "thumbnail")
	private String anhbaithithu;
	
	@Column
	private Date dateAdd;
	
	private int countTest;
	private String description;
	private String level;
	private String updateBy;
	private Date updateDate;
	
	@OneToOne
	private NguoiDung userAdd;

	public Exam() {
		
	}

	public Exam(Integer baithithuid, String tenbaithithu, String anhbaithithu) {
		super();
		this.baithithuid = baithithuid;
		this.tenbaithithu = tenbaithithu;
		this.anhbaithithu = anhbaithithu;
	}

	public Integer getBaithithuid() {
		return baithithuid;
	}

	public void setBaithithuid(Integer baithithuid) {
		this.baithithuid = baithithuid;
	}

	public String getTenbaithithu() {
		return tenbaithithu;
	}

	public void setTenbaithithu(String tenbaithithu) {
		this.tenbaithithu = tenbaithithu;
	}

	public String getAnhbaithithu() {
		return anhbaithithu;
	}

	public void setAnhbaithithu(String anhbaithithu) {
		this.anhbaithithu = anhbaithithu;
	}

	public Date getDateAdd() {
		return dateAdd;
	}

	public void setDateAdd(Date dateAdd) {
		this.dateAdd = dateAdd;
	}

	public int getCountTest() {
		return countTest;
	}

	public void setCountTest(int countTest) {
		this.countTest = countTest;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public NguoiDung getUserAdd() {
		return userAdd;
	}

	public void setUserAdd(NguoiDung userAdd) {
		this.userAdd = userAdd;
	}
	
	
//	@Override
//	public String toString() {
//		return "{"+"\"baithithuid\":"+"\""+BaiThiThu.class.get+"\""
//				+ ","+"\"nguoidung\":" + "\""+nguoidung.getHoTen() +"\""+"}";
//	}
	
}
