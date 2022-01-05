package com.bk.tuanpm.webtoeic.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "comment")
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_comment", nullable = false)
	private Integer idCom;
	private Date dateCom;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String comment;
	
	@ManyToOne
	private Account user;
	
	@ManyToOne
	private Post post;

	private Date updateDate;
	private String updateBy;

	public Integer getIdCom() {
		return idCom;
	}

	public void setIdCom(Integer idCom) {
		this.idCom = idCom;
	}

	public Date getDateCom() {
		return dateCom;
	}

	public void setDateCom(Date dateCom) {
		this.dateCom = dateCom;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Account getUser() {
		return user;
	}

	public void setUser(Account user) {
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

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}
}
