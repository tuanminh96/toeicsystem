package com.bk.tuanpm.webtoeic.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="teacher_remark")
public class Remark {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int idRemark;
	
	private String remark;
	private Date timeRemark;
	private String weekNum;
	private String dateRange;
	
	@ManyToOne
	private TutorialAdmin adminRemark;
	
	@ManyToOne
	private User user;

	public int getIdRemark() {
		return idRemark;
	}

	public void setIdRemark(int idRemark) {
		this.idRemark = idRemark;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getTimeRemark() {
		return timeRemark;
	}

	public void setTimeRemark(Date timeRemark) {
		this.timeRemark = timeRemark;
	}

	public TutorialAdmin getAdminRemark() {
		return adminRemark;
	}

	public void setAdminRemark(TutorialAdmin adminRemark) {
		this.adminRemark = adminRemark;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String getWeekNum() {
		return weekNum;
	}

	public void setWeekNum(String weekNum) {
		this.weekNum = weekNum;
	}

	public String getDateRange() {
		return dateRange;
	}

	public void setDateRange(String dateRange) {
		this.dateRange = dateRange;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + idRemark;
		result = prime * result + ((remark == null) ? 0 : remark.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Remark other = (Remark) obj;
		if (idRemark != other.idRemark)
			return false;
		if (remark == null) {
			if (other.remark != null)
				return false;
		} else if (!remark.equals(other.remark))
			return false;
		return true;
	}
	
}
