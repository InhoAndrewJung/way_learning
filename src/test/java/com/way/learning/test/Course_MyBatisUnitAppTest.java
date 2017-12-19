package com.way.learning.test;

import java.io.Reader;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.course.vo.LectureBoard;
import com.way.learning.model.course.vo.LectureReply;
import com.way.learning.model.member.vo.Member;

public class Course_MyBatisUnitAppTest {
	String courseNo = "3";
	int courseNo1 = 3;

	String lectureNo = "1";
	int lectureNo1 = 1;

	String userId = "2222";
	String password = "2222";

	String boardNo = "1";
	int boardNo1 = 1;

	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();

	

		// 강좌 : couseMapper.xml
		Course course = new Course(courseNo1, "courseName", "description", "courseImage", new Date(2017, 12, 15),
				new Member(userId, password), 1, 1);
		int insertCourse = session.insert("courseMapper.insertCourse", course);
		System.out.println(insertCourse + "삽입 성공");
		session.commit();

		String tags = "";
		int insertTags = session.insert("courseMapper.insertTags", tags);
		System.out.println(insertTags + "삽입 성공");
		session.commit();

		String userId = "";
		List<Course> list = session.selectList("courseMapper.selectMyCourseList", userId);
		for (Course v : list) {
			System.out.println(v);
		}

		int courseNo1 = 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("courseNo1", courseNo1);
		Course c = session.selectOne("courseMapper.selectMyCourse", map);

		List<String> list1 = session.selectList("courseMapper.selectCourseTag", courseNo1);
		for (String v : list1) {
			System.out.println(v);
		}

		int deleteCourse = session.delete("courseMapper.deleteCourse", courseNo1);
		session.commit();

		Course cvo = new Course(3, "courseName", "description", "courseImage", new Date(2017, 12, 15),
				new Member("opilior", "2222"), 1, 1);
		int updateCourse = session.update("courseMapper.updateCourse", cvo);
		System.out.println(updateCourse + "업데이트 성공..");
		session.commit();

		int delteTags = session.delete("courseMapper.deleteTags", courseNo1);
		System.out.println(delteTags + "삭제 성공..");
		session.commit();

		List<Course> list2 = session.selectList("courseMapper.selectAccetpedCourseList");
		for (Course v : list2) {
			System.out.println(v);
		}

		// 강좌 : lectureBoardMapper.xml
		LectureBoard lvo = new LectureBoard(1, 1, "웹의 기초", 1, new Member(userId, password), "웹의 기초에대해 알아보자!!!",
				new Date(2017, 12, 18));
		int insertLecture = session.insert("lectureBoardMapper.insertLecture", lvo);
		System.out.println(insertLecture + "삽입 성공..");
		session.commit();

		List list3 = session.selectList("lectureBoardMapper.selectMycourseNo1", userId);
		System.out.println(list3 + "검색 성공..");

		List<LectureBoard> list4 = session.selectList("lectureBoardMapper.selectLectureList", courseNo1);
		for (LectureBoard v : list4) {
			System.out.println(v);
		}

		Map<String, Object> map1 = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("courseNo1", courseNo1);
		Course c1 = session.selectOne("lectureBoardMapper.selectCourse", map1);
		System.out.println(c1);

		List<String> list5 = session.selectList("lectureBoardMapper.selectCourseTag", courseNo1);
		for (String v : list5) {
			System.out.println(v);
		}
		int lectureNo = 0;
		Map<String, Object> map2 = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("courseNo1", courseNo1);
		LectureBoard lb = session.selectOne("lectureBoardMapper.selectLecture", map2);

		Map<String, Object> map3 = new HashMap<String, Object>();
		map.put("lectureNo", lectureNo);
		map.put("courseNo1", courseNo1);
		int deleteLecture = session.delete("lectureBoardMapper.deleteLecture", map3);
		session.commit();

		LectureBoard lvo1 = new LectureBoard(lectureNo, courseNo1, "가나다라", 1, new Member(userId, userId), "content",
				new Date(2017, 12, 18));
		int updateLecture = session.delete("lectureBoardMapper.updateLecture", lvo1);
		Map<String, Object> map4 = new HashMap<String, Object>();
		map.put("courseNo1", courseNo1);
		map.put("userId", userId);
		session.commit();

		int isCourseRecommend = session.selectOne("lectureBoardMapper.isCourseLike", map4);
		System.out.println(isCourseRecommend + "검색 성공..");

		Map<String, Object> map5 = new HashMap<String, Object>();

		map5.put("courseNo1", courseNo1);
		map5.put("userId", userId);
		int insertCourseLike = session.insert("lectureBoardMapper.insertCourseLike", map5);
		session.commit();

		Map<String, Object> map6 = new HashMap<String, Object>();

		map.put("courseNo1", courseNo1);
		map.put("userId", userId);
		int deleteCourseLike = session.delete("lectureBoardMapper.deleteCourseLike", map6);
		System.out.println(deleteCourseLike + "삭제 성공..");
		session.commit();

		int selectCntCourseLike = session.selectOne("lectureBoardMapper.selectCntCourseLike", courseNo1);
		System.out.println(selectCntCourseLike + "검색 성공..");

		int increaseCntCourseLike = session.update("lectureBoardMapper.increaseCntCourseLike", courseNo1);
		System.out.println(increaseCntCourseLike + "업데이트 성공..");
		session.commit();

		int decreaseCntCourseLike = session.update("lectureBoardMapper.decreaseCntCourseLike", courseNo1);
		System.out.println(decreaseCntCourseLike + "업데이트 성공..");
		session.commit();

		Map<String, Object> map7 = new HashMap<String, Object>();
		map7.put("lectureNo1", lectureNo1);
		map7.put("courseNo1", courseNo1);
		map7.put("userId", userId);
		int isMyLectureRecordExist = session.selectOne("lectureBoardMapper.isMyLectureRecordExist", map7);

		Map<String, Object> map8 = new HashMap<String, Object>();
		map8.put("lectureNo", lectureNo);
		map8.put("courseNo1", courseNo1);
		map8.put("userId", userId);
		int insertMyLectureRecord = session.insert("lectureBoardMapper.insertMyLectureRecord", map8);
		session.commit();

		Map<String, Object> map9 = new HashMap<String, Object>();
		map9.put("lectureNo", lectureNo);
		map9.put("courseNo1", courseNo1);
		map9.put("userId", userId);
		int deleteMyLectureRecord = session.delete("lectureBoardMapper.deleteMyLectureRecord", map9);
		System.out.println(deleteMyLectureRecord + "업데이트 성공..");
		session.commit();

		// 강좌 : lectureReplyMapper.xml'
		LectureReply rvo2 = new LectureReply(1, 1, 1, new Member(userId, userId), "ㅎㅎㅎ", new Date(2017, 12, 18));
		int insertReply = session.insert("lectureReplyMapper.insertReply", rvo2);
		System.out.println(insertReply + "삽입 성공..");
		session.commit();

		Map<String, Object> map10 = new HashMap<String, Object>();
		map10.put("lectureNo", lectureNo);
		map10.put("courseNo1", courseNo1);
		List<LectureReply> list6 = session.selectList("lectureReplyMapper.selectListReply", map10);
		for (LectureReply v : list6) {
			System.out.println(v);
		}
	/*	HashMap<String, Object> mapParam = "sadf";
		int updateReply = session.update("lectureReplyMapper.updateReply", mapParam);
		System.out.println(updateReply + "업데이트 성공..");
		session.commit();

		HashMap<String, Object> mapParam1 = "asdf";
		String selectUpdatedReply = session.selectOne("lectureReplyMapper.selectUpdatedReply", mapParam1);
		System.out.println(selectUpdatedReply + "업데이트 성공..");
		session.commit();

		HashMap<String, Object> mapParam2 = "asdf";
		int deleteReply = session.delete("lectureReplyMapper.deleteReply", mapParam2);
		session.commit();*/

	}

}
