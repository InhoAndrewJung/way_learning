package com.way.learning.model.course.vo;

import java.util.Date;

import com.way.learning.model.member.vo.Member;

public class LectureReply {
	
	private int replyNo;
	private int lectureNo;
	private int courseNo;
	private Member member;
	private String replytext;
	private Date regDate;
	public LectureReply(int replyNo, int lectureNo, int courseNo, Member member, String replytext, Date regDate) {
		super();
		this.replyNo = replyNo;
		this.lectureNo = lectureNo;
		this.courseNo = courseNo;
		this.member = member;
		this.replytext = replytext;
		this.regDate = regDate;
	}
	
	public LectureReply() {
		// TODO Auto-generated constructor stub
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "LectureReply [replyNo=" + replyNo + ", lectureNo=" + lectureNo + ", courseNo=" + courseNo + ", member="
				+ member + ", replytext=" + replytext + ", regDate=" + regDate + "]";
	}
	
	
	
	
	

	

}
