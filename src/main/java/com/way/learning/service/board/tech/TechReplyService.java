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
public interface TechReplyService {

	;

	//insertReply
	public void  insertReply(TechReply vo);

	public List<TechReply>  listReply(String boardNo ,HttpSession session);

	//updateReply
	public void  updateReply(String rno, String replytext);

	//selectUpdatedReply
	public String  selectUpdatedReply(String rno);

	//deleteReply
	public int  deleteReply(String replyNo);

	






}














