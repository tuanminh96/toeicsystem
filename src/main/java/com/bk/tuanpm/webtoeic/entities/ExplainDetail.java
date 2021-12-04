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
@Table(name = "explain_detail")
public class ExplainDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_explain", nullable = false)
	private Integer idExplain;
	private String explain;
	private String idStaff;
	private Date updateDate;
	
	@OneToOne
	private Question question;

	public Integer getIdExplain() {
		return idExplain;
	}

	public void setIdExplain(Integer idExplain) {
		this.idExplain = idExplain;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public String getIdStaff() {
		return idStaff;
	}

	public void setIdStaff(String idStaff) {
		this.idStaff = idStaff;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}
	
	
}
