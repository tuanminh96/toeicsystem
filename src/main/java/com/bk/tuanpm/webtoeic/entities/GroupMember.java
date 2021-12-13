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

import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name="group_member")
public class GroupMember {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_group_mem", nullable = false)
	private Integer idGroupMember;
	private Date addDate;
	
	@Column(nullable = true, columnDefinition = "int default 0")
	private int isDisabled;
	
	@Column(name="id_group")
	private int group;

	@Column(name="id_user")
	private int user;
	
	private Date updateDate;
	private String updateBy;
	
	public Integer getIdGroupMember() {
		return idGroupMember;
	}
	public void setIdGroupMember(Integer idGroupMember) {
		this.idGroupMember = idGroupMember;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public int isDisabled() {
		return isDisabled;
	}
	public void setDisabled(int isDisabled) {
		this.isDisabled = isDisabled;
	}

	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	
}
