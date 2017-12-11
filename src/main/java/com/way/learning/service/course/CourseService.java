package com.way.learning.service.course;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.way.learning.model.course.vo.Course;

public interface CourseService {

	public int insertCourse(Course cvo ,HttpServletRequest request)throws Exception;

	public List<Course> selectMycourseList(String userId) throws Exception;

	public Course selectMyCourse(String userId,int courseNo) throws Exception;

	public List<String> selectCourseTag(int courseNo) throws Exception;
	public int deleteCourse(int courseNo) throws Exception;
	public int updateCourse(Course cvo, HttpServletRequest request) throws Exception;
	public List<Course> selectAccetpedCourseList() throws Exception;



}
