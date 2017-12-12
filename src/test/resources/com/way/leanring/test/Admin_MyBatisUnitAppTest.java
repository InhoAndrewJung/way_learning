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

	
		List list =session.selectList("adminMapper.selectActiveMember", Member);	
			System.out.println(list+"검색성공~!");
			
		
			String userId="";String role="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("role", role);
		System.out.println(updateResult + "업데이트 성공,, 랭킹 순번 먹임 !");
		int int changeAuthority= session.update("adminMapper.changeAuthority", map);
		
		
		List<Course> list=session.selectList("adminMapper.selectAllCourseList", Member);
		for (Course v : list) {
			System.out.println(v+"검색성공~!");
		}
		
		String isAccept="";String courseNo="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isAccept", isAccept);
		map.put("courseNo", courseNo);
		int changeAcceptStatus= session.update("adminMapper.changeAcceptStatus", map);
		System.out.println(changeAcceptStatus + "업데이트 성공 !");
		session.commit();

	
}

}
