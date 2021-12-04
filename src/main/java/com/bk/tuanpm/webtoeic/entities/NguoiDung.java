package com.bk.tuanpm.webtoeic.entities;

import java.sql.Date;

import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class NguoiDung {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String email;

	@JsonIgnore
	private String password;

	@Transient
	@JsonIgnore
	private String confirmPassword;
	private String hoTen;
	private String soDienThoai;
	private String diaChi;
	private int gender;
	private String description;
	private Date joinDate;
	private boolean isDelete;
	
	@Transient
	private boolean loginOauth2;
	
	@ManyToOne
	@JoinColumn(name="role_id")
	private Role role;

	public boolean isLoginOauth2() {
		return loginOauth2;
	}

	public void setLoginOauth2(boolean loginOauth2) {
		this.loginOauth2 = loginOauth2;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public NguoiDung(String email, String password) {
		this.email = email;
		this.password = password;
	}

	public NguoiDung() {
		// TODO Auto-generated constructor stub
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public boolean isDelete() {
		return isDelete;
	}

	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	@Override
	public String toString() {
		return "NguoiDung [id=" + id + ", email=" + email + ", password=" + password + ", confirmPassword=" + confirmPassword + ", hoTen=" + hoTen
				+ ", soDienThoai=" + soDienThoai + ", diaChi=" + diaChi + "]";
	}

}
