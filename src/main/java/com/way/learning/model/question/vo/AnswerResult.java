package com.way.learning.model.question.vo;

public class AnswerResult {
<<<<<<< HEAD
=======
	
>>>>>>> master
	private String userId;
	private int questionNo;
	private int myCntSubmit;
	private int myCntWrong;
	private int myCntRight;
<<<<<<< HEAD

	public AnswerResult(String userId, int questionNo, int myCntSubmit, int myCntWrong, int myCntRight) {
=======
	private int ranking;
	private double myRightPercent;
	public AnswerResult(String userId, int questionNo, int myCntSubmit, int myCntWrong, int myCntRight, int ranking,
			double myRightPercent) {
>>>>>>> master
		super();
		this.userId = userId;
		this.questionNo = questionNo;
		this.myCntSubmit = myCntSubmit;
		this.myCntWrong = myCntWrong;
		this.myCntRight = myCntRight;
<<<<<<< HEAD
	}

	public AnswerResult() {
	}

=======
		this.ranking = ranking;
		this.myRightPercent = myRightPercent;
	}
	
	
	public AnswerResult() {
		// TODO Auto-generated constructor stub
	}


>>>>>>> master
	public String getUserId() {
		return userId;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public void setUserId(String userId) {
		this.userId = userId;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public int getQuestionNo() {
		return questionNo;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public int getMyCntSubmit() {
		return myCntSubmit;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public void setMyCntSubmit(int myCntSubmit) {
		this.myCntSubmit = myCntSubmit;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public int getMyCntWrong() {
		return myCntWrong;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public void setMyCntWrong(int myCntWrong) {
		this.myCntWrong = myCntWrong;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public int getMyCntRight() {
		return myCntRight;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public void setMyCntRight(int myCntRight) {
		this.myCntRight = myCntRight;
	}

<<<<<<< HEAD
	@Override
	public String toString() {
		return "AnswerResult [userId=" + userId + ", questionNo=" + questionNo + ", myCntSubmit=" + myCntSubmit
				+ ", myCntWrong=" + myCntWrong + ", myCntRight=" + myCntRight + "]";
	}
=======

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
				+ ", myCntWrong=" + myCntWrong + ", myCntRight=" + myCntRight + ", ranking=" + ranking
				+ ", myRightPercent=" + myRightPercent + "]";
	}
	
	
	
	
	
>>>>>>> master

}
