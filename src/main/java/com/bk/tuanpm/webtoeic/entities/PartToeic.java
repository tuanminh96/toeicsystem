package com.bk.tuanpm.webtoeic.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

// tên các part trong toeic
@Entity
@Table(name = "part")
public class PartToeic {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int idPart;
	private String partName;
	private String type;
	
	@Column(columnDefinition = "nvarchar(MAX)")
	private String description;
	private int questionTotal;
	private int setQuestionTotal;
	private int timeForTest;
	
	@Transient
	private int timeOfType;

	public int getIdPart() {
		return idPart;
	}

	public void setIdPart(int idPart) {
		this.idPart = idPart;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getQuestionTotal() {
		return questionTotal;
	}

	public void setQuestionTotal(int questionTotal) {
		this.questionTotal = questionTotal;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getTimeOfType() {
		return timeOfType;
	}

	public void setTimeOfType(int timeOfType) {
		this.timeOfType = timeOfType;
	}

	public int getSetQuestionTotal() {
		return setQuestionTotal;
	}

	public void setSetQuestionTotal(int setQuestionTotal) {
		this.setQuestionTotal = setQuestionTotal;
	}
	
}
