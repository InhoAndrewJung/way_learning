package com.way.learning.model.course.vo;

import java.util.Date;

public class LectureRecommend {
	
	private String userId;
	private int lectureNo;
	private int courseNo;
	private Date regDate;
	public LectureRecommend(String userId, int lectureNo, int courseNo, Date regDate) {
		super();
		this.userId = userId;
		this.lectureNo = lectureNo;
		this.courseNo = courseNo;
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


	public int getCourseNo() {
		return courseNo;
	}


	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	@Override
	public String toString() {
		return "LectureRecommend [userId=" + userId + ", lectureNo=" + lectureNo + ", courseNo=" + courseNo
				+ ", regDate=" + regDate + "]";
	}
	
	



}
