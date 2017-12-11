package com.way.learning.service.question;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.question.dao.QuestionDAO;
import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.model.question.vo.GeneralChoice;
import com.way.learning.model.question.vo.GeneralQuestion;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDAO questionDAO;

	@Override
	public void insertGeneralQuestion(GeneralQuestion gq, String[] answerChoice) throws SQLException {
		System.out.println("insertGeneralQuestion 서비스 입성");
		questionDAO.insertGeneralQuestion(gq);
		questionDAO.insertAnswerChoice(answerChoice);

	}

	@Override
	public void insertEssayQuestion(AlgorithmQuestion aq) throws SQLException {
		System.out.println("insertEssayQuestion 서비스 입성");
		questionDAO.insertEssayQuestion(aq);

	}

	public List<GeneralQuestion> getGeneralList(String keyword, String sorting) throws SQLException {
		return questionDAO.getGeneralList(keyword, sorting);
	}
	
	
	public List<AlgorithmQuestion> getEssayList(String keyword) throws SQLException {
		return questionDAO.getEssayList(keyword);
	}

	public GeneralQuestion showGeneralContent(int questionNo) throws SQLException {

		return questionDAO.showGeneralContent(questionNo);

	}

	public AlgorithmQuestion showEssayContent(int questionNo) throws SQLException {

		return questionDAO.showEssayContent(questionNo);

	}

	@Override
	public List<GeneralChoice> getAnswerChoice(int questionNo) throws SQLException {

		return questionDAO.getAnswerChoice(questionNo);

	}

	@Override
	public int checkAnswer(int questionNo, String answer) throws SQLException {

		return questionDAO.checkAnswer(questionNo, answer);

	}

	// 수정 삭제 추가
	@Override
	public void updateQuestion(GeneralQuestion qvo,String[] answerChoice) throws SQLException {

		questionDAO.updateQuestion(qvo);
		
		System.out.println(qvo.getCategory());
		if (qvo.getCategory().equals("multipleChoice")) {
			questionDAO.deleteAnswerChoice(qvo.getQuestionNo());
			questionDAO.insertAnswerChoice(answerChoice);
		}
		
	}


	@Override
	public int deleteQuestion(int questionNo) throws SQLException {

		return questionDAO.deleteQuestion(questionNo);
	}

	

}
