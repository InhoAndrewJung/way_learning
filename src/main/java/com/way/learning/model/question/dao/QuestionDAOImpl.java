package com.way.learning.model.question.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.question.vo.AnswerResult;
import com.way.learning.model.question.vo.GeneralChoice;
import com.way.learning.model.question.vo.GeneralQuestion;

@Repository
public class QuestionDAOImpl implements QuestionDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertQuestion(GeneralQuestion gq) throws SQLException {
		System.out.println("before insertQuestion");
		sqlSession.insert("questionMapper.insertQuestion", gq);
		System.out.println("after insertQuestion");

	}

	@Override
	public void insertAnswerChoice(String[] answerChoice) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println("insertAnswerChoice");

		Map<String,Object> map = new HashMap<String,Object>();
		for(int i=0;i<answerChoice.length;i++) {

			if(answerChoice[i] ==null || answerChoice[i].equals(""))  break;
			map.put("answerOrder", i);
			map.put("answerChoice", answerChoice[i]);
			sqlSession.insert("questionMapper.insertAnswerChoice", map);

		}
	}


	@Override
	public List<GeneralQuestion> getList(String keyword, String sorting) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("sorting", sorting);
		return sqlSession.selectList("questionMapper.getList",map);

	}
	
	@Override
	public GeneralQuestion multipleChoiceContent(int questionNo) throws SQLException {

		return sqlSession.selectOne("questionMapper.multipleChoiceContent",questionNo);

	}
	
	@Override
	public List<GeneralChoice> getAnswerChoice(int questionNo) throws SQLException {

		return sqlSession.selectList("questionMapper.getAnswerChoice",questionNo);

	}

	

	@Override
	public int checkAnswer(int questionNo,String answer) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("answer", answer);
		return sqlSession.selectOne("questionMapper.checkAnswer",map);

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}






