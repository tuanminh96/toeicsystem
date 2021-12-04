package com.bk.tuanpm.webtoeic.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "set_question")
public class SetQuestion {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_set", nullable = false)
	private Integer idSet;

	@Column(name = "image")
	private String image;

	@Column(name = "audio")
	private String audio;

	@Column(columnDefinition = "TEXT")
	private String paragraph;

	private String content;
	private int totalQuest;
	@ManyToOne
	private PartToeic partToeic;
	@ManyToOne
	private Exam exam;
	private String updateBy;
	private Date updateDate;

	
	public SetQuestion() {
		super();
	}

	public SetQuestion(Integer idSet, String image, String audio, String paragraph, String content, PartToeic partToeic,
			Exam exam) {
		super();
		this.idSet = idSet;
		this.image = image;
		this.audio = audio;
		this.paragraph = paragraph;
		this.content = content;
		this.partToeic = partToeic;
		this.exam = exam;
	}

	public Integer getIdSet() {
		return idSet;
	}

	public void setIdSet(Integer idSet) {
		this.idSet = idSet;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAudio() {
		return audio;
	}

	public void setAudio(String audio) {
		this.audio = audio;
	}

	public String getParagraph() {
		return paragraph;
	}

	public void setParagraph(String paragraph) {
		this.paragraph = paragraph;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public PartToeic getPartToeic() {
		return partToeic;
	}

	public void setPartToeic(PartToeic partToeic) {
		this.partToeic = partToeic;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

}
