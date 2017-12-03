package com.way.learning.service.question;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.question.dao.QuestionDAO;
import com.way.learning.model.question.vo.GeneralChoice;
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
	
	
	public List<GeneralQuestion> getList() throws SQLException{
		return questionDAO.getList();
	}
	
	
	public GeneralQuestion multipleChoiceContent(int questionNo) throws SQLException {

		return questionDAO.multipleChoiceContent(questionNo);

	}
	
	@Override
	public List<GeneralChoice> getAnswerChoice(int questionNo) throws SQLException {

		return questionDAO.getAnswerChoice(questionNo);

	}
	@Override
	public int checkAnswer(int questionNo,String answer) throws SQLException {
		
		return questionDAO.checkAnswer(questionNo, answer);

	}
	
	
	

}
