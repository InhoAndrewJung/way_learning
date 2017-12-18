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

import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.model.question.vo.GeneralChoice;
import com.way.learning.model.question.vo.GeneralQuestion;

public class Question_MyBatisUnitAppTest {
	int questionNo = 1;

	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();

		// 문제 : questionMapper.xml
		GeneralQuestion gq = new GeneralQuestion(questionNo, "자바에서 상수를 지정할 때 사용되는 키워드로서 변수, 클래스, 메소드 앞에 지정할 수 있는 키워드는?",
				"Chapter1 기초JAVA[1-17]", "public", 1, 1, "shortAnswer");
		int insertGeneralQuestion = session.insert("questionMapper.insertGeneralQuestion", gq);
		System.out.println(insertGeneralQuestion + "검색 성공..");
		session.commit();
		
		AlgorithmQuestion aq = new AlgorithmQuestion(10100, "2+5", "합산문제", "2 3", "5", "sysout", 1, 1);
		int insertEssayQuestion = session.insert("questionMapper.insertEssayQuestion", aq);
		System.out.println(insertEssayQuestion + "삽입 성공..");
		session.commit();
		
		String[] answerChoice = { "sadf" };

		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < answerChoice.length; i++) {

			if (answerChoice[i] == null || answerChoice[i].equals(""))
				break;
			map.put("answerOrder", i + 1);
			map.put("answerChoice", answerChoice[i]);
			int insertAnswerChoice = session.insert("questionMapper.insertAnswerChoice", map);
			System.out.println(insertAnswerChoice + "삽입 성공..");
			session.commit();
			
			String keyword = "";
			String sorting = "";
			Map<String, Object> map1 = new HashMap<String, Object>();
			map.put("keyword", keyword);
			map.put("sorting", sorting);
			List<GeneralQuestion> list = session.selectList("questionMapper.getGeneralList", map1);
			for (GeneralQuestion v : list) {
				System.out.println(v);
			}
			String keyword2 = "자바";
			Map<String, Object> map2 = new HashMap<String, Object>();
			map.put("keyword2", keyword2);
			List<AlgorithmQuestion> list1 = session.selectList("questionMapper.getEssayList", map2);
			for (AlgorithmQuestion v : list1) {
				System.out.println(v);
			}

			GeneralQuestion gq1 = session.selectOne("questionMapper.showGeneralContent", questionNo);
			System.out.println(gq1 + "검색 성공..");

			AlgorithmQuestion gq2 = session.selectOne("questionMapper.showEssayContent", questionNo);
			System.out.println(gq2 + "검색 성공..");

			List<GeneralChoice> list3 = session.selectList("questionMapper.getAnswerChoice", questionNo);
			for (GeneralChoice v : list3) {
				System.out.println(v);
			}

			String answer = "";
			GeneralQuestion qvo = new GeneralQuestion(1111, "자바에서 상수를 지정할 때 사용되는 키워드로서 변수, 클래스, 메소드 앞에 지정할 수 있는 키워드는?",
					"Chapter1 기초JAVA[1-17]", "public", 1, 1, "shortAnswer");
			int updateResult = session.update("questionMapper.updateQuestion", qvo);
			System.out.println(updateResult + "업데이트 성공..");
			session.commit();
			
			int deleteQuestion = session.delete("questionMapper.deleteQuestion", questionNo);
			System.out.println(deleteQuestion + "삭제 성공..");
			session.commit();
			
			int deleteAnswerChoice = session.delete("questionMapper.deleteAnswerChoice", questionNo);
			System.out.println(deleteAnswerChoice + "삭제 성공..");
			session.commit();
		}
	}

}
