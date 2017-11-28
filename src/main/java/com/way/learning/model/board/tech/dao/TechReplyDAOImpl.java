package com.way.learning.model.board.tech.dao;

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
	public void  insertReply(TechReply vo){
		sqlSession.insert("techReplyMapper.insertReply", vo);

	}

	//listReply
	public List<TechReply>  listReply(String boardNo){

		return sqlSession.selectList("techReplyMapper.listReply", boardNo);

	}

	//listReply
	public String  selectWriter(String no){

		return sqlSession.selectOne("techReplyMapper.selectWriter", no);

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
	
	//updateStep
		public void  updateStep(int ref, int re_step){
			Map<String,Object> map =new HashMap<String, Object>();
			map.put("ref", ref);
			map.put("re_step", re_step);

			int row=sqlSession.update("techReplyMapper.updateStep", map);
			System.out.println(row+"개 기존 리플 update 완료!!");
			
		}
		
		//insertReReply
		public void  insertReReply(TechReply rvo){

System.out.println("dao에서의 들어갈 vo:"+rvo);
			int row=sqlSession.insert("techReplyMapper.insertReReply", rvo);
			System.out.println(row+"개 재리플 insert 완료!!");
			
		}		



}