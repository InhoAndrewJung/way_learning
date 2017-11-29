package com.way.learning.model.question.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.service.question.AlgorithmListVO;

public class AlgorithmQuestionDAOImpl implements AlgorithmQuestionDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int write(AlgorithmQuestion vo) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.insert("questionMapper.write", vo);
		return 0;
	}

	@Override
	public void delete(String no) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.delete("questionMapper.delete",no);
	}

	@Override
	public List<AlgorithmQuestion> getQuestionList(String pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("questionMapper.getAlgorithmQuestionList",pageNo);
		
	}

	@Override
	public AlgorithmQuestion showContent(String no) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.selectOne("questionMapper.showContent",no);
		return null;
	}

	@Override
	public void updateSubmit(String no) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.update("questionMapper.updateSubmit",no);
	}

	@Override
	public void updateRight(String no) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.update("questionMapper.updateRight",no);
	}

}
