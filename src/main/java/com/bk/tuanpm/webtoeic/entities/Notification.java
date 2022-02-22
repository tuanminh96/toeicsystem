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
@Table(name="notification")
public class Notification {
	
	public static final String TYPE_REMARK = "remark";
	public static final String TYPE_POST = "post";
	public static final String TYPE_COMMENT = "comment";
	public static final String TYPE_ADD_GROUP = "add_group";
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id_notification", nullable = false)
	private Integer idNoti;
	
	@Column(columnDefinition = "nvarchar(255)")
	private String brief;
	
	@Column(columnDefinition = "nvarchar(MAX)")
	private String content;
	private Date dateSend;
	
	private Date dateSeen;
	
	@ManyToOne 
	private Account user;
	private String hyperLink;
	private String type;
	public Integer getIdNoti() {
		return idNoti;
	}
	public void setIdNoti(Integer idNoti) {
		this.idNoti = idNoti;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDateSend() {
		return dateSend;
	}
	public void setDateSend(Date dateSend) {
		this.dateSend = dateSend;
	}
	public Date getDateSeen() {
		return dateSeen;
	}
	public void setDateSeen(Date dateSeen) {
		this.dateSeen = dateSeen;
	}
	public Account getUser() {
		return user;
	}
	public void setUser(Account user) {
		this.user = user;
	}
	public String getHyperLink() {
		return hyperLink;
	}
	public void setHyperLink(String hyperLink) {
		this.hyperLink = hyperLink;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idNoti == null) ? 0 : idNoti.hashCode());
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
		Notification other = (Notification) obj;
		if (idNoti == null) {
			if (other.idNoti != null)
				return false;
		} else if (!idNoti.equals(other.idNoti))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}
	
	
}
