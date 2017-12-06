package com.way.learning.model.course.vo;

import java.util.Date;

public class MyLectureRecord {
	
    private String userId;
    private int courseNo;
    private int lectureNo;
    private int isFinish;
    private Date regDate;
	public MyLectureRecord(String userId, int courseNo, int lectureNo, int isFinish, Date regDate) {
		super();
		this.userId = userId;
		this.courseNo = courseNo;
		this.lectureNo = lectureNo;
		this.isFinish = isFinish;
		this.regDate = regDate;
	}
    
    public MyLectureRecord() {
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

	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}

	public int getIsFinish() {
		return isFinish;
	}

	public void setIsFinish(int isFinish) {
		this.isFinish = isFinish;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "WlMyLectureRecord [userId=" + userId + ", courseNo=" + courseNo + ", lectureNo=" + lectureNo
				+ ", isFinish=" + isFinish + ", regDate=" + regDate + "]";
	}
    
    


}
