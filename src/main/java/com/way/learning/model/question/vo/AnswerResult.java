package com.way.learning.model.question.vo;

public class AnswerResult {

	private String userId;
	private int questionNo;
	private int myCntSubmit;
	private int myCntWrong;
	private int myCntRight;
	private int myCntError;
	private int ranking;
	private double myRightPercent;
	public AnswerResult(String userId, int questionNo, int myCntSubmit, int myCntWrong, int myCntRight, int myCntError,
			int ranking, double myRightPercent) {
		super();
		this.userId = userId;
		this.questionNo = questionNo;
		this.myCntSubmit = myCntSubmit;
		this.myCntWrong = myCntWrong;
		this.myCntRight = myCntRight;
		this.myCntError = myCntError;
		this.ranking = ranking;
		this.myRightPercent = myRightPercent;
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


	public int getMyCntError() {
		return myCntError;
	}


	public void setMyCntError(int myCntError) {
		this.myCntError = myCntError;
	}


	public int getRanking() {
		return ranking;
	}


	public void setRanking(int ranking) {
		this.ranking = ranking;
	}


	public double getMyRightPercent() {
		return myRightPercent;
	}


	public void setMyRightPercent(double myRightPercent) {
		this.myRightPercent = myRightPercent;
	}


	@Override
	public String toString() {
		return "AnswerResult [userId=" + userId + ", questionNo=" + questionNo + ", myCntSubmit=" + myCntSubmit
				+ ", myCntWrong=" + myCntWrong + ", myCntRight=" + myCntRight + ", myCntError=" + myCntError
				+ ", ranking=" + ranking + ", myRightPercent=" + myRightPercent + "]";
	}
	
	


}
