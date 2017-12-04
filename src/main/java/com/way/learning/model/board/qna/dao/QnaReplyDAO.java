package com.way.learning.model.board.qna.dao;



import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.board.qna.vo.QnaReply;




public interface QnaReplyDAO {



	//insertReply
	public int  insertReply(QnaReply vo);

	//listReply
	public List<QnaReply>  listReply(String no);

	//updateReply
	public void  updateReply(String rno, String replytext);

	//selectUpdatedReply
	public String  selectUpdatedReply(String rno);
	//deleteReply
	public int  deleteReply(String rno);

	public int isReplyLike(String userId, int replyNo,String likeStatus) throws SQLException;
	
	public void insertReplyLike(String userId, int replyNo) throws SQLException;
	
	public void deleteReplyLike(String userId, int replyNo) throws SQLException;
	
	public int increaseCntReplyLike(int replyNo) throws SQLException;
	
	public int decreaseCntReplyLike(int replyNo) throws SQLException;
	
	public int selectCntReplyLike(int replyNo) throws SQLException;
	
	public List<Integer> selectAllRecommendNo() throws SQLException;



}




















