package com.way.learning.model.course.dao;

import java.util.List;

import com.way.learning.model.course.vo.Course;

public interface CourseDAO {

	public int insertCourse(Course course) throws Exception;

	public int insertTags(String tags,int courseNo) throws Exception;
	public List<Course> selectMycourseList(String userId) throws Exception;
	public Course selectMyCourse(String userId,int courseNo) throws Exception;
	public List<String> selectCourseTag(int courseNo) throws Exception;
	public int deleteCourse(int courseNo) throws Exception;
	public int updateCourse(Course course) throws Exception;
	public int deleteTags(int  courseNo) throws Exception;
	public List<Course> selectAccetpedCourseList() throws Exception;




}
