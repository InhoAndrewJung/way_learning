package com.way.learning.model.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.member.vo.Authority;




@Repository
public class AuthoritiesDAOImpl implements AuthoritiesDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertAuthority(Authority authority) {
		return sqlSession.insert("authoritiesMapper.insertAuthority", authority);
	}

	@Override
	public List<Authority> selectAuthorityByUserName(String userId) {
		return sqlSession.selectList("authoritiesMapper.selectAuthorityByUserName", userId);
	}

}
