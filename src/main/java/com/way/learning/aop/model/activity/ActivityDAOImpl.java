package com.way.learning.aop.model.activity;

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
	
	public int updateActivity(String userId,String behavior)throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("behavior", behavior);
		
		System.out.println("다오임플 액티비티 userId:"+userId);
		System.out.println("다오임플 액티비티 behavior:"+behavior);
		
		return sqlSession.update("activityMapper.updateActivity",map);
	}
	

}
