package com.way.learning.aop.model.answer;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDAOImpl implements AnswerDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public int updatePostCntSubmit(int questionNo)throws SQLException{
		
		return sqlsession.update("updateAnswerMapper.updatePostCntSubmit",questionNo);
	}
	
public int updatePostCntRight(int questionNo)throws SQLException{
		
		return sqlsession.update("updateAnswerMapper.updatePostCntRight",questionNo);
	}
	
	
	public int updateMyCntSubmit(int questionNo, String userId)throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		return sqlsession.update("updateAnswerMapper.updateMyCntSubmit",map);
	}
	
	public int insertMyCntsubmit(int questionNo, String userId)throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		return sqlsession.insert("updateAnswerMapper.insertMyCntsubmit",map);
	}
	
	
	
	public int updateMyCntRight(int questionNo, String userId)throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		return sqlsession.update("updateAnswerMapper.updateMyCntRight",map);
	}	

	public int insertMyCntRight(int questionNo, String userId)throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		return sqlsession.insert("updateAnswerMapper.insertMyCntRight",map);
	}
	
	public int updateMyCntWrong(int questionNo, String userId)throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		return sqlsession.update("updateAnswerMapper.updateMyCntWrong",map);
	}	

	public int insertMyCntWrong(int questionNo, String userId)throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		return sqlsession.insert("updateAnswerMapper.insertMyCntWrong",map);
	}
		
	

	
	
	
	
	
	
	
	

}
