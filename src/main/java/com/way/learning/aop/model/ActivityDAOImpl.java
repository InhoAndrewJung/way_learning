package com.way.learning.aop.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.board.tech.vo.TechBoard;

@Repository
public class ActivityDAOImpl implements ActivityDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int updateLikeActivity(String userId)throws SQLException{
		
		
		
		
		return sqlSession.insert("activityMapper.updateLikeActivity",userId);
	}
	

}
