package com.way.learning.model.course.vo;

import java.util.Date;

import com.way.learning.model.member.vo.Member;

public class LectureBoard {
	
	private int lectureNo;
	private int courseNo;
	private String lectureName;
	private int lectureOrder;
	private Member member;  //author  ,이미지.
	private String content;
	private Date regDate;
	
	
	public LectureBoard(int lectureNo, int courseNo, String lectureName, int lectureOrder, Member member,
			String content, Date regDate) {
		super();
		this.lectureNo = lectureNo;
		this.courseNo = courseNo;
		this.lectureName = lectureName;
		this.lectureOrder = lectureOrder;
		this.member = member;
		this.content = content;
		this.regDate = regDate;
	}
	
	public LectureBoard() {
		// TODO Auto-generated constructor stub
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
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public int getLectureOrder() {
		return lectureOrder;
	}
	public void setLectureOrder(int lectureOrder) {
		this.lectureOrder = lectureOrder;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "LectureBoard [lectureNo=" + lectureNo + ", courseNo=" + courseNo + ", lectureName=" + lectureName
				+ ", lectureOrder=" + lectureOrder + ", member=" + member + ", content=" + content + ", regDate="
				+ regDate + "]";
	}

	
	
	
	
	
	
	 
	 


}
