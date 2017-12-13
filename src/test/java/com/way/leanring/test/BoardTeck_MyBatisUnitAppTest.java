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

public class BoardTeck_MyBatisUnitAppTest {
	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();


				 
				 //게시판 TECH : techBoardMapper.xml
				 TechBoard bvo=new TechBoard(boardNo, member, title, content, cntView, cntReply, cntBoardLike, regDate, tag)
			int selectResult=session.insert("techBoardMapper.write",bvo);
				 session.commit();	
				 
				 int no=1;
				Date date= sqlSession.selectOne("techBoardMapper.selectByNoForDate", no);
				
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
				
				
				List list=session.selectList("techBoardMapper.getTag",boardNo);
				for (TechBoard v : list) {
					System.out.println(v);
				}
				int boardNo=1;
				int deleteTag=session.delete("techBoardMapper.deleteTag",boardNo);
				System.out.println(deleteTag+"업데이트 성공~!");
				
				int boardNo=0;
				
				String boardNo="1";
				TechBoard tb=new TechBoard(boardNo, member, title, content, cntView, cntReply, cntBoardLike, regDate, tag);
				session.selectOne("techBoardMapper.showContent",boardNo);
				
				int no=1;
				int deleteResult=session.delete("techBoardMapper.deleteBoard",no);
				System.out.println(deleteResult+"업데이트 성공~!");
				 session.commit();	
				 
				String no="1";
				int updateResult=session.update("techBoardMapper.updateCount",no);
				System.out.println(updateResult+"업데이트 성공~!");
				 session.commit();	
				 
				TechBoard vo=new TechBoard(boardNo, member, title, content, cntView, cntReply, cntBoardLike, regDate, tag);
				int updateResult=session.update("techBoardMapper.updateBoard",vo);
				System.out.println(updateResult+"업데이트 성공~!");
				session.commit();	
				 
				 
				 int totalCount=session.selectOne("techBoardMapper.totalCount");
				 System.out.println(updateResult+"업데이트 성공~!");
				 session.commit();	
				 
				 String keyword="";
				 int countArticle=sqlSession.selectOne("techBoardMapper.countArticle",  keyword);
				 session.commit();	
				 
				 String tag=""; int boardNo=0;
				 Map<String,Object> map = new HashMap<String,Object>();
					
					map.put("tag", tag);
					map.put("boardNo", boardNo);
				 int insertResult=session.insert("techBoardMapper.insertTag", map);
				 System.out.println(insertResult+"삽입 성공~!");
				 
				 String userId="opilior", int boardNo=0;
					Map<String,Object> map = new HashMap<String,Object>();
					
					map.put("userId", userId);
					map.put("boardNo", boardNo);
					int selectResult=session.selectOne("techBoardMapper.isBoardLike", map);
					 System.out.println(selectResult+"검색 성공~!");
					 
					 String userId=""; int boardNo=0;
					 Map<String,Object> map = new HashMap<String,Object>();
						
						map.put("userId", userId);
						map.put("boardNo", boardNo);
						int insertResult=session.insert("techBoardMapper.insertBoardLike", map);
						 System.out.println(insertResult+"삽입 성공~!");
						 
						 String userId="", int boardNo=0;
						 Map<String,Object> map = new HashMap<String,Object>();
							
							map.put("userId", userId);
							map.put("boardNo", boardNo);
					int deleteResult=session.delete("techBoardMapper.deleteBoardLike", map);
					 System.out.println(deleteResult+"삭제 성공~!"); 
					 
					int boardNo=0;	
					int updateResult=session.update("techBoardMapper.increaseCntBoardLike", boardNo);
					 System.out.println(updateResult+"업데이트 성공~!"); 
				
					 int boardNo=0;
					int updateResult=session.update("techBoardMapper.decreaseCntBoardLike", boardNo);
					 System.out.println(updateResult+"업데이트 성공~!"); 
					 
					 int boardNo=0;
					 Map<String,Object> map = new HashMap<String,Object>();
					 int selectCntBoardLike=session.selectOne("techBoardMapper.selectCntBoardLike", boardNo);
					 
					 String userId="";
					 List<Integer> list=sqlSession.selectList("techBoardMapper.selectAllRecommendNo", userId);
					 for (Integer v : list) {
							System.out.println(v);
						}
					 
					 
					 //게시판 TECH : techReplyMapper.xml
			TechReply vo=new TechReply(replyNo, boardNo, member, replytext, regdate, cntReplyLike, reg_date)
			int  insertReply=session.insert("techReplyMapper.insertReply", vo);
		
			int boardNo=0;
			List<TechReply> list=session.selectList("techReplyMapper.listReply", boardNo);
			 for (TechReply v : list) {
					System.out.println(v);
				}
			 String replyNo=""; String replytext="";
			 Map<String,Object> map = new HashMap<String, Object>();
				map.put("replyNo", replyNo);
				map.put("replytext", replytext);
			 int updateReply=session.update("techReplyMapper.updateReply", map);
			 System.out.println(updateReply+"업뎃 성공!");
			 
			 String replyNo="";
			 String  selectResult=session.selectOne("techReplyMapper.selectUpdatedReply", replyNo);
			 System.out.println(selectResult+"검색 성공!");
			 
			 String replyNo="1";
			 int  deleteReply=session.delete("techReplyMapper.deleteReply", replyNo);
			 System.out.println(deleteReply+"개 삭제 완료!!");
			 
			 String replyNo="";
			 TechReply tr= session.selectOne("techReplyMapper.getReply", replyNo);
			 System.out.println(tr+"검색 완료!!");
			 
			 String userId=""; int replyNo=0;
				Map<String,Object> map = new HashMap<String,Object>();
				
				map.put("userId", userId);
				map.put("replyNo", replyNo);
			 int isReplyLike=session.selectOne("techReplyMapper.isReplyLike", map);
			 System.out.println(isReplyLike+"검색 완료!!");
			 
			 String userId="", int replyNo=0;
			 Map<String,Object> map = new HashMap<String,Object>();
				
				map.put("userId", userId);
				map.put("replyNo", replyNo);
			int insertReplyLike=session.insert("techReplyMapper.insertReplyLike", map);
			System.out.println(insertReplyLike+"검색 완료!!");
			
			int replyNo=0;
			int increaseCntReplyLike=session.update("techReplyMapper.increaseCntReplyLike", replyNo);
			System.out.println(increaseCntReplyLike+"업데이트 완료!");
			
			int replyNo=1;
			int decreaseCntReplyLike=session.update("techReplyMapper.decreaseCntReplyLike", replyNo);
			System.out.println("총 좋아요 내리기:"+decreaseCntReplyLike);
			
			int replyNo=0;
			
			int selectCntReplyLike=session.selectOne("techReplyMapper.selectCntReplyLike", replyNo);
			System.out.println(selectCntReplyLike+"검색 성공");
			
			List<Integer> list=sqlSession.selectList("techReplyMapper.selectAllRecommendNo");
			 for (Integer v : list) {
					System.out.println(v);
				}
	
}

}
