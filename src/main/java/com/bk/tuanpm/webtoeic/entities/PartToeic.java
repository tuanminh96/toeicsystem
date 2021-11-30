package com.bk.tuanpm.webtoeic.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

// tên các part trong toeic
@Entity
@Table(name = "part")
public class PartToeic {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int idPart;
	private String partName;
	private String type;
	private String description;
	private int questionTotal;

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

}
