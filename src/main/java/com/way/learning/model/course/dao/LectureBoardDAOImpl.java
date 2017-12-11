package com.way.learning.model.course.dao;

import java.sql.SQLException;
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
	
	public int isLectureOrderExist(int courseNo,int lectureOrder) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("courseNo", courseNo);
		map.put("lectureOrder", lectureOrder);



		return sqlSession.selectOne("lectureBoardMapper.isLectureOrderExist", map);

	}

	public List<LectureBoard> selectLectureList(int courseNo){

		return sqlSession.selectList("lectureBoardMapper.selectLectureList", courseNo);


	}


	public Course selectCourse(int courseNo, String userId){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("courseNo", courseNo);

		return sqlSession.selectOne("lectureBoardMapper.selectCourse", map);

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
	
	public int isCourseRecommend(int courseNo, String userId) {
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("courseNo", courseNo);
		map.put("userId", userId);
		int result=sqlSession.selectOne("lectureBoardMapper.isCourseLike", map);
		
		System.out.println("isCourseRecommend dao imple 결과:"+result);
		return result;

	}

	
	public int isCourseLike( int courseNo, String userId) {
		Map<String,Object> map = new HashMap<String,Object>();
		System.out.println("isCourseLike daoImple courseNo:"+courseNo);
		map.put("courseNo", courseNo);
		map.put("userId", userId);
		int result=sqlSession.selectOne("lectureBoardMapper.isCourseLike", map);
		System.out.println("isCourseLike dao imple 결과:"+result);
		return result;

	}
	
	
	
	
	public int insertCourseLike(int courseNo, String userId) {
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("courseNo", courseNo);
		map.put("userId", userId);
		int result=sqlSession.insert("lectureBoardMapper.insertCourseLike", map);
		System.out.println("insertCourseLike dao imple 결과:"+result);
		return result;

	}
	
	
	public int deleteCourseLike(int courseNo, String userId) {
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("courseNo", courseNo);
		map.put("userId", userId);
		int result=sqlSession.delete("lectureBoardMapper.deleteCourseLike", map);
		System.out.println("deleteCourseLike dao imple 결과:"+result);
		return result;

	}
	
	
	public int selectCntCourseLike(int courseNo) {
	
		int result=sqlSession.selectOne("lectureBoardMapper.selectCntCourseLike", courseNo);
		System.out.println("selectCntCourseLike dao imple 결과:"+result);
		return result;

	}
	
	@Override
	public int increaseCntCourseLike(int courseNo)  {
		
		System.out.println("코스  좋아요 올리기:"+courseNo);
		return sqlSession.update("lectureBoardMapper.increaseCntCourseLike", courseNo);
		
	}
	
	
	@Override
	public int decreaseCntCourseLike(int courseNo)  {
		
		System.out.println("코스 좋아요 내리기:"+courseNo);
		return sqlSession.update("lectureBoardMapper.decreaseCntCourseLike", courseNo);
		
	}
	
	
	@Override
	public int isMyLectureRecordExist(int courseNo, int lectureNo,String userId)  {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("lectureNo", lectureNo);
		map.put("courseNo", courseNo);
		map.put("userId", userId);
	
		return sqlSession.selectOne("lectureBoardMapper.isMyLectureRecordExist", map);
		
	}
	
	
	@Override
	public int insertMyLectureRecord(int courseNo, int lectureNo,String userId)  {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("lectureNo", lectureNo);
		map.put("courseNo", courseNo);
		map.put("userId", userId);
	
		return sqlSession.insert("lectureBoardMapper.insertMyLectureRecord", map);
		
	}
	
	@Override
	public int deleteMyLectureRecord(int courseNo, int lectureNo,String userId)  {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("lectureNo", lectureNo);
		map.put("courseNo", courseNo);
		map.put("userId", userId);
	
		return sqlSession.delete("lectureBoardMapper.deleteMyLectureRecord", map);
		
	}
	
	
	





}
