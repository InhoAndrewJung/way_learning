package com.way.learning.model.course.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.course.vo.Course;

@Repository
public class CourseDAOImpl implements CourseDAO {

	@Autowired
	private SqlSession sqlSession;

	public int insertCourse(Course course) throws Exception{

		return sqlSession.insert("courseMapper.insertCourse", course);

	}


	public int insertTags(String tags) throws Exception{

		return sqlSession.insert("courseMapper.insertTags", tags);

	}



	public List<Course> selectMycourseList(String userId) throws Exception{

		return sqlSession.selectList("courseMapper.selectMyCourseList", userId);

	}


	public Course selectMyCourse(String userId,int courseNo) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("courseNo", courseNo);

		return sqlSession.selectOne("courseMapper.selectMyCourse", map);

	}

	public List<String> selectCourseTag(int courseNo) throws Exception{

		return sqlSession.selectList("courseMapper.selectCourseTag", courseNo);

	}


	public int deleteCourse(int courseNo) throws Exception{

		return sqlSession.delete("courseMapper.deleteCourse", courseNo);

	}


	public int updateCourse(Course cvo) throws Exception{
		
		
		return sqlSession.update("courseMapper.updateCourse", cvo);

	}



	public int delteTags(int  courseNo) throws Exception{
		
		
		return sqlSession.delete("courseMapper.deleteTags", courseNo);
	}


	

	public List<Course> selectAccetpedCourseList() throws Exception{

		return sqlSession.selectList("courseMapper.selectAccetpedCourseList");

	}






}
