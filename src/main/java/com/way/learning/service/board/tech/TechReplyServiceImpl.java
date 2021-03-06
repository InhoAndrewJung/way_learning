package com.way.learning.service.board.tech;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.way.learning.model.board.tech.dao.TechReplyDAO;
import com.way.learning.model.board.tech.vo.TechReply;

@Service
public class TechReplyServiceImpl implements TechReplyService{

	@Autowired
	private TechReplyDAO techReplyDao;

	//insertReply
	public int  insertReply(TechReply vo){
		return techReplyDao.insertReply(vo);

	}

	public List<TechReply>  listReply(int boardNo ){



		List<TechReply> list = techReplyDao.listReply(boardNo);
		// 현재 사용자
		
		System.out.println("reply list:"+list);
		return list;




	}

	//updateReply
	public void  updateReply(String rno, String replytext){
			/*if(replytext.indexOf("Re:") ==-1){
				replytext	="Re:"+replytext;
			
			}*/
			techReplyDao.updateReply(rno, replytext);

	}

	//selectUpdatedReply
	public String  selectUpdatedReply(String rno){


		return techReplyDao.selectUpdatedReply(rno);

	}

	//deleteReply
	public int  deleteReply(String replyNo){


		return techReplyDao.deleteReply(replyNo);

	}
	
	
	@Transactional
	public int isReplyLike(String userId, int replyNo,int boardNo) throws SQLException {
		int result=techReplyDao.isReplyLike(userId, replyNo);
		
		System.out.println("서비스 isReplyLike userId:"+userId);
		System.out.println("서비스 isReplyLike boardNo:"+replyNo);
		System.out.println("서비스 isReplyike result:"+result);
		int action=0;
		
			if(result==0){
				techReplyDao.insertReplyLike(userId, replyNo,boardNo);
				action=techReplyDao.increaseCntReplyLike(replyNo);
			}
			
		
			else if(result==1){
				techReplyDao.deleteReplyLike(userId, replyNo,boardNo);
			action=techReplyDao.decreaseCntReplyLike(replyNo);
			}
			
	
		return action;
		
	}
	
	@Override
	public int selectCntReplyLike(int replyNo) throws SQLException {

		return techReplyDao.selectCntReplyLike(replyNo);
		
	}
	
	@Override
	public List<Integer> selectAllRecommendNo(int boardNo) throws SQLException {

		return techReplyDao.selectAllRecommendNo(boardNo);
		
	}
	
	
}
	