package com.bk.tuanpm.webtoeic.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Admin extends Account {

	private Date joinDate;

	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	@Override
	public String toString() {
		return "Admin [joinDate=" + joinDate + ", isLoginOauth2()=" + isLoginOauth2() + ", getConfirmPassword()="
				+ getConfirmPassword() + ", getEmail()=" + getEmail() + ", getPassword()=" + getPassword()
				+ ", getHoTen()=" + getHoTen() + ", getSoDienThoai()=" + getSoDienThoai() + ", getDiaChi()="
				+ getDiaChi() + ", getRole()=" + getRole() + ", getId()=" + getId() + ", getGender()=" + getGender()
				+ ", isDelete()=" + isDelete() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + "]";
	}
	
	
	
}
