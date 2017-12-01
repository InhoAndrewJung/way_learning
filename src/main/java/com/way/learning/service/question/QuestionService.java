package com.way.learning.service.question;

import java.sql.SQLException;

import com.way.learning.model.question.vo.GeneralQuestion;

public interface QuestionService {
	
	public void insertQuestion(GeneralQuestion gq, String[] answerChoice) throws SQLException;

}
