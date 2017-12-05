package com.way.learning.model.course.vo;

import java.util.Date;

public class LectureRecommend {
	
	private String userId;
	private int lectureNo;
	private String author;
	private String title;
	private Date regDate;
	public LectureRecommend(String userId, int lectureNo, String author, String title, Date regDate) {
		super();
		this.userId = userId;
		this.lectureNo = lectureNo;
		this.author = author;
		this.title = title;
		this.regDate = regDate;
	}
	
	public LectureRecommend() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "LectureRecommend [userId=" + userId + ", lectureNo=" + lectureNo + ", author=" + author + ", title="
				+ title + ", regDate=" + regDate + "]";
	}
	


}
