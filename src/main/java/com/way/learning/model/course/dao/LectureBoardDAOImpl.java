package com.way.learning.model.course.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.course.vo.LectureBoard;

@Repository
public class LectureBoardDAOImpl implements LectureBoardDAO {
	@Autowired
	private SqlSession sqlSession;


	public List selectMyCourseNo(String userId){
		return  sqlSession.selectList("lectureBoardMapper.selectMyCourseNo", userId);
	}

	public int insertLecture(LectureBoard lvo){

		System.out.println("insertLecture 입성");

		int result=sqlSession.insert("lectureBoardMapper.insertLecture", lvo);
		return result;


	}

	public List<LectureBoard> selectLectureList(int courseNo){

		return sqlSession.selectList("lectureBoardMapper.selectLectureList", courseNo);


	}


	public Course selectMyCourse(int courseNo, String userId){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("courseNo", courseNo);

		return sqlSession.selectOne("lectureBoardMapper.selectMyCourse", map);

	}

	public List<String> selectCourseTag(int courseNo) {

		return sqlSession.selectList("lectureBoardMapper.selectCourseTag", courseNo);

	}


	public LectureBoard selectLecture(int lectureNo,int courseNo) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("lectureNo", lectureNo);
		map.put("courseNo", courseNo);

		return sqlSession.selectOne("lectureBoardMapper.selectLecture", map);

	}



	public int deleteLecture(int lectureNo,int courseNo) {

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("lectureNo", lectureNo);
		map.put("courseNo", courseNo);


		return sqlSession.delete("lectureBoardMapper.deleteLecture", map);

	}



	public int updateLecture(LectureBoard lvo) {

		

		return sqlSession.delete("lectureBoardMapper.updateLecture", lvo);

	}



}
