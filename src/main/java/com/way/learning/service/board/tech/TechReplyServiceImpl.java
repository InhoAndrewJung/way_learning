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
	public void  insertReply(TechReply vo){
		techReplyDao.insertReply(vo);

	}

	public List<TechReply>  listReply(String boardNo ,HttpSession session){



		List<TechReply> list = techReplyDao.listReply(boardNo);
		// 현재 사용자
		
		System.out.println("reply list:"+list);
		return list;




	}

	//updateReply
	public void  updateReply(String rno, String replytext){
			if(replytext.indexOf("Re:") ==-1){
				replytext	="Re:"+replytext;
			
			}
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
	public void isReplyLike(String userId, int replyNo,String likeStatus) throws SQLException {
		int result=techReplyDao.isReplyLike(userId, replyNo, likeStatus);
		System.out.println("서비스 isReplyLike likeStatus:"+likeStatus);
		System.out.println("서비스 isReplyLike userId:"+userId);
		System.out.println("서비스 isReplyLike boardNo:"+replyNo);
		System.out.println("서비스 isReplyike result:"+result);
		
		if(likeStatus.equals("likeUp")){
			if(result==0){
				techReplyDao.insertReplyLike(userId, replyNo);
				techReplyDao.increaseCntReplyLike(replyNo);
			}
			
		}else if(likeStatus.equals("likeDown")){
			if(result==1){
				techReplyDao.deleteReplyLike(userId, replyNo);
				techReplyDao.decreaseCntReplyLike(replyNo);
			}
			
		}
	
	}
	
	@Override
	public int selectCntReplyLike(int replyNo) throws SQLException {

		return techReplyDao.selectCntReplyLike(replyNo);
		
	}
}
	