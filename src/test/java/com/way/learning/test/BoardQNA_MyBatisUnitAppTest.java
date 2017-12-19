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

import com.way.learning.model.board.qna.vo.QnaBoard;
import com.way.learning.model.board.qna.vo.QnaReply;
import com.way.learning.model.board.tech.vo.TechBoard;
import com.way.learning.model.board.tech.vo.TechReply;
import com.way.learning.model.member.vo.Member;

public class BoardQNA_MyBatisUnitAppTest {
	String pageNo = "1";
	String replyNo = "1";
	int pageNo1 = 1;
	int replyNo1 = 1;
	String userId = "2222";
	int boardNo=1;

	@Test
	public void unitTest() throws Exception {
		
	
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();


		QnaBoard qb=new QnaBoard(1, new Member("2222", "2222"), "제목", "내용", 1, 1, 1, new Date(2017, 12, 13), null);
		int insertBoard = session.insert("qnaBoardMapper.write", qb);
		session.commit();
		System.out.println(insertBoard + " 삽입 성공...");
		
		String tag=""; int boardNo=0;
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("tag", tag);
		map.put("boardNo", boardNo);
		int insertTag=session.insert("qnaBoardMapper.insertTag", map);
		System.out.println(insertTag + " 삽입 성공...");
		session.commit();
		
		int no=1;
		Date date=session.selectOne("qnaBoardMapper.selectByNoForDate", no);
		System.out.println(date+"검색성공~!");
		
		String pageNo="1";String keyword="2222"; String sorting="2222";
		Map<String,Object> map1 = new HashMap<String,Object>();

		map.put("keyword", keyword);
		map.put("pageNo", pageNo);
		map.put("sorting", sorting);
		List<QnaBoard> list =session.selectList("qnaBoardMapper.getBoardList", map1);
		for (QnaBoard v : list) {
			System.out.println(v+"검색성공~!");
		}
		 String keyword1="키워드"; String sorting1="솔팅";
		Map<String,Object> map2 = new HashMap<String,Object>();

		map.put("keyword", keyword1);
		map.put("pageNo", pageNo);
		map.put("sorting", sorting1);
		 List<QnaBoard>list2 =session.selectList("qnaBoardMapper.getTagList", map2);
		 for (QnaBoard v : list2) {
				System.out.println(v+"검색성공~!");
			}
	
		List list3=session.selectList("qnaBoardMapper.getTag",boardNo);
		System.out.println(list3+"검색성공~!");
		
		List<QnaBoard> list10 =session.selectList("qnaBoardMapper.showContent", boardNo);
		 for (QnaBoard v : list10) {
				System.out.println(v+"검색성공~!");
			}
	
		
		
	
		int updateResult= session.update("qnaBoardMapper.updateCount", boardNo);
		session.commit();
		System.out.println(updateResult + "업데이트 성공 !");

		
		int updateResult5= session.update("qnaBoardMapper.updateBoard", boardNo);
		session.commit();
		System.out.println(updateResult5 + "업데이트 성공 !");
		
	
		int deleteTag= session.delete("qnaBoardMapper.deleteTag",boardNo);
		System.out.println(deleteTag + "삭제 성공 !");
		session.commit();
		
		
		//<!-- 페이징 처리 추가 -->
		String replyNo="1";
		 int selectResult=session.selectOne("qnaBoardMapper.totalCount", replyNo);
		
			System.out.println(selectResult+"검색성공~!");
			
			
			 int selectResult6=session.selectOne("qnaBoardMapper.countReply", replyNo);
			System.out.println(selectResult6+"검색성공~!");
		
		String keyword3="1";
		int countArticlet=session.selectOne("qnaBoardMapper.countArticle",  keyword3);
		System.out.println(countArticlet+"검색성공~!");
	
	
	//	<!-- 태그 처리 추가 -->	
	String insertValue = "boardNo";String insertValue2 = "tag";
	int insertResult = session.insert("qnaBoardMapper.insertTag", insertValue);
	System.out.println(insertValue+"삽입성공~!");
	session.commit();
	

	int deleteResult= session.update("qnaBoardMapper.deleteTag", boardNo);
	session.commit();
	System.out.println(deleteResult + "삭제 성공 !");
		
	//좋아요 관련 로직 시작
	//	<!-- 태그 처리 추가 -->	
	String userId=""; 
	Map<String,Object> map3 = new HashMap<String,Object>();

	map.put("userId", userId);
	map.put("boardNo", boardNo);
	int insertBoardLike = session.insert("qnaBoardMapper.insertBoardLike", map3);
	System.out.println(insertBoardLike+"삽입성공~!");
	session.commit();
	
	String likeStatus="";
	Map<String,Object> map4 = new HashMap<String,Object>();

	map.put("userId", userId);
	map.put("boardNo", boardNo);
	 int isBoardLike=session.selectOne("qnaBoardMapper.isBoardLike", map4);
		 System.out.println(isBoardLike+"검색성공~!");
	 
	
	 int selectResult1=session.selectOne("qnaBoardMapper.isBoardLike", replyNo);
	 System.out.println(selectResult1+"검색성공~!");
	 

		int deleteResult1= session.delete("qnaBoardMapper.deleteBoard", boardNo);
		System.out.println(deleteResult1 + "삭제 성공 !");
		session.commit();
	
		int increaseCntBoardLike= session.update("qnaBoardMapper.increaseCntBoardLike", boardNo);
			System.out.println(increaseCntBoardLike + "업데이트 성공 !");
			session.commit();	
		
			 int decreaseCntBoardLike= session.update("qnaBoardMapper.decreaseCntBoardLike", boardNo);
		System.out.println(decreaseCntBoardLike + "업데이트 성공 !");
		session.commit();
	
		int selectCntBoardLike=session.selectOne("qnaBoardMapper.selectCntBoardLike", boardNo);
		 System.out.println(selectCntBoardLike+"검색성공~!");
		 
		
		 List<Integer> list11=session.selectList("qnaBoardMapper.selectAllRecommendNo", userId);
		 for (Integer v : list11) {
				System.out.println(v+"검색성공~!");
			}
		
		
		
		
	
//게시판 Q&A : qnaReplyMapper.xml
		 QnaReply qr=new QnaReply(1, 1, new Member("2222", "2222"), "답변", "2017-12-13", 1, new Date(2017, 12, 13));

			int insertResult1 = session.insert("qnaBoardMapper.insertBoardLike", qr);
			System.out.println(insertResult1+"삽입성공~!");
			session.commit();	
			
			int insertResult2= session.insert("qnaBoardMapper.insertReply", qr);
			System.out.println(insertResult2+"삽입성공~!");
			session.commit();	
			
		
			
			String replytext="";
			Map<String,Object> map6 = new HashMap<String, Object>();
			map.put("replyNo", replyNo);
			map.put("replytext", replytext);
			System.out.println("dao replyNo:"+replyNo);
			System.out.println("dao replytext:"+replytext);
			int row=session.update("qnaReplyMapper.updateReply", map6);
			System.out.println(row+"업뎃 성공!");
			session.commit();
			
			int selectResult3=session.selectOne("qnaReplyMapper.selectUpdatedReply", replyNo);
			System.out.println(selectResult3+"검색성공~!");
			
			
			
			int row1=session.delete("qnaReplyMapper.deleteReply", replyNo);
			System.out.println(row1+"개 삭제 완료!!");
			session.commit();	
			
			int selectResult2=session.selectOne("qnaReplyMapper.getReply", replyNo);
			System.out.println(selectResult2+"검색성공~!");
			
			 String likeStatus1="1";
			Map<String,Object> map7 = new HashMap<String,Object>();
			
			map.put("userId", userId);
			map.put("replyNo", replyNo);
			int selectResult4=session.selectOne("qnaReplyMapper.isReplyLike", map7);
			 
			 System.out.println(selectResult4+"검색성공~!");
			
			 
			 Map<String,Object> map8 = new HashMap<String,Object>();
				
				map.put("userId", userId);
				map.put("replyNo", replyNo);
				int deleteResult2=session.delete("qnaReplyMapper.deleteReplyLike", map8);
				System.out.println(deleteResult2+"개 삭제 완료!!");
				session.commit();	
				
				
				int updateResult3=session.update("qnaReplyMapper.increaseCntReplyLike", replyNo);
				 System.out.println(updateResult3+"업데이트 성공~!");
				 session.commit();
				 
				 
				 int updateResult4=session.update("qnaReplyMapper.decreaseCntReplyLike", replyNo);
				 System.out.println(updateResult4+"업데이트 성공~!");
				 session.commit();
				 
				 
				
				 int selectCntReplyLike= session.selectOne("qnaReplyMapper.selectCntReplyLike", replyNo);
				 System.out.println(selectCntReplyLike+"검색 성공...");
				
				 List<Integer> list13= session.selectList("qnaBoardMapper.selectAllRecommendNo", userId);
				 for (Integer v1 : list13) {
						System.out.println(v1);
					}
			}

}

	
