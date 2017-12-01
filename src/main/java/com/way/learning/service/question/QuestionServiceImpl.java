package com.way.learning.service.question;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.question.dao.QuestionDAO;
import com.way.learning.model.question.vo.GeneralQuestion;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionDAO questionDAO;

	@Override
	public void insertQuestion(GeneralQuestion gq, String[] answerChoice) throws SQLException {
		System.out.println("insertQuestion 서비스 입성");
		questionDAO.insertQuestion(gq);
		questionDAO.insertAnswerChoice(answerChoice);
			
	
		
	}
	
	
	
	
	

}
