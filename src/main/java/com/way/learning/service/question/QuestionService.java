package com.way.learning.service.question;

import java.sql.SQLException;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.model.question.vo.GeneralChoice;
import com.way.learning.model.question.vo.GeneralQuestion;

public interface QuestionService {

	public void insertGeneralQuestion(GeneralQuestion gq, String[] answerChoice) throws SQLException;

	public void insertEssayQuestion(AlgorithmQuestion aq) throws SQLException;

	public List<GeneralQuestion> getGeneralList( String keyword, String sorting) throws SQLException;

	public int countArticle(String keyword) throws SQLException;

	public List<AlgorithmQuestion> getEssayList(String keyword) throws SQLException;

	public GeneralQuestion showGeneralContent(int questionNo) throws SQLException;

	public AlgorithmQuestion showEssayContent(int questionNo) throws SQLException;

	public List<GeneralChoice> getAnswerChoice(int questionNo) throws SQLException;

	public int checkAnswer(int questionNo, String answer) throws SQLException;

	// 수정,삭제 추가
	public void updateQuestion(GeneralQuestion qvo, String[] answerChoice) throws SQLException;

	public int deleteQuestion(int questionNo) throws SQLException;

}
