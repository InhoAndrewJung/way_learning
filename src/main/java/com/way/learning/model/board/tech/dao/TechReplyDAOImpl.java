package com.way.learning.model.board.tech.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.board.tech.vo.TechReply;



@Repository
public class TechReplyDAOImpl implements TechReplyDAO {
	@Autowired
	private SqlSession sqlSession;

	//insertReply
	public int  insertReply(TechReply vo){
		return sqlSession.insert("techReplyMapper.insertReply", vo);

	}

	//listReply
	public List<TechReply>  listReply(String boardNo){

		return sqlSession.selectList("techReplyMapper.listReply", boardNo);

	}

	

	//updateReply
	public void  updateReply(String replyNo, String replytext){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("replyNo", replyNo);
		map.put("replytext", replytext);
		System.out.println("dao replyNo:"+replyNo);
		System.out.println("dao replytext:"+replytext);
		int row=sqlSession.update("techReplyMapper.updateReply", map);
		System.out.println(row+"업뎃 성공!");

	}

	//selectUpdatedReply
	public String  selectUpdatedReply(String replyNo){


		return sqlSession.selectOne("techReplyMapper.selectUpdatedReply", replyNo);

	}
	//deleteReply
	public int  deleteReply(String replyNo){


		int row=sqlSession.delete("techReplyMapper.deleteReply", replyNo);
		System.out.println(row+"개 삭제 완료!!");
		return row;
	}
	
	//getReply
	public TechReply  getReply(String replyNo){


		return sqlSession.selectOne("techReplyMapper.getReply", replyNo);
	}
	
	
		
		
		
		
		@Override
		public int isReplyLike(String userId, int replyNo,String likeStatus) throws SQLException {
			Map<String,Object> map = new HashMap<String,Object>();
			
			map.put("userId", userId);
			map.put("replyNo", replyNo);
			
			return sqlSession.selectOne("techReplyMapper.isReplyLike", map);
			
		}
		
		
		
		@Override
		public void insertReplyLike(String userId, int replyNo) throws SQLException {
			Map<String,Object> map = new HashMap<String,Object>();
			
			map.put("userId", userId);
			map.put("replyNo", replyNo);
			
			 sqlSession.insert("techReplyMapper.insertReplyLike", map);
			
		}
		
		@Override
		public void deleteReplyLike(String userId, int replyNo) throws SQLException {
			Map<String,Object> map = new HashMap<String,Object>();
			
			map.put("userId", userId);
			map.put("replyNo", replyNo);
			
			 sqlSession.delete("techReplyMapper.deleteReplyLike", map);
			
		}
		
		@Override
		public int increaseCntReplyLike(int replyNo) throws SQLException {
			
			System.out.println("총 좋아요 올리기:"+replyNo);
			 return sqlSession.update("techReplyMapper.increaseCntReplyLike", replyNo);
			
		}
		
		
		@Override
		public int decreaseCntReplyLike(int replyNo) throws SQLException {
			
			System.out.println("총 좋아요 내리기:"+replyNo);
			 return sqlSession.update("techReplyMapper.decreaseCntReplyLike", replyNo);
			
		}
		
		
		@Override
		public int selectCntReplyLike(int replyNo) throws SQLException {
			Map<String,Object> map = new HashMap<String,Object>();
			
		
			
			return sqlSession.selectOne("techReplyMapper.selectCntReplyLike", replyNo);
			
		}

		



}