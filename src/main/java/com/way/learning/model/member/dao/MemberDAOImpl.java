package com.way.learning.model.member.dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.way.learning.model.member.vo.Member;



@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource	
	private SqlSession sqlSession;
	
	@Override
	public Member findMemberById(String userId){
		return sqlSession.selectOne("memberMapper.findMemberById",userId);
	}
	
	@Override
	public Member login(Member memberVO){
		return sqlSession.selectOne("memberMapper.login",memberVO);
	}
	
	@Override
	public void updateMember(Member vo,HttpServletRequest request) {
		sqlSession.update("memberMapper.updateMember",vo);			
	}	
	
	@Override
	public void registerMember(Member vo) {
		sqlSession.insert("memberMapper.registerMember",vo);			
	}
	
	@Override
	public int idcheck(String userId) {
		System.out.println("다오임플 아이디:"+userId);
		return sqlSession.selectOne("memberMapper.idcheck",userId);				
	}

	@Override
	public String findIdByEmail(String email) {
		
		return sqlSession.selectOne("memberMapper.findIdByEmail", email);
	}
	@Override
	public int updatefindPass(String password, String userId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("password",password);
		map.put("userId",userId);
		return sqlSession.update("memberMapper.updatefindPass",map);
	}
	
}



















