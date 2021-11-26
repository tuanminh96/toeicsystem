package com.bk.tuanpm.webtoeic.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="role")
public class Role {
	@Transient
	public static final int ROLE_ADMIN = 1;
	@Transient
	public static final int ROLE_MEMBER = 2;
	@Transient
	public static final int ROLE_MEMBER_VIP = 3;
	@Transient
	public static final int ROLE_TUTORIAL = 4;
	@Transient
	public static final int ROLE_CONTENT = 5;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int idRole;
	private int code;
	private String role;
	

    public int getIdRole() {
		return idRole;
	}

	public void setIdRole(int idRole) {
		this.idRole = idRole;
	}

	public String getRole() {
		return role;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
}
