package com.way.learning.model.course.vo;

import java.util.Date;

public class LectureReply {
	
	private int replyNo;
	private int lectureNo;
	private int courseNo;
	private String replyer;
	private String replytext;
	private int cntReplyLike;
	private Date regDate;
	public LectureReply(int replyNo, int lectureNo, int courseNo, String replyer, String replytext, int cntReplyLike,
			Date regDate) {
		super();
		this.replyNo = replyNo;
		this.lectureNo = lectureNo;
		this.courseNo = courseNo;
		this.replyer = replyer;
		this.replytext = replytext;
		this.cntReplyLike = cntReplyLike;
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

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public int getCntReplyLike() {
		return cntReplyLike;
	}

	public void setCntReplyLike(int cntReplyLike) {
		this.cntReplyLike = cntReplyLike;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "LectureReply [replyNo=" + replyNo + ", lectureNo=" + lectureNo + ", courseNo=" + courseNo + ", replyer="
				+ replyer + ", replytext=" + replytext + ", cntReplyLike=" + cntReplyLike + ", regDate=" + regDate
				+ "]";
	}
	
	
	

	

}
