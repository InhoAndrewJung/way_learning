package com.way.learning.model.board.qna.vo;

import java.util.Date;

import com.way.learning.model.member.vo.Member;

public class QnaReply {
	
	private int replyNo;
	private int boardNo;
	private Member member;
	private String replytext;
	private String regdate;
	private int cntReplyLike;
	private Date reg_date;
	
	public QnaReply(int replyNo, int boardNo, Member member, String replytext, String regdate, int cntReplyLike,
			Date reg_date) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.member = member;
		this.replytext = replytext;
		this.regdate = regdate;
		this.cntReplyLike = cntReplyLike;
		this.reg_date = reg_date;
	} 

	
	public QnaReply() {
		// TODO Auto-generated constructor stub
	}


	public int getReplyNo() {
		return replyNo;
	}


	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getCntReplyLike() {
		return cntReplyLike;
	}


	public void setCntReplyLike(int cntReplyLike) {
		this.cntReplyLike = cntReplyLike;
	}


	public Date getReg_date() {
		return reg_date;
	}


	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


	@Override
	public String toString() {
		return "TechReply [replyNo=" + replyNo + ", boardNo=" + boardNo + ", member=" + member + ", replytext="
				+ replytext + ", regdate=" + regdate + ", cntReplyLike=" + cntReplyLike + ", reg_date=" + reg_date
				+ "]";
	}
	
	
	
	
	

}
