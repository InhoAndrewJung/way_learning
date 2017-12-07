package com.way.learning.model.course.vo;

import java.util.Date;

import com.way.learning.model.member.vo.Member;

public class LectureBoard {
	
	private int lectureNo;
	private int courseNo;
	private String lectureName;
	private int lecutureOrder;
	private Member memer;  //author  ,이미지.
	private String title;
	private String content;
	private int cntReply;
	private int cntBoardLike;
	private Date regDate;
	public LectureBoard(int lectureNo, int courseNo, String lectureName, int lecutureOrder, Member memer, String title,
			String content, int cntReply, int cntBoardLike, Date regDate) {
		super();
		this.lectureNo = lectureNo;
		this.courseNo = courseNo;
		this.lectureName = lectureName;
		this.lecutureOrder = lecutureOrder;
		this.memer = memer;
		this.title = title;
		this.content = content;
		this.cntReply = cntReply;
		this.cntBoardLike = cntBoardLike;
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


	public int getLecutureOrder() {
		return lecutureOrder;
	}


	public void setLecutureOrder(int lecutureOrder) {
		this.lecutureOrder = lecutureOrder;
	}


	public Member getMemer() {
		return memer;
	}


	public void setMemer(Member memer) {
		this.memer = memer;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getCntReply() {
		return cntReply;
	}


	public void setCntReply(int cntReply) {
		this.cntReply = cntReply;
	}


	public int getCntBoardLike() {
		return cntBoardLike;
	}


	public void setCntBoardLike(int cntBoardLike) {
		this.cntBoardLike = cntBoardLike;
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
				+ ", lecutureOrder=" + lecutureOrder + ", memer=" + memer + ", title=" + title + ", content=" + content
				+ ", cntReply=" + cntReply + ", cntBoardLike=" + cntBoardLike + ", regDate=" + regDate + "]";
	}
	
	
	 
	 


}
