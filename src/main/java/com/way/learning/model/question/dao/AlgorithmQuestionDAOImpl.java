package com.way.learning.model.question.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.question.vo.AlgorithmQuestion;


@Repository
public class AlgorithmQuestionDAOImpl implements AlgorithmQuestionDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int write(AlgorithmQuestion vo, String userId) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.insert("algoQuestionMapper.write", vo);
		return 0;
	}

	@Override
	public void delete(String no) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.delete("algoQuestionMapper.delete",no);
	}

	@Override
	public List<AlgorithmQuestion> getQuestionList(String pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("algoQuestionMapper.getAlgorithmQuestionList",pageNo);
		
	}

	@Override
	public AlgorithmQuestion showContent(String no) throws SQLException {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("algoQuestionMapper.showContent",no);
	}

	@Override
	public void updateRight(String no) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.update("algoQuestionMapper.updateRight",no);
	}

	@Override
	public String getAnswer(String no) throws SQLException {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("algoQuestionMapper.getAnswer",no);
	}

	@Override
	public void updateSubmit(String no, String userId) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.update("algoQuestionMapper.updateSubmit",no, userId);
		
	}

	

}
