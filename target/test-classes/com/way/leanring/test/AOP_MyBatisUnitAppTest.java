package com.way.leanring;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.way.learning.model.board.qna.vo.QnaBoard;
import com.way.learning.model.board.qna.vo.QnaReply;
import com.way.learning.model.board.tech.vo.TechBoard;
import com.way.learning.model.board.tech.vo.TechReply;
import com.way.learning.model.course.vo.Course;
import com.way.learning.model.course.vo.LectureBoard;
import com.way.learning.model.course.vo.LectureReply;
import com.way.learning.model.member.vo.Authority;
import com.way.learning.model.member.vo.Member;
import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.model.question.vo.AnswerResult;
import com.way.learning.model.question.vo.GeneralChoice;
import com.way.learning.model.question.vo.GeneralQuestion;

public class MyBatisUnitAppTest {
	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();

	/*	BoardVO vo = new BoardVO(0, "1", "내용이다.", 0, "날짜임", new MemberVO("123", "123", "123", 123, "서울시", "강남구"));
		session.insert("boardMapper.write", vo);
		session.commit();*/

//AOP : activityMapper.xml
		String userId="";String behavior="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("behavior", behavior);
		int updateActivity= session.update("activityMapper.updateActivity", map);
		System.out.println(updateActivity + "업데이트 성공 !");
//AOP : updateAnswerMapper.xml
		int questionNo=1;
		int int updatePostCntSubmit= session.update("updateAnswerMapper.updatePostCntSubmit", questionNo);
		System.out.println(int updatePostCntSubmit + "업데이트 성공 !");
		
		
		int questionNo=1;
		 int updatePostCntRight= session.update("updateAnswerMapper.updatePostCntRight",questionNo);
		System.out.println( int updatePostCntRight + "업데이트 성공 !");
		
		int questionNo=1; String userId="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		int insertMyCntsubmit =session.insert("updateAnswerMapper.insertMyCntsubmit",map);
		System.out.println( int insertMyCntsubmit + "삽입 성공 !");
		
		int questionNo=1; String userId="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		int updatePostCntRight=session.update("updateAnswerMapper.updateMyCntRight",map);
		System.out.println( int updatePostCntRight + "업데이트 성공 !");
		
		int questionNo=1; String userId="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		int insertMyCntRight=session.insert("updateAnswerMapper.insertMyCntRight",map);
		System.out.println(  insertMyCntRight + "삽입 성공 !");
		
		int questionNo=1; String userId="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		int updateMyCntWrong=session.update("updateAnswerMapper.updateMyCntWrong",map);
		System.out.println(  updateMyCntWrong + "업데이트 성공 !");
		
		int questionNo=1; String userId="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		int insertMyCntWrong=session.insert("updateAnswerMapper.insertMyCntWrong",map);
		System.out.println(  insertMyCntWrong + "삽입 성공 !");
		
		int questionNo=1; String userId="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		int updateMyCntError=session.update("updateAnswerMapper.updateMyCntError",map);
		System.out.println(  insertMyCntWrong + "업데이트 성공 !");
		
		int questionNo=1; String userId="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		int insertMyCntError=session.insert("updateAnswerMapper.insertMyCntError",map);
		System.out.println(  insertMyCntError + "업데이트 성공 !");
		

	
}

}
