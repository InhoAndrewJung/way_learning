package com.way.learning.model.course.dao;

import java.util.List;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.course.vo.LectureBoard;

public interface LectureBoardDAO {
	public List selectMyCourseNo(String userId);
	public int insertLecture(LectureBoard lvo);
	public int isLectureOrderExist(int courseNo,int lectureOrder);
	public List<LectureBoard> selectLectureList(int courseNo);
	public Course selectCourse(int courseNo, String userId);
	public List<String> selectCourseTag(int courseNo) ;
	public LectureBoard selectLecture(int lectureNo,int courseNo);
	public int deleteLecture(int lectureNo,int courseNo);
	public int updateLecture(LectureBoard lvo);
	public int isCourseLike(int courseNo, String userId);
	public int isCourseRecommend(int courseNo, String userId);
	public int insertCourseLike(int courseNo, String userId);
	public int deleteCourseLike( int courseNo, String userId);
	public int selectCntCourseLike(int courseNo);
	public int increaseCntCourseLike(int courseNo);
	public int decreaseCntCourseLike(int courseNo);
	public int isMyLectureRecordExist(int courseNo, int lectureNo,String userId);
	public int insertMyLectureRecord(int courseNo, int lectureNo,String userId);
	public int deleteMyLectureRecord(int courseNo, int lectureNo,String userId);

}
