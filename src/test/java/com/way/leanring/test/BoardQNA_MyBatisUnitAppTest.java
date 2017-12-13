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

public class BoardQNA_MyBatisUnitAppTest {
	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();


		
//게시판 Q&A : qnaBoardMapper.xml
		QnaBoard qb=new QnaBoard(boardNo, member, title, content, cntView, cntReply, cntBoardLike, regDate, tag);
		int insertBoard = session.insert("qnaBoardMapper.write", qb);
		session.commit();
		System.out.println(insertBoard + " 삽입 성공...");
		
		String tag=""; int boardNo=0;
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("tag", tag);
		map.put("boardNo", boardNo);
		int insertTag=session.insert("qnaBoardMapper.insertTag", map);
		System.out.println(insertTag + " 삽입 성공...");
		
		int no=1;
		Date date=session.selectOne("qnaBoardMapper.selectByNoForDate", no);
		System.out.println(date+"검색성공~!");
		
		String pageNo=1;String keyword=""; String sorting="";
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("keyword", keyword);
		map.put("pageNo", pageNo);
		map.put("sorting", sorting);
		List<QnaBoard> list =session.selectList("qnaBoardMapper.getBoardList", map);
		for (QnaBoard v : list) {
			System.out.println(v+"검색성공~!");
		}
		
		List list =session.selectList("qnaBoardMapper.getTagList", QnaBoard);
		System.out.println(list+"검색성공~!");
		
		String boardNo="";
		List list=session.selectList("qnaBoardMapper.getTag",boardNo);
		System.out.println(list+"검색성공~!");
		
		String boardNo="";
		QnaBoard qb =session.selectList("qnaBoardMapper.showContent", boardNo);
		System.out.println(qb+"검색성공~!");
		
		
		String boardNo="1";
		int updateResult= session.update("qnaBoardMapper.updateCount", boardNo);
		System.out.println(updateResult + "업데이트 성공 !");

		String boardNo="1";
		int updateResult= session.update("qnaBoardMapper.updateBoard", boardNo);
		System.out.println(updateResult + "업데이트 성공 !");
		
		int boardNo=1;
		int deleteTag= session.delete("qnaBoardMapper.deleteTag",boardNo);
		System.out.println(deleteTag + "삭제 성공 !");
		
		
		
		//<!-- 페이징 처리 추가 -->
		String replyNo="1";
		 int selectResult=session.selectOne("qnaBoardMapper.totalCount", replyNo);
		
			System.out.println(selectResult+"검색성공~!");
			
			String replyNo="1";
			 int selectResult=session.selectOne("qnaBoardMapper.countReply", replyNo);
			System.out.println(selectResult+"검색성공~!");
		
		String keyword="1";
		int countArticlet=session.selectOne("qnaBoardMapper.countArticle",  keyword);
		System.out.println(countArticlet+"검색성공~!");
	
	
	//	<!-- 태그 처리 추가 -->	
	String insertValue = "boardNo";String insertValue2 = "tag";
	int insertResult = session.insert("qnaBoardMapper.insertTag", insertValue);
	System.out.println(insertValue+"삽입성공~!");
	session.commit();
	
	String boardNo="1";
	int deleteResult= session.update("qnaBoardMapper.deleteTag", boardNo);
	System.out.println(deleteResult + "삭제 성공 !");
		
	//좋아요 관련 로직 시작
	//	<!-- 태그 처리 추가 -->	
	String userId=""; int boardNo=0;
	Map<String,Object> map = new HashMap<String,Object>();

	map.put("userId", userId);
	map.put("boardNo", boardNo);
	int insertBoardLike = session.insert("qnaBoardMapper.insertBoardLike", map);
	System.out.println(insertBoardLike+"삽입성공~!");
	session.commit();
	
	String userId=""; int boardNo=1;String likeStatus="";
	Map<String,Object> map = new HashMap<String,Object>();

	map.put("userId", userId);
	map.put("boardNo", boardNo);
	 int isBoardLike=session.selectOne("qnaBoardMapper.isBoardLike", map);
		 System.out.println(isBoardLike+"검색성공~!");
	 
	 String replyNo="1";
	 int selectResult=session.selectOne("qnaBoardMapper.isBoardLike", replyNo);
	 System.out.println(selectResult+"검색성공~!");
	 
	 String boardNo="1";
		int deleteResult= session.delete("qnaBoardMapper.deleteBoard", boardNo);
		System.out.println(deleteResult + "삭제 성공 !");
		
		int boardNo=1;
		int increaseCntBoardLike= session.update("qnaBoardMapper.increaseCntBoardLike", boardNo);
			System.out.println(increaseCntBoardLike + "업데이트 성공 !");
			
			int boardNo=1;
			 int decreaseCntBoardLike= session.update("qnaBoardMapper.decreaseCntBoardLike", boardNo);
		System.out.println(decreaseCntBoardLike + "업데이트 성공 !");
		
		int boardNo=1;
		int selectCntBoardLike=session.selectOne("qnaBoardMapper.selectCntBoardLike", boardNo);
		 System.out.println(selectCntBoardLike+"검색성공~!");
		 
		 String userId="1";
		 List<Integer> list=session.selectList("qnaBoardMapper.selectAllRecommendNo", userId);
		 System.out.println(selectResult+"검색성공~!");
		
		
		
	
//게시판 Q&A : qnaReplyMapper.xml
		 QnaReply qr=new QnaReply(replyNo, boardNo, member, replytext, regdate, cntReplyLike, reg_date)

			int insertResult = session.insert("qnaBoardMapper.insertBoardLike", qr);
			System.out.println(insertValue+"삽입성공~!");
			session.commit();	
			
			int insertResult= session.insert("qnaBoardMapper.insertReply", qr);
			System.out.println(insertValue+"삽입성공~!");
			session.commit();	
			
			List<QnaReply> list=selectList("qnaReplyMapper.listReply", boardNo);
			for (Member v : list) {
				System.out.println(v+"검색성공~!");
			}
			String replyNo=""; 
			String replytext="";
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("replyNo", replyNo);
			map.put("replytext", replytext);
			System.out.println("dao replyNo:"+replyNo);
			System.out.println("dao replytext:"+replytext);
			int row=session.update("qnaReplyMapper.updateReply", map);
			System.out.println(row+"업뎃 성공!");
			
			int selectResult=session.selectOne("qnaReplyMapper.selectUpdatedReply", replyNo);
			System.out.println(selectResult+"검색성공~!");
			
			
			String replyNo="";
			int row=session.delete("qnaReplyMapper.deleteReply", replyNo);
			System.out.println(row+"개 삭제 완료!!");
			session.commit();	
			
			String replyNo="";
			int selectResult=session.selectOne("qnaReplyMapper.getReply", replyNo);
			System.out.println(selectResult+"검색성공~!");
			
			String userId=""; int replyNo=0;String likeStatus="";
			Map<String,Object> map = new HashMap<String,Object>();
			
			map.put("userId", userId);
			map.put("replyNo", replyNo);
			int selectResult=session.selectOne("qnaReplyMapper.isReplyLike", map);
			 
			 System.out.println(selectResult+"검색성공~!");
			
			 String userId=""; int replyNo=0;
			 Map<String,Object> map = new HashMap<String,Object>();
				
				map.put("userId", userId);
				map.put("replyNo", replyNo);
				int deleteResult=Session.delete("qnaReplyMapper.deleteReplyLike", map);
				System.out.println(deleteResult+"개 삭제 완료!!");
				session.commit();	
				
				int replyNo=0;
				int updateResult=session.update("qnaReplyMapper.increaseCntReplyLike", replyNo);
				 System.out.println(updateResult+"업데이트 성공~!");
				
				 int replyNo=0;
				 int updateResult=session.update("qnaReplyMapper.decreaseCntReplyLike", replyNo);
				 System.out.println(updateResult+"업데이트 성공~!");
				 
				 int replyNo=0;
				 Map<String,Object> map = new HashMap<String,Object>();
				 session.selectOne("qnaReplyMapper.selectCntReplyLike", replyNo);
				 
				 String userId="";
				 List<Integer> list= session.selectList("qnaBoardMapper.selectAllRecommendNo", userId);
				 for (ZipCodeVO v : list) {
						System.out.println(v);
					}
	
}

}
