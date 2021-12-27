package com.bk.tuanpm.webtoeic.dto;

import java.util.Date;

public class NotificationDTO {
	private Integer idNoti;
	private String type;
	private String message;
	private Date dateAdd;
	private String hyperLink;
	private String from;
	
	public Date getDateAdd() {
		return dateAdd;
	}
	public void setDateAdd(Date dateAdd) {
		this.dateAdd = dateAdd;
	}
	public Integer getIdNoti() {
		return idNoti;
	}
	public void setIdNoti(Integer idNoti) {
		this.idNoti = idNoti;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getHyperLink() {
		return hyperLink;
	}
	public void setHyperLink(String hyperLink) {
		this.hyperLink = hyperLink;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	
}
