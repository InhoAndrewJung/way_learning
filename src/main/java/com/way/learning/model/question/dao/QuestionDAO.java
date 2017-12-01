package com.way.learning.model.question.dao;

import java.sql.SQLException;

import com.way.learning.model.question.vo.GeneralQuestion;

public interface QuestionDAO {
	
	public void insertQuestion(GeneralQuestion gq) throws SQLException;
	public void insertAnswerChoice(String[] answerChoice) throws SQLException;

}
