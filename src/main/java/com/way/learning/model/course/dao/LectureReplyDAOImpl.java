package com.way.learning.model.course.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.course.vo.LectureReply;

@Repository
public class LectureReplyDAOImpl implements LectureReplyDAO {
	@Autowired
	private SqlSession sqlSession;

	public int insertReply(LectureReply rvo){

		return sqlSession.insert("lectureReplyMapper.insertReply", rvo);
	}

	public List<LectureReply> selectListReply(int lectureNo, int courseNo){

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("lectureNo", lectureNo);
		map.put("courseNo", courseNo);

		return sqlSession.selectList("lectureReplyMapper.selectListReply", map);
	}
	

	
	public int updateReply(HashMap<String, Object> mapParam){

		return sqlSession.update("lectureReplyMapper.updateReply", mapParam);
	}
	
	
	
	public String selectUpdatedReply(HashMap<String, Object> mapParam){

		return sqlSession.selectOne("lectureReplyMapper.selectUpdatedReply", mapParam);
	}
	
	
	public int deleteReply(HashMap<String, Object> mapParam){

		return sqlSession.delete("lectureReplyMapper.deleteReply", mapParam);
	}
	
	

}
