package com.way.learning.model.question.vo;

public class GeneralChoice {
	
	private int questionNo;
	private String answerChoice;
	public GeneralChoice(int questionNo, String answerChoice) {
		super();
		this.questionNo = questionNo;
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

	public String getAnswerChoice() {
		return answerChoice;
	}

	public void setAnswerChoice(String answerChoice) {
		this.answerChoice = answerChoice;
	}

	@Override
	public String toString() {
		return "GeneralChoice [questionNo=" + questionNo + ", answerChoice=" + answerChoice + "]";
	}
	
	
	
	

}
