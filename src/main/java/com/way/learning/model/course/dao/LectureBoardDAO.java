package com.way.learning.model.course.dao;

import java.util.List;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.course.vo.LectureBoard;

public interface LectureBoardDAO {
	public List selectMyCourseNo(String userId);
	public int insertLecture(LectureBoard lvo);
	public List<LectureBoard> selectLectureList(int courseNo);
	public Course selectMyCourse(int courseNo, String userId);
	public List<String> selectCourseTag(int courseNo) ;
	public LectureBoard selectLecture(int lectureNo,int courseNo);
	public int deleteLecture(int lectureNo,int courseNo);
	public int updateLecture(LectureBoard lvo);

}
