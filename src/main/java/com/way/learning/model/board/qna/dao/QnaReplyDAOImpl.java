package com.way.learning.model.board.qna.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.board.qna.vo.QnaReply;



@Repository
public class QnaReplyDAOImpl implements QnaReplyDAO {
	@Autowired
	private SqlSession sqlSession;

	//insertReply
	public int  insertReply(QnaReply vo){
		return sqlSession.insert("qnaReplyMapper.insertReply", vo);

	}

	//listReply
	public List<QnaReply>  listReply(String boardNo){

		return sqlSession.selectList("qnaReplyMapper.listReply", boardNo);

	}

	

	//updateReply
	public void  updateReply(String replyNo, String replytext){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("replyNo", replyNo);
		map.put("replytext", replytext);
		System.out.println("dao replyNo:"+replyNo);
		System.out.println("dao replytext:"+replytext);
		int row=sqlSession.update("qnaReplyMapper.updateReply", map);
		System.out.println(row+"업뎃 성공!");

	}

	//selectUpdatedReply
	public String  selectUpdatedReply(String replyNo){


		return sqlSession.selectOne("qnaReplyMapper.selectUpdatedReply", replyNo);

	}
	//deleteReply
	public int  deleteReply(String replyNo){


		int row=sqlSession.delete("qnaReplyMapper.deleteReply", replyNo);
		System.out.println(row+"개 삭제 완료!!");
		return row;
	}
	
	//getReply
	public QnaReply  getReply(String replyNo){


		return sqlSession.selectOne("qnaReplyMapper.getReply", replyNo);
	}
	
	
		
		
		
		
		@Override
		public int isReplyLike(String userId, int replyNo,String likeStatus) throws SQLException {
			Map<String,Object> map = new HashMap<String,Object>();
			
			map.put("userId", userId);
			map.put("replyNo", replyNo);
			
			return sqlSession.selectOne("qnaReplyMapper.isReplyLike", map);
			
		}
		
		
		
		@Override
		public void insertReplyLike(String userId, int replyNo,int boardNo) throws SQLException {
			Map<String,Object> map = new HashMap<String,Object>();
			
			map.put("userId", userId);
			map.put("replyNo", replyNo);
			map.put("boardNo", boardNo);
			
			 sqlSession.insert("qnaReplyMapper.insertReplyLike", map);
			
		}
		
		@Override
		public void deleteReplyLike(String userId, int replyNo,int boardNo) throws SQLException {
			Map<String,Object> map = new HashMap<String,Object>();
			
			map.put("userId", userId);
			map.put("replyNo", replyNo);
			map.put("boardNo", boardNo);
			
			 sqlSession.delete("qnaReplyMapper.deleteReplyLike", map);
			
		}
		
		@Override
		public int increaseCntReplyLike(int replyNo) throws SQLException {
			
			System.out.println("총 좋아요 올리기:"+replyNo);
			 return sqlSession.update("qnaReplyMapper.increaseCntReplyLike", replyNo);
			
		}
		
		
		@Override
		public int decreaseCntReplyLike(int replyNo) throws SQLException {
			
			System.out.println("총 좋아요 내리기:"+replyNo);
			 return sqlSession.update("qnaReplyMapper.decreaseCntReplyLike", replyNo);
			
		}
		
		
		@Override
		public int selectCntReplyLike(int replyNo) throws SQLException {
			Map<String,Object> map = new HashMap<String,Object>();
			
		
			
			return sqlSession.selectOne("qnaReplyMapper.selectCntReplyLike", replyNo);
			
		}
		
		
		@Override
		public List<Integer> selectAllRecommendNo(int boardNo) throws SQLException {

			return sqlSession.selectList("qnaReplyMapper.selectAllRecommendNo",boardNo);
			
		}

		



}