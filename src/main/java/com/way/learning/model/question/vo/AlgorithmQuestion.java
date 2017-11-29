package com.way.learning.model.question.vo;

public class AlgorithmQuestion {

		private int questionNo;
	    private String question;
	    private String input;
	    private String output;
	    private String language;
	    private String answer;
	    private int cntSubmit;
	    private int cntRight;
		
	    public AlgorithmQuestion() {
			super();
		}

		public AlgorithmQuestion(int questionNo, String question, String input, String output, String language,
				String answer, int cntSubmit, int cntRight) {
			super();
			this.questionNo = questionNo;
			this.question = question;
			this.input = input;
			this.output = output;
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
