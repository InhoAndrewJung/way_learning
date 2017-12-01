package com.way.learning.model.board.qna.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.way.learning.model.member.vo.Member;



public class QnaBoard {
	
	private int boardNo;
	private Member member;  //writer,img_profile,활동사항도 가져오기
	private String title;
	private String content;
	private int cntView;
	private int cntReply;
	private int cntBoardLike;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDate;    //java.util   
	List<String> tag;
	public QnaBoard(int boardNo, Member member, String title, String content, int cntView, int cntReply,
			int cntBoardLike, Date regDate, List<String> tag) {
		super();
		this.boardNo = boardNo;
		this.member = member;
		this.title = title;
		this.content = content;
		this.cntView = cntView;
		this.cntReply = cntReply;
		this.cntBoardLike = cntBoardLike;
		this.regDate = regDate;
		this.tag = tag;
	}
	
	
	public QnaBoard() {
		// TODO Auto-generated constructor stub
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


	public int getCntView() {
		return cntView;
	}


	public void setCntView(int cntView) {
		this.cntView = cntView;
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


	public List<String> getTag() {
		return tag;
	}


	public void setTag(List<String> tag) {
		this.tag = tag;
	}


	@Override
	public String toString() {
		return "TechBoard [boardNo=" + boardNo + ", member=" + member + ", title=" + title + ", content=" + content
				+ ", cntView=" + cntView + ", cntReply=" + cntReply + ", cntBoardLike=" + cntBoardLike + ", regDate="
				+ regDate + ", tag=" + tag + "]";
	}
	
	
	
	
	
	
	

	
	
	

}
