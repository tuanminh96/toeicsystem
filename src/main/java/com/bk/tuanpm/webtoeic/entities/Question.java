package com.bk.tuanpm.webtoeic.entities;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "question")
public class Question {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "cauhoibaithithuid", nullable = false)
	private Integer cauhoibaithithuid;

	@Column(name = "number")
	private Integer number;

	@Column(name = "image")
	private String image;

	@Column(name = "audiomp3")
	private String audiomp3;

	@Column(columnDefinition = "TEXT")
	private String paragraph;

	@Column(name = "question")
	private String question;

	@Column(name = "option1")
	private String option1;

	@Column(name = "option2")
	private String option2;

	@Column(name = "option3")
	private String option3;

	@Column(name = "option4")
	private String option4;

	@Column(name = "correctanswer")
	private String correctanswer;

	@ManyToOne
	@JoinColumn(name = "baithithuid", nullable = false)
	@OnDelete(action = OnDeleteAction.CASCADE)
	@JsonIgnore
	private Exam baithithu;

	@ManyToOne
	@JoinColumn(name = "id_part", nullable = false)
	private PartToeic partToeic;

	@ManyToOne
	@JoinColumn(name = "id_set", nullable = true)
	private SetQuestion setQuestion;

	private String updateBy;
	private Date updateDate;

	public Question() {

	}

	public Question(Integer cauhoibaithithuid, Integer number, String image, String audiomp3, String paragraph,
			String question, String option1, String option2, String option3, String option4, String correctanswer,
			Exam baithithu) {
		super();
		this.cauhoibaithithuid = cauhoibaithithuid;
		this.number = number;
		this.image = image;
		this.audiomp3 = audiomp3;
		this.paragraph = paragraph;
		this.question = question;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.correctanswer = correctanswer;
		this.baithithu = baithithu;
	}

	public Integer getCauhoibaithithuid() {
		return cauhoibaithithuid;
	}

	public void setCauhoibaithithuid(Integer cauhoibaithithuid) {
		this.cauhoibaithithuid = cauhoibaithithuid;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAudiomp3() {
		return audiomp3;
	}

	public void setAudiomp3(String audiomp3) {
		this.audiomp3 = audiomp3;
	}

	public String getParagraph() {
		return paragraph;
	}

	public void setParagraph(String paragraph) {
		this.paragraph = paragraph;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getCorrectanswer() {
		return correctanswer;
	}

	public void setCorrectanswer(String correctanswer) {
		this.correctanswer = correctanswer;
	}

	public Exam getBaithithu() {
		return baithithu;
	}

	public void setBaithithu(Exam baithithu) {
		this.baithithu = baithithu;
	}

	public PartToeic getPartToeic() {
		return partToeic;
	}

	public void setPartToeic(PartToeic partToeic) {
		this.partToeic = partToeic;
	}

	public SetQuestion getSetQuestion() {
		return setQuestion;
	}

	public void setSetQuestion(SetQuestion setQuestion) {
		this.setQuestion = setQuestion;
	}

}
