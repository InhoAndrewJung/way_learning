package com.way.learning.service.course;

import java.util.List;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.course.vo.LectureBoard;

public interface LectureBoardService {
	public List selectMyCourseNo(String userId);
	public int insertLecture(LectureBoard lvo);
	public List<LectureBoard> selectLectureList(int courseNo);
	public Course selectCourse(int courseNo, String userId);
	public List<String> selectCourseTag(int courseNo);
	public LectureBoard selectLecture(int lectureNo,int courseNo);
	public int deleteLecture(int lectureNo,int courseNo);
	public int updateLecture(LectureBoard lvo);
	public int isCourseLike(int courseNo, String userId);
	public int isCourseRecommend(int courseNo, String userId);
	public int selectCntCourseLike(int courseNo);
	public int changeMyLecutreRecord(int courseNo, int lectureNo,String userId); 
	public int isMyLectureRecordExist(int courseNo, int lectureNo,String userId);
	

}
