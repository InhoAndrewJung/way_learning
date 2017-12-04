package com.way.learning.util;

public class Data {
	String error;
	String result;
	String answerResult;
	
	public Data() {
		super();
	}

	public Data(String error, String result, String answerResult) {
		super();
		this.error = error;
		this.result = result;
		this.answerResult = answerResult;
	}

	public String getError() {
		return error;
	}

	public String getResult() {
		return result;
	}
	
	public String getAnswerResult() {
		return answerResult;
	}
	
	
	
}
