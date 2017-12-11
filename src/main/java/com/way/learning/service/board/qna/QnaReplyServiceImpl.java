package com.way.learning.service.board.qna;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.way.learning.model.board.qna.dao.QnaReplyDAO;
import com.way.learning.model.board.qna.vo.QnaReply;

@Service
public class QnaReplyServiceImpl implements QnaReplyService{

	@Autowired
	private QnaReplyDAO qnaReplyDao;

	//insertReply
	public int  insertReply(QnaReply vo){
		return qnaReplyDao.insertReply(vo);

	}

	public List<QnaReply>  listReply(String boardNo ,HttpSession session){



		List<QnaReply> list = qnaReplyDao.listReply(boardNo);
		// 현재 사용자
		
		System.out.println("reply list:"+list);
		return list;




	}

	//updateReply
	public void  updateReply(String rno, String replytext){
			/*if(replytext.indexOf("Re:") ==-1){
				replytext	="Re:"+replytext;
			
			}*/
			qnaReplyDao.updateReply(rno, replytext);

	}

	//selectUpdatedReply
	public String  selectUpdatedReply(String rno){


		return qnaReplyDao.selectUpdatedReply(rno);

	}

	//deleteReply
	public int  deleteReply(String replyNo){


		return qnaReplyDao.deleteReply(replyNo);

	}
	
	
	@Transactional
	public int isReplyLike(String userId, int replyNo,String likeStatus) throws SQLException {
		int result=qnaReplyDao.isReplyLike(userId, replyNo, likeStatus);
		System.out.println("서비스 isReplyLike likeStatus:"+likeStatus);
		System.out.println("서비스 isReplyLike userId:"+userId);
		System.out.println("서비스 isReplyLike boardNo:"+replyNo);
		System.out.println("서비스 isReplyike result:"+result);
		int action=0;
		if(likeStatus.equals("likeUp")){
			if(result==0){
				qnaReplyDao.insertReplyLike(userId, replyNo);
				action=qnaReplyDao.increaseCntReplyLike(replyNo);
			}
			
		}else if(likeStatus.equals("likeDown")){
			if(result==1){
				qnaReplyDao.deleteReplyLike(userId, replyNo);
			action=qnaReplyDao.decreaseCntReplyLike(replyNo);
			}
			
		}
		return action;
		
	}
	
	@Override
	public int selectCntReplyLike(int replyNo) throws SQLException {

		return qnaReplyDao.selectCntReplyLike(replyNo);
		
	}
	
	@Override
	public List<Integer> selectAllRecommendNo() throws SQLException {

		return qnaReplyDao.selectAllRecommendNo();
		
	}
	
	
}
	