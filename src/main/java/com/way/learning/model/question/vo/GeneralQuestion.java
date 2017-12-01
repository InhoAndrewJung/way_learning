package com.way.learning.model.question.vo;

public class GeneralQuestion {
	
	    private int questionNo;
	    private String question;
	    private String answer;
	    private int cntSubmit;
	    private int cntRight;
		
	    public GeneralQuestion(int questionNo, String question, String answer, int cntSubmit, int cntRight) {
			super();
			this.questionNo = questionNo;
			this.question = question;
			this.answer = answer;
			this.cntSubmit = cntSubmit;
			this.cntRight = cntRight;
		}
	    
	    
		public GeneralQuestion() {
			// TODO Auto-generated constructor stub
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


		@Override
		public String toString() {
			return "GeneralQuestion [questionNo=" + questionNo + ", question=" + question + ", answer=" + answer
					+ ", cntSubmit=" + cntSubmit + ", cntRight=" + cntRight + "]";
		}
		
		


}
