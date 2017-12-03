package com.way.learning.model.question.vo;

public class AnswerResult {
	
	private String userId;
	private int questionNo;
	private int myCntSubmit;
	private int myCntWrong;
	private int myCntRight;
	public AnswerResult(String userId, int questionNo, int myCntSubmit, int myCntWrong, int myCntRight) {
		super();
		this.userId = userId;
		this.questionNo = questionNo;
		this.myCntSubmit = myCntSubmit;
		this.myCntWrong = myCntWrong;
		this.myCntRight = myCntRight;
	}

	
	public AnswerResult() {
		// TODO Auto-generated constructor stub
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getQuestionNo() {
		return questionNo;
	}


	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}


	public int getMyCntSubmit() {
		return myCntSubmit;
	}


	public void setMyCntSubmit(int myCntSubmit) {
		this.myCntSubmit = myCntSubmit;
	}


	public int getMyCntWrong() {
		return myCntWrong;
	}


	public void setMyCntWrong(int myCntWrong) {
		this.myCntWrong = myCntWrong;
	}


	public int getMyCntRight() {
		return myCntRight;
	}


	public void setMyCntRight(int myCntRight) {
		this.myCntRight = myCntRight;
	}


	@Override
	public String toString() {
		return "AnswerResult [userId=" + userId + ", questionNo=" + questionNo + ", myCntSubmit=" + myCntSubmit
				+ ", myCntWrong=" + myCntWrong + ", myCntRight=" + myCntRight + "]";
	}
	

}
