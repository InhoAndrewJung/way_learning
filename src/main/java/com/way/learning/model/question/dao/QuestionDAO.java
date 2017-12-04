package com.way.learning.model.question.dao;

import java.sql.SQLException;
import java.util.List;

import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.model.question.vo.GeneralChoice;
import com.way.learning.model.question.vo.GeneralQuestion;

public interface QuestionDAO {
	
	public void insertGeneralQuestion(GeneralQuestion gq) throws SQLException;
	public void insertAnswerChoice(String[] answerChoice) throws SQLException;
	public void insertEssayQuestion(AlgorithmQuestion aq) throws SQLException;
	public List<GeneralQuestion> getGeneralList(String keyword, String sorting) throws SQLException;
	public List<AlgorithmQuestion> getEssayList(String keyword) throws SQLException;
	public GeneralQuestion showGeneralContent(int questionNo) throws SQLException;
	public AlgorithmQuestion showEssayContent(int questionNo) throws SQLException; 
	public List<GeneralChoice> getAnswerChoice(int questionNo) throws SQLException;
	public int checkAnswer(int questionNo,String answer) throws SQLException;
}
