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
	
	public List<LectureBoard> selectLectureList(int courseNo){

		return lectureBoardDAO.selectLectureList(courseNo);
		
		
	}
	
	public Course selectMyCourse(int courseNo, String userId){
		

		return lectureBoardDAO.selectMyCourse(courseNo, userId);

	}
	
	public List<String> selectCourseTag(int courseNo) {

		return lectureBoardDAO.selectCourseTag(courseNo);

	}
	
	public LectureBoard selectLecture(int lectureNo,int courseNo) {

		return lectureBoardDAO.selectLecture(lectureNo,courseNo);

	}
	
	public int deleteLecture(int lectureNo,int courseNo) {
		
		
		
		return lectureBoardDAO.deleteLecture(lectureNo, courseNo);
	
	}
	
	public int updateLecture(LectureBoard lvo) {

		

		return lectureBoardDAO.updateLecture(lvo);

	}
	
	
	

}
