package com.way.learning.model.course.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LectureReplyDAOImpl implements LectureReplyDAO {
	@Autowired
	private SqlSession sqlSession;

}
