package com.way.leanring.test;

import java.io.Reader;
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

public class Course_MyBatisUnitAppTest {
	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();

	/*	BoardVO vo = new BoardVO(0, "1", "내용이다.", 0, "날짜임", new MemberVO("123", "123", "123", 123, "서울시", "강남구"));
		session.insert("boardMapper.write", vo);
		session.commit();*/

//강좌 : couseMapper.xml
			 Course course=new Course(courseNo, courseName, description, courseImage, regDate, member, isAccept, cntCourseLike, uploadFile, tags);
			 int insertCourse= session.insert("courseMapper.insertCourse", course);
			 System.out.println(insertCourse+"삽입 성공");
			 
			 String tags="";
			 int insertTags= session.insert("courseMapper.insertTags", tags);
			 System.out.println(insertTags+"삽입 성공");
			 
			 String userId="";
			 List<Course> list=session.selectList("courseMapper.selectMyCourseList", userId);
			 for (Course v : list) {
					System.out.println(v);
				}
			 
			 String userId="";int courseNo=0;
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("userId", userId);
				map.put("courseNo", courseNo);
			 Course c =session.selectOne("courseMapper.selectMyCourse", map);

			 int courseNo=0;
			 List<String> list= session.selectList("courseMapper.selectCourseTag", courseNo);
			 for (String v : list) {
					System.out.println(v);
				}
			 
			 int courseNo=1;
			 int deleteCourse= session.delete("courseMapper.deleteCourse", courseNo);
			 
			 Course cvo=new Course(courseNo, courseName, description, courseImage, regDate, member, isAccept, cntCourseLike, uploadFile, tags);
			 int updateCourse=session.update("courseMapper.updateCourse", cvo);
			 System.out.println(updateCourse+"업데이트 성공..");
			 
			 int  courseNo=0;
			 int delteTags=session.delete("courseMapper.deleteTags", courseNo);
			 System.out.println(delteTags+"삭제 성공..");
			 
			 List<Course> list= session.selectList("courseMapper.selectAccetpedCourseList");
			 for (Course v : list) {
					System.out.println(v);
				}
			 
			 
//강좌 : lectureBoardMapper.xml
			 LectureBoard lvo=new LectureBoard(lectureNo, courseNo, lectureName, lectureOrder, member, content, regDate);
			 int insertLecture=session.insert("lectureBoardMapper.insertLecture", lvo);
			 System.out.println(insertLecture+"삽입 성공..");
			 
			 String userId="";
			 List list=session.selectList("lectureBoardMapper.selectMyCourseNo", userId);
			 System.out.println(list+"검색 성공..");
			 
			 int courseNo=0;
			 List<LectureBoard> list= session.selectList("lectureBoardMapper.selectLectureList", courseNo);
			 for (LectureBoard v : list) {
					System.out.println(v);
				}
			 
			 int courseNo=0; String userId="";
			 Map<String,Object> map = new HashMap<String,Object>();
				map.put("userId", userId);
				map.put("courseNo", courseNo);
				Course c=session.selectOne("lectureBoardMapper.selectCourse", map);
				
				int courseNo=0;
				List<String> list=session.selectList("lectureBoardMapper.selectCourseTag", courseNo);
				 for (String v : list) {
						System.out.println(v);
					}
				 int lectureNo=0;int courseNo=0;
				 Map<String,Object> map = new HashMap<String,Object>();
					map.put("lectureNo", lectureNo);
					map.put("courseNo", courseNo);
				 LectureBoard lb= session.selectOne("lectureBoardMapper.selectLecture", map);
				 
				 int lectureNo=0;int courseNo=0;
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("lectureNo", lectureNo);
					map.put("courseNo", courseNo);
				 int deleteLecture=session.delete("lectureBoardMapper.deleteLecture", map);
				 
				 LectureBoard lvo=new LectureBoard(lectureNo, courseNo, lectureName, lectureOrder, member, content, regDate);
				 int updateLecture=session.delete("lectureBoardMapper.updateLecture", lvo);
				 Map<String,Object> map = new HashMap<String,Object>();
					map.put("courseNo", courseNo);
					map.put("userId", userId);
				 int courseNo=0; String userId="";
				 int isCourseRecommend=session.selectOne("lectureBoardMapper.isCourseLike", map);
				 System.out.println(isCourseRecommend+"검색 성공..");
				 
				 int courseNo=1; String userId=""; 
				 Map<String,Object> map = new HashMap<String,Object>();
					
					map.put("courseNo", courseNo);
					map.put("userId", userId);
				 int insertCourseLike=session.insert("lectureBoardMapper.insertCourseLike", map);
				 
				 int courseNo=0; String userId="";
				 Map<String,Object> map = new HashMap<String,Object>();
					
					map.put("courseNo", courseNo);
					map.put("userId", userId);
				 int deleteCourseLike=session.delete("lectureBoardMapper.deleteCourseLike", map);
				 System.out.println(deleteCourseLike+"삭제 성공..");
				 
				 int courseNo=1;
				 int selectCntCourseLike=session.selectOne("lectureBoardMapper.selectCntCourseLike", courseNo);
				 System.out.println(selectCntCourseLike+"검색 성공..");
				 int courseNo=0;
				 int increaseCntCourseLike=Session.update("lectureBoardMapper.increaseCntCourseLike", courseNo);
				 System.out.println(increaseCntCourseLike+"업데이트 성공..");
				 
				 int courseNo=0;
				 int decreaseCntCourseLike=session.update("lectureBoardMapper.decreaseCntCourseLike", courseNo);
				 System.out.println(decreaseCntCourseLike+"업데이트 성공..");
				 
				 int courseNo=1; int lectureNo=1;String userId="";
				 Map<String,Object> map = new HashMap<String,Object>();
					map.put("lectureNo", lectureNo);
					map.put("courseNo", courseNo);
					map.put("userId", userId);
				 int isMyLectureRecordExist=session.selectOne("lectureBoardMapper.isMyLectureRecordExist", map);
				 
				 int courseNo1; int lectureNo=0;String userId="";
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("lectureNo", lectureNo);
					map.put("courseNo", courseNo);
					map.put("userId", userId);
					int insertMyLectureRecord=session.insert("lectureBoardMapper.insertMyLectureRecord", map);

					int courseNo=1; int lectureNo=1;String userId="";
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("lectureNo", lectureNo);
					map.put("courseNo", courseNo);
					map.put("userId", userId);
					int deleteMyLectureRecord=Session.delete("lectureBoardMapper.deleteMyLectureRecord", map);
					 System.out.println(deleteMyLectureRecord+"업데이트 성공..");
					
					
					//강좌 : lectureReplyMapper.xml'
					 LectureReply rvo=new LectureReply(replyNo, lectureNo, courseNo1, member, replytext, regDate);
					 int insertReply=session.insert("lectureReplyMapper.insertReply", rvo);
					 System.out.println(insertReply+"삽입 성공..");
					 
					 int lectureNo=1; int courseNo=1;
						Map<String,Object> map = new HashMap<String,Object>();
						map.put("lectureNo", lectureNo);
						map.put("courseNo", courseNo);
					 List<LectureReply> list=Session.selectList("lectureReplyMapper.selectListReply", map);
					 for (String v : list) {
							System.out.println(v);
						}
					 HashMap<String, Object> mapParam=""; 
					 int updateReply=session.update("lectureReplyMapper.updateReply", mapParam);
					 System.out.println(deleteMyLectureRecord+"업데이트 성공..");
					 
					 HashMap<String, Object> mapParam=""; 
					 String selectUpdatedReply=sqlSession.selectOne("lectureReplyMapper.selectUpdatedReply", mapParam);
					 System.out.println(selectUpdatedReply+"업데이트 성공..");
					 
					 HashMap<String, Object> mapParam="";  
					 int deleteReply=session.delete("lectureReplyMapper.deleteReply", mapParam);
					 
					 

	
}

}
