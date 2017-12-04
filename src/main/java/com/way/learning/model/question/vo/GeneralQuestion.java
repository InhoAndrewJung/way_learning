package com.way.learning.model.question.vo;

public class GeneralQuestion {

	 	private int questionNo;
	    private String question;
	    private String language;
	    private String answer;
	    private int cntSubmit;
	    private int cntRight;
	    
	    
		public GeneralQuestion() {
			super();
		}


		public GeneralQuestion(int questionNo, String question, String language, String answer, int cntSubmit,
				int cntRight) {
			super();
			this.questionNo = questionNo;
			this.question = question;
			this.language = language;
			this.answer = answer;
			this.cntSubmit = cntSubmit;
			this.cntRight = cntRight;
		}


		public int getQuestionNo() {
			return questionNo;
		}


		public void setQuestionNo(int questionNo) {
			this.questionNo = questionNo;
		}


		public String getQuestion() {
			return question;
		}


		public void setQuestion(String question) {
			this.question = question;
		}


		public String getLanguage() {
			return language;
		}


		public void setLanguage(String language) {
			this.language = language;
		}


		public String getAnswer() {
			return answer;
		}


		public void setAnswer(String answer) {
			this.answer = answer;
		}


		public int getCntSubmit() {
			return cntSubmit;
		}


		public void setCntSubmit(int cntSubmit) {
			this.cntSubmit = cntSubmit;
		}


		public int getCntRight() {
			return cntRight;
		}


		public void setCntRight(int cntRight) {
			this.cntRight = cntRight;
		}


		
		
	    

}
