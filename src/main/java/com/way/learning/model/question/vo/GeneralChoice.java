package com.way.learning.model.question.vo;

import java.util.Date;

public class GeneralChoice {
	
	private int questionNo;
	private int answerOrder;
	private String answerChoice;
	public GeneralChoice(int questionNo, int answerOrder, String answerChoice) {
		super();
		this.questionNo = questionNo;
		this.answerOrder = answerOrder;
		this.answerChoice = answerChoice;
	}
	
	
	public GeneralChoice() {
		// TODO Auto-generated constructor stub
	}


	public int getQuestionNo() {
		return questionNo;
	}


	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}


	public int getAnswerOrder() {
		return answerOrder;
	}


	public void setAnswerOrder(int answerOrder) {
		this.answerOrder = answerOrder;
	}


	public String getAnswerChoice() {
		return answerChoice;
	}


	public void setAnswerChoice(String answerChoice) {
		this.answerChoice = answerChoice;
	}


	@Override
	public String toString() {
		return "GeneralChoice [questionNo=" + questionNo + ", answerOrder=" + answerOrder + ", answerChoice="
				+ answerChoice + "]";
	}
	
	
	
	
	
	

}
