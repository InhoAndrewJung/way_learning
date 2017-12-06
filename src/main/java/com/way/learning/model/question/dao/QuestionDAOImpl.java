package com.way.learning.model.question.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.model.question.vo.AnswerResult;
import com.way.learning.model.question.vo.GeneralChoice;
import com.way.learning.model.question.vo.GeneralQuestion;

@Repository
public class QuestionDAOImpl implements QuestionDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertGeneralQuestion(GeneralQuestion gq) throws SQLException {

		sqlSession.insert("questionMapper.insertGeneralQuestion", gq);

	}

	@Override
	public void insertEssayQuestion(AlgorithmQuestion aq) throws SQLException {

		sqlSession.insert("questionMapper.insertEssayQuestion", aq);

	}

	@Override
	public void insertAnswerChoice(String[] answerChoice) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("insertAnswerChoice");

		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < answerChoice.length; i++) {

			if (answerChoice[i] == null || answerChoice[i].equals(""))
				break;
			map.put("answerOrder", i);
			map.put("answerChoice", answerChoice[i]);
			sqlSession.insert("questionMapper.insertAnswerChoice", map);

		}
	}

	@Override
	public List<GeneralQuestion> getGeneralList(String keyword, String sorting) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("sorting", sorting);
		return sqlSession.selectList("questionMapper.getGeneralList", map);

	}

	@Override
	public List<AlgorithmQuestion> getEssayList(String keyword) throws SQLException {

		return sqlSession.selectList("questionMapper.getEssayList", keyword);

	}

	@Override
	public GeneralQuestion showGeneralContent(int questionNo) throws SQLException {

		return sqlSession.selectOne("questionMapper.showGeneralContent", questionNo);

	}

	@Override
	public AlgorithmQuestion showEssayContent(int questionNo) throws SQLException {

		return sqlSession.selectOne("questionMapper.showEssayContent", questionNo);

	}

	@Override
	public List<GeneralChoice> getAnswerChoice(int questionNo) throws SQLException {

		return sqlSession.selectList("questionMapper.getAnswerChoice", questionNo);

	}

	@Override
	public int checkAnswer(int questionNo, String answer) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("questionNo", questionNo);
		map.put("answer", answer);
		return sqlSession.selectOne("questionMapper.checkAnswer", map);

	}

	// 수정 삭제 추가
	@Override
	public void updateQuestion(GeneralQuestion qvo) throws SQLException {
		sqlSession.update("questionMapper.updateQuestion", qvo);
	}

	@Override
	public void updateAnswerChoice(int questionNo, String[] answerChoice) throws SQLException {
		
		System.out.println("GeneralAnswerChoice");

		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < answerChoice.length; i++) {

			if (answerChoice[i] == null || answerChoice[i].equals(""))
				break;
			map.put("questionNo", questionNo);
			map.put("answerOrder", i);
			map.put("answerChoice", answerChoice[i]);
		sqlSession.update("questionMapper.updateAnswerChoice", map);

		}
		
	
	}

	@Override
	public int deleteBoard(int questionNo) throws SQLException {
		return sqlSession.delete("questionMapper.deleteBoard", questionNo);
	}

	@Override
	public int deleteAnswer(int questionNo) throws SQLException {
		
	return sqlSession.delete("questionMapper.deleteAnswer", questionNo);
	}

}
