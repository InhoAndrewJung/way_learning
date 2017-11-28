package com.way.learning.service.board.tech;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.way.learning.model.board.tech.dao.TechReplyDAO;
import com.way.learning.model.board.tech.vo.TechReply;
import com.way.learning.model.member.vo.Member;



@Service
public class TechReplyService {

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

	






}














