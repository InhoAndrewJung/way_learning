package com.way.learning.service.course;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.course.dao.LectureBoardDAO;
import com.way.learning.model.course.vo.Course;
import com.way.learning.model.course.vo.LectureBoard;

@Service
public class LectureBoardServiceImpl implements LectureBoardService {
	
	@Autowired
	private  LectureBoardDAO lectureBoardDAO;
	
	public List selectMyCourseNo(String userId){
		return  lectureBoardDAO.selectMyCourseNo(userId);
	}
	
	public int insertLecture(LectureBoard lvo){
		return lectureBoardDAO.insertLecture(lvo);

	}
	
	public List<String> selectLectureName(int courseNo){

		return lectureBoardDAO.selectLectureName(courseNo);
		
		
	}
	
	public Course selectMyCourse(int courseNo, String userId){
		

		return lectureBoardDAO.selectMyCourse(courseNo, userId);

	}
	
	
	

}
