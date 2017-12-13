package com.way.learning.model.question.vo;

import com.way.learning.model.member.vo.Member;

<<<<<<< HEAD
=======

>>>>>>> master
public class AnswerResult {

	private Member member;
	private int questionNo;
	private int myCntSubmit;
	private int myCntWrong;
	private int myCntRight;

	private int ranking;
	private double myRightPercent;

	private int myCntError;

	public AnswerResult(Member member, int questionNo, int myCntSubmit, int myCntWrong, int myCntRight, int ranking,
			double myRightPercent, int myCntError) {
		super();
		this.member = member;
		this.questionNo = questionNo;
		this.myCntSubmit = myCntSubmit;
		this.myCntWrong = myCntWrong;
		this.myCntRight = myCntRight;
		this.ranking = ranking;
		this.myRightPercent = myRightPercent;
		this.myCntError = myCntError;
	}
	
<<<<<<< HEAD
=======
	
>>>>>>> master
	public AnswerResult() {
		// TODO Auto-generated constructor stub
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public Member getMember() {
		return member;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public void setMember(Member member) {
		this.member = member;
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

<<<<<<< HEAD
=======

>>>>>>> master
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

<<<<<<< HEAD
=======

>>>>>>> master
	public int getMyCntError() {
		return myCntError;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	public void setMyCntError(int myCntError) {
		this.myCntError = myCntError;
	}

<<<<<<< HEAD
=======

>>>>>>> master
	@Override
	public String toString() {
		return "AnswerResult [member=" + member + ", questionNo=" + questionNo + ", myCntSubmit=" + myCntSubmit
				+ ", myCntWrong=" + myCntWrong + ", myCntRight=" + myCntRight + ", ranking=" + ranking
				+ ", myRightPercent=" + myRightPercent + ", myCntError=" + myCntError + "]";
	}
	
	

	

}
