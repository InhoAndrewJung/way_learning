package com.way.learning.model.board.tech.dao;



import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.board.tech.vo.TechReply;




public interface TechReplyDAO {



	//insertReply
	public int  insertReply(TechReply vo);

	//listReply
	public List<TechReply>  listReply(int no);

	//updateReply
	public void  updateReply(String rno, String replytext);

	//selectUpdatedReply
	public String  selectUpdatedReply(String rno);
	//deleteReply
	public int  deleteReply(String rno);

	public int isReplyLike(String userId, int replyNo) throws SQLException;
	
	public void insertReplyLike(String userId, int replyNo,int boardNo) throws SQLException;
	
	public void deleteReplyLike(String userId, int replyNo,int boardNo) throws SQLException;
	
	public int increaseCntReplyLike(int replyNo) throws SQLException;
	
	public int decreaseCntReplyLike(int replyNo) throws SQLException;
	
	public int selectCntReplyLike(int replyNo) throws SQLException;
	
	public List<Integer> selectAllRecommendNo(int boardNo) throws SQLException;



}




















