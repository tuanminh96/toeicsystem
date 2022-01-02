package com.bk.tuanpm.webtoeic.dto;

import java.util.Date;

import com.bk.tuanpm.webtoeic.entities.Post;

public class PostDTO {
	private Post post;
	private boolean isAdminPost;
	private int totalComment;
	private String timePost;
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public boolean isAdminPost() {
		return isAdminPost;
	}
	public void setAdminPost(boolean isAdminPost) {
		this.isAdminPost = isAdminPost;
	}
	public int getTotalComment() {
		return totalComment;
	}
	public void setTotalComment(int totalComment) {
		this.totalComment = totalComment;
	}
	public String getTimePost() {
		return timePost;
	}
	public void setTimePost(String timePost) {
		this.timePost = timePost;
	}
}
