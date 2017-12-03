package com.way.learning.service.question;

import java.sql.SQLException;
import java.util.List;

import com.way.learning.model.question.vo.GeneralChoice;
import com.way.learning.model.question.vo.GeneralQuestion;

public interface QuestionService {
	
	public void insertQuestion(GeneralQuestion gq, String[] answerChoice) throws SQLException;
	public List<GeneralQuestion> getList() throws SQLException;
	public GeneralQuestion multipleChoiceContent(int questionNo) throws SQLException;
	public List<GeneralChoice> getAnswerChoice(int questionNo) throws SQLException;
	public int checkAnswer(int questionNo,String answer) throws SQLException;

}
