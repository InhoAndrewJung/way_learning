package com.way.learning.model.question.vo;

public class GeneralQuestion {
	
	    private int questionNo;
	    private String question;
	    private String title;
	    private String answer;
	    private int cntSubmit;
	    private int cntRight;
	    private String category;
	    
		public GeneralQuestion(int questionNo, String question, String title, String answer, int cntSubmit,
				int cntRight, String category) {
			super();
			this.questionNo = questionNo;
			this.question = question;
			this.title = title;
			this.answer = answer;
			this.cntSubmit = cntSubmit;
			this.cntRight = cntRight;
			this.category = category;
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

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
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

		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		@Override
		public String toString() {
			return "GeneralQuestion [questionNo=" + questionNo + ", question=" + question + ", title=" + title
					+ ", answer=" + answer + ", cntSubmit=" + cntSubmit + ", cntRight=" + cntRight + ", category="
					+ category + "]";
		}
	    
	    
	  
	    
	    
	    
	    

	}
