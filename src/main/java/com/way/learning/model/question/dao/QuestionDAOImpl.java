package com.way.learning.model.question.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.question.vo.GeneralQuestion;

@Repository
public class QuestionDAOImpl implements QuestionDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertQuestion(GeneralQuestion gq) throws SQLException {
		sqlSession.insert("questionMapper.insertAnswerChoice", gq);
		
	}

	@Override
	public void insertAnswerChoice(String[] answerChoice) throws SQLException {
		// TODO Auto-generated method stub

		
		Map<String,Object> map = new HashMap<String,Object>();
		for(int i=0;i<answerChoice.length;i++) {
			
			if(answerChoice[i] ==null || answerChoice[i].equals(""))  break;
			map.put("questionNo", i);
			map.put("answerChoice", answerChoice[i]);	
			sqlSession.insert("questionMapper.insertAnswerChoice", map);
		
	}
		
		
	}
	
	
	
	

}
