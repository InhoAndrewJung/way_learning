package com.way.learning.model.question.vo;

public class AlgorithmQuestion {
	private Integer questionNo;
	private String title;
	private String question;
	private String input;
	private String output;
	private String answer;
	private Integer cntSubmit;
	private Integer cntRight;

	public AlgorithmQuestion(Integer questionNo, String title, String question, String input, String output,
			String answer, Integer cntSubmit, Integer cntRight) {
		super();
		this.questionNo = questionNo;
		this.title = title;
		this.question = question;
		this.input = input;
		this.output = output;
		this.answer = answer;
		this.cntSubmit = cntSubmit;
		this.cntRight = cntRight;
	}

	public AlgorithmQuestion() {
	}

	public Integer getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(Integer questionNo) {
		this.questionNo = questionNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getCntSubmit() {
		return cntSubmit;
	}

	public void setCntSubmit(Integer cntSubmit) {
		this.cntSubmit = cntSubmit;
	}

	public Integer getCntRight() {
		return cntRight;
	}

	public void setCntRight(Integer cntRight) {
		this.cntRight = cntRight;
	}

	@Override
	public String toString() {
		return "AlgorithmQuestion [questionNo=" + questionNo + ", title=" + title + ", question=" + question
				+ ", input=" + input + ", output=" + output + ", answer=" + answer + ", cntSubmit=" + cntSubmit
				+ ", cntRight=" + cntRight + "]";
	}

}
