package com.way.learning.model.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.member.vo.Member;

@Service
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List selectActiveMember(){
		return sqlSession.selectList("adminMapper.selectActiveMember");
	}
	

	public int changeAuthority(String userId,String role){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("role", role);
		return sqlSession.update("adminMapper.changeAuthority",map);
	}
	
	
	
	public List<Course> selectAllCourseList() {

		return sqlSession.selectList("adminMapper.selectAllCourseList");

	}
	
	
	public int changeAcceptStatus(String isAccept,String courseNo) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isAccept", isAccept);
		map.put("courseNo", courseNo);
		System.out.println("다오임플 isAccept:"+isAccept);
		System.out.println("다오임플 courseNo:"+courseNo);
		return sqlSession.update("adminMapper.changeAcceptStatus",map);
	}

}
