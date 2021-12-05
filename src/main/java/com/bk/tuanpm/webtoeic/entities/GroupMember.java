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

@Entity
@Table(name="group_member")
public class GroupMember {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_group_mem", nullable = false)
	private Integer idGroupMember;
	private Date addDate;
	private int isDisabled;
	
	@ManyToOne
	@JoinColumn(name="id_group")
	private Group group;

	@ManyToOne
	@JoinColumn(name="id_user")
	private User user;
	
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
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((group == null) ? 0 : group.hashCode());
		result = prime * result + ((idGroupMember == null) ? 0 : idGroupMember.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
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
		GroupMember other = (GroupMember) obj;
		if (group == null) {
			if (other.group != null)
				return false;
		} else if (!group.equals(other.group))
			return false;
		if (idGroupMember == null) {
			if (other.idGroupMember != null)
				return false;
		} else if (!idGroupMember.equals(other.idGroupMember))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}
	
}
