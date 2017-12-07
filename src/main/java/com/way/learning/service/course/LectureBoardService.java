package com.way.learning.service.course;

import java.util.List;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.course.vo.LectureBoard;

public interface LectureBoardService {
	public List selectMyCourseNo(String userId);
	public int insertLecture(LectureBoard lvo);
	public List<String> selectLectureName(int courseNo);
	public Course selectMyCourse(int courseNo, String userId);

}
