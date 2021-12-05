package com.bk.tuanpm.webtoeic.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class User extends Account {

	private Date addDate;
	private String school;
	private String company;
	@ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(
        name = "group_member", 
        joinColumns = { @JoinColumn (name = "id_group") }, 
        inverseJoinColumns = { @JoinColumn(name = "id_user") }
    )
	List<Group> groups;

	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	public List<Group> getGroups() {
		return groups;
	}
	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}

}
