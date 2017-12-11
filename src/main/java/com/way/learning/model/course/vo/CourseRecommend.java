package com.way.learning.model.course.vo;

import java.util.Date;

public class CourseRecommend {
	
	private String userId;
	private int courseNo;
	private Date regDate;
	public CourseRecommend(String userId, int courseNo, Date regDate) {
		super();
		this.userId = userId;
		this.courseNo = courseNo;
		this.regDate = regDate;
	}

	
	public CourseRecommend() {
		// TODO Auto-generated constructor stub
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
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
		return "CourseRecommend [userId=" + userId + ", courseNo=" + courseNo + ", regDate=" + regDate + "]";
	}
	
	
	



}
