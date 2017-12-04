package com.way.learning.model.question.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.model.question.vo.GeneralQuestion;

@Repository
public class GeneralQuestionDAOImpl implements GeneralQuestionDAO{

	@Autowired
	SqlSession sqlSession;
	@Override
	public int write(GeneralQuestion vo) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.insert("generalQuestionMapper.write", vo);
		return 0;
	}

	@Override
	public void delete(String no) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.delete("generalQuestionMapper.delete",no);
	}

	@Override
	public List<GeneralQuestion> getQuestionList(String pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("generalQuestionMapper.getGeneralQuestionList",pageNo);
	}

	@Override
	public GeneralQuestion showContent(String no) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("generalQuestionMapper.showContent",no);
	}

	@Override
	public void updateSubmit(String no) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.update("generalQuestionMapper.updateSubmit",no);
	}

	@Override
	public void updateRight(String no) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.update("generalQuestionMapper.updateRight",no);
	}

}
