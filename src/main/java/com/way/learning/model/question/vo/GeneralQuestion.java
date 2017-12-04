package com.way.learning.model.question.vo;

public class GeneralQuestion {

	
	    private int questionNo;
	    private String question;
	    private String answer;
	    private int cntSubmit;
	    private int cntRight;
	    private String category;
	    
	    public GeneralQuestion() {
			// TODO Auto-generated constructor stub
		}

		public GeneralQuestion(int questionNo, String question, String answer, int cntSubmit, int cntRight,
				String category) {
			super();
			this.questionNo = questionNo;
			this.question = question;
			this.answer = answer;
			this.cntSubmit = cntSubmit;
			this.cntRight = cntRight;
			this.category = category;
		}

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
		public String getQuestion() {
			return question;
		}

<<<<<<< HEAD

=======
>>>>>>> master
		public void setQuestion(String question) {
			this.question = question;
		}

<<<<<<< HEAD

		public String getLanguage() {
			return language;
		}


		public void setLanguage(String language) {
			this.language = language;
		}


=======
>>>>>>> master
		public String getAnswer() {
			return answer;
		}

<<<<<<< HEAD

=======
>>>>>>> master
		public void setAnswer(String answer) {
			this.answer = answer;
		}

<<<<<<< HEAD

=======
>>>>>>> master
		public int getCntSubmit() {
			return cntSubmit;
		}

<<<<<<< HEAD

=======
>>>>>>> master
		public void setCntSubmit(int cntSubmit) {
			this.cntSubmit = cntSubmit;
		}

<<<<<<< HEAD

=======
>>>>>>> master
		public int getCntRight() {
			return cntRight;
		}

<<<<<<< HEAD

=======
>>>>>>> master
		public void setCntRight(int cntRight) {
			this.cntRight = cntRight;
		}

<<<<<<< HEAD

		
		
	    

}
=======
		public String getCategory() {
			return category;
		}

		public void setCategory(String category) {
			this.category = category;
		}

		@Override
		public String toString() {
			return "GeneralQuestion [questionNo=" + questionNo + ", question=" + question + ", answer=" + answer
					+ ", cntSubmit=" + cntSubmit + ", cntRight=" + cntRight + ", category=" + category + "]";
		}
	    
	    
	    
	    
	    
	    

	}
>>>>>>> master
