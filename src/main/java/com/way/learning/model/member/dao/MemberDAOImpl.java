package com.way.learning.model.member.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
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
		return sqlSession.selectOne("memberMapper.idcheck",userId);				
	}
	
}



















