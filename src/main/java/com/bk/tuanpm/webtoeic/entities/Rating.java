package com.bk.tuanpm.webtoeic.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="rating")
public class Rating {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Integer idRating;
	
	private int star;
	
	@Column(columnDefinition = "nvarchar(MAX)")
	private String review;
	private Date dateReview;
	
	@ManyToOne
	private User nguoiDung;
	
	@ManyToOne
	private Exam exam;

	public Integer getIdRating() {
		return idRating;
	}

	public void setIdRating(Integer idRating) {
		this.idRating = idRating;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getDateReview() {
		return dateReview;
	}

	public void setDateReview(Date dateReview) {
		this.dateReview = dateReview;
	}

	public User getNguoiDung() {
		return nguoiDung;
	}

	public void setNguoiDung(User nguoiDung) {
		this.nguoiDung = nguoiDung;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}
	
	
}
