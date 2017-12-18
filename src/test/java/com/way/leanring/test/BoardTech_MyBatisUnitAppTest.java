package com.way.leanring.test;

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

import com.way.learning.model.board.qna.vo.QnaBoard;
import com.way.learning.model.board.qna.vo.QnaReply;
import com.way.learning.model.board.tech.vo.TechBoard;
import com.way.learning.model.board.tech.vo.TechReply;
import com.way.learning.model.member.vo.Member;

public class BoardTech_MyBatisUnitAppTest {
	String pageNo = "1";
	int pageNo1 = 1;
	
	String replyNo = "1";
	int replyNo1 = 1;
	
	String userId = "2222";
	String password="2222";
	
	String boardNo="1";
	int boardNo1=1;
	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();


				 
				 //게시판 TECH : techBoardMapper.xml
				 TechBoard bvo=new TechBoard(1, new Member("2222", "2222"), "제목", "내용", 1, 1, 1, new Date(2017, 12, 13), null);
			int selectResult=session.insert("techBoardMapper.write",bvo);
				 session.commit();	
				 
				 int no=1;
				Date date= session.selectOne("techBoardMapper.selectByNoForDate", no);
				
				String pageNo="";String keyword=""; String sorting="";
				Map<String,Object> map = new HashMap<String,Object>();
				
				map.put("keyword", keyword);
				map.put("pageNo", pageNo);
				map.put("sorting", sorting);
				List<TechBoard> list=session.selectList("techBoardMapper.getBoardList", map);
				for (TechBoard v : list) {
					System.out.println(v);
				}
				
				List taglist=session.selectList("techBoardMapper.getTagList");
				System.out.println("taglist::"+taglist);
				System.out.println("taglist size::"+taglist.size());
				
				
				List list1=session.selectList("techBoardMapper.getTag",boardNo);
				
					System.out.println(list1);
			
				int boardNo=1;
				int deleteTag=session.delete("techBoardMapper.deleteTag",boardNo);
				System.out.println(deleteTag+"업데이트 성공~!");
				session.commit();
				
				
				
				TechBoard tb=new TechBoard(1, new Member("2222", "2222"), "제목", "내용", 1, 1, 1, new Date(2017, 12, 13), null);
				session.selectOne("techBoardMapper.showContent",boardNo);
				
				int no2=1;
				int deleteResult=session.delete("techBoardMapper.deleteBoard",no2);
				System.out.println(deleteResult+"업데이트 성공~!");
				 session.commit();	
				 
				String no1="1";
				int updateResult=session.update("techBoardMapper.updateCount",no1);
				System.out.println(updateResult+"업데이트 성공~!");
				 session.commit();	
				 
				TechBoard vo=new TechBoard(1, new Member("2222", "2222"), "제목", "내용", 1, 1, 1, new Date(2017, 12, 13), null);
				int updateResult1=session.update("techBoardMapper.updateBoard",vo);
				System.out.println(updateResult1+"업데이트 성공~!");
				session.commit();	
				 
				 
				 int totalCount=session.selectOne("techBoardMapper.totalCount");
				 System.out.println(updateResult+"업데이트 성공~!");
				 session.commit();	
				 
				 String keyword1="1111";
				 int countArticle=session.selectOne("techBoardMapper.countArticle",  keyword1);
				 session.commit();	
				 
				 String tag=""; 
				 Map<String,Object> map1 = new HashMap<String,Object>();
					
					map.put("tag", tag);
					map.put("boardNo", boardNo);
				 int insertResult=session.insert("techBoardMapper.insertTag", map1);
				 System.out.println(insertResult+"삽입 성공~!");
				 session.commit();
				 
				 String userId="opilior"; 
					Map<String,Object> map3 = new HashMap<String,Object>();
					
					map.put("userId", userId);
					map.put("boardNo", boardNo);
					int selectResult3=session.selectOne("techBoardMapper.isBoardLike", map3);
					 System.out.println(selectResult3+"검색 성공~!");
					 
					
					 Map<String,Object> map2 = new HashMap<String,Object>();
						
						map.put("userId", userId);
						map.put("boardNo", boardNo);
						int insertResult4=session.insert("techBoardMapper.insertBoardLike", map2);
						 System.out.println(insertResult4+"삽입 성공~!");
						 session.commit();
						
						 Map<String,Object> map4 = new HashMap<String,Object>();
							
							map.put("userId", userId);
							map.put("boardNo", boardNo);
					int deleteResult1=session.delete("techBoardMapper.deleteBoardLike", map4);
					 System.out.println(deleteResult1+"삭제 성공~!"); 
					 session.commit();
					
					int updateResult3=session.update("techBoardMapper.increaseCntBoardLike", boardNo);
					 System.out.println(updateResult3+"업데이트 성공~!"); 
					 session.commit();
					
					int updateResult4=session.update("techBoardMapper.decreaseCntBoardLike", boardNo);
					 System.out.println(updateResult4+"업데이트 성공~!"); 
					 session.commit();

					 int selectCntBoardLike=session.selectOne("techBoardMapper.selectCntBoardLike", boardNo);
					 
					
					 List<Integer> list5=session.selectList("techBoardMapper.selectAllRecommendNo", userId);
					 for (Integer v : list5) {
							System.out.println(v);
						}
					 
					 
					 //게시판 TECH : techReplyMapper.xml
			TechReply vo1=new TechReply(1, boardNo, new Member(userId, "2222"), "test", "2017-12-15", 1, new Date(2017, 12, 15));
			int  insertReply=session.insert("techReplyMapper.insertReply", vo1);
			session.commit();
			
			List<TechReply> list6=session.selectList("techReplyMapper.listReply", boardNo);
			 for (TechReply v : list6) {
					System.out.println(v);
				}
			 String replyNo=""; String replytext="";
			 Map<String,Object> map7 = new HashMap<String, Object>();
				map.put("replyNo", replyNo);
				map.put("replytext", replytext);
			 int updateReply=session.update("techReplyMapper.updateReply", map7);
			 System.out.println(updateReply+"업뎃 성공!");
			 session.commit();
			
			 String  selectResult6=session.selectOne("techReplyMapper.selectUpdatedReply", replyNo);
			 System.out.println(selectResult6+"검색 성공!");
			 
			
			 int  deleteReply=session.delete("techReplyMapper.deleteReply", replyNo);
			 System.out.println(deleteReply+"개 삭제 완료!!");
			 session.commit();
			
			 TechReply tr= session.selectOne("techReplyMapper.getReply", replyNo);
			 System.out.println(tr+"검색 완료!!");
			 
			Map<String,Object> map8 = new HashMap<String,Object>();
				
				map.put("userId", userId);
				map.put("replyNo", replyNo);
			 int isReplyLike=session.selectOne("techReplyMapper.isReplyLike", map8);
			 System.out.println(isReplyLike+"검색 완료!!");
		
			 Map<String,Object> map9 = new HashMap<String,Object>();
				
				map.put("userId", userId);
				map.put("replyNo", replyNo);
			int insertReplyLike=session.insert("techReplyMapper.insertReplyLike", map9);
			System.out.println(insertReplyLike+"검색 완료!!");
			session.commit();
			
			int increaseCntReplyLike=session.update("techReplyMapper.increaseCntReplyLike", replyNo);
			System.out.println(increaseCntReplyLike+"업데이트 완료!");
			session.commit();
		
			int decreaseCntReplyLike=session.update("techReplyMapper.decreaseCntReplyLike", replyNo);
			System.out.println("총 좋아요 내리기:"+decreaseCntReplyLike);
			session.commit();
		
			int selectCntReplyLike=session.selectOne("techReplyMapper.selectCntReplyLike", replyNo);
			System.out.println(selectCntReplyLike+"검색 성공");
			
			List<Integer> list10=session.selectList("techReplyMapper.selectAllRecommendNo");
			 for (Integer v : list10) {
					System.out.println(v);
				}
	
}

}
