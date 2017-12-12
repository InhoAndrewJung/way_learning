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


				 
				 //문제 : questionMapper.xml
				 GeneralQuestion gq=new GeneralQuestion(questionNo, question, title, answer, cntSubmit, cntRight, category);
				 int insertGeneralQuestion=ession.insert("questionMapper.insertGeneralQuestion", gq);
				 System.out.println(insertGeneralQuestion+"검색 성공..");
				 
				 AlgorithmQuestion aq=new AlgorithmQuestion(questionNo, title, question, input, output, answer, cntSubmit, cntRight);
				 int insertEssayQuestion=session.insert("questionMapper.insertEssayQuestion", aq);
				 System.out.println(insertEssayQuestion+"삽입 성공..");
				 
				 String[] answerChoice="";
				 Map<String, Object> map = new HashMap<String, Object>();
					for (int i = 0; i < answerChoice.length; i++) {

						if (answerChoice[i] == null || answerChoice[i].equals(""))
							break;
						map.put("answerOrder", i+1);
						map.put("answerChoice", answerChoice[i]);
					int	insertAnswerChoice=	session.insert("questionMapper.insertAnswerChoice", map);
					 System.out.println(insertAnswerChoice+"삽입 성공..");
				 
					 String keyword=""; String sorting="";
				Map<String, Object> map = new HashMap<String, Object>();
			    map.put("keyword", keyword);
				map.put("sorting", sorting);
				List<GeneralQuestion> list=session.selectList("questionMapper.getGeneralList", map);
				 for (GeneralQuestion v : list) {
						System.out.println(v);
					}
				String keyword="";
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("keyword", keyword);
				List<AlgorithmQuestion> list=session.selectList("questionMapper.getEssayList", keyword);
				 for (AlgorithmQuestion v : list) {
						System.out.println(v);
					}
				 
				int questionNo=0;
				GeneralQuestion	gq=Session.selectOne("questionMapper.showGeneralContent", questionNo);
				System.out.println(gq+"검색 성공..");
				
				int questionNo=0;
				AlgorithmQuestion gq=session.selectOne("questionMapper.showEssayContent", questionNo);
				System.out.println(gq+"검색 성공..");
				
				int questionNo=0;
				List<GeneralChoice> list=session.selectList("questionMapper.getAnswerChoice", questionNo);
				 for (GeneralChoice v : list) {
						System.out.println(v);
					}
				 
				 int questionNo=0; String answer="";
				 GeneralQuestion qvo=new GeneralQuestion(questionNo, question, title, answer, cntSubmit, cntRight, category); 
				 int updateResult=session.update("questionMapper.updateQuestion", qvo);
					System.out.println(updateResult+"업데이트 성공..");
				 
					int questionNo=0;
					int deleteQuestion=session.delete("questionMapper.deleteQuestion", questionNo);
					System.out.println(deleteQuestion+"삭제 성공..");
			
					int questionNo=0;
					int deleteAnswerChoice=session.delete("questionMapper.deleteAnswerChoice", questionNo);
					System.out.println(deleteAnswerChoice+"삭제 성공..");
	
}

}
