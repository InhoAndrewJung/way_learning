package com.way.learning.service.board.qna;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.way.learning.model.board.qna.dao.QnaReplyDAO;
import com.way.learning.model.board.qna.vo.QnaReply;
import com.way.learning.model.member.vo.Member;



@Service
public interface QnaReplyService {

	

	//insertReply
	public int  insertReply(QnaReply vo);

	public List<QnaReply>  listReply(String boardNo ,HttpSession session);

	//updateReply
	public void  updateReply(String rno, String replytext);

	//selectUpdatedReply
	public String  selectUpdatedReply(String rno);

	//deleteReply
	public int  deleteReply(String replyNo);
	
	public int isReplyLike(String userId, int replyNo,String likeStatus) throws SQLException;
	
	public int selectCntReplyLike(int replyNo) throws SQLException;
	
	public List<Integer> selectAllRecommendNo() throws SQLException;

	






}














