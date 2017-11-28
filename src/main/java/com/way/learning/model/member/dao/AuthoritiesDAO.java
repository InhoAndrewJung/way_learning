package com.way.learning.model.member.dao;
/*
 * insertAuthority
 * selectAuthorityByUserName
 */

import java.util.List;

import com.way.learning.model.member.vo.Authority;



public interface AuthoritiesDAO {
	int insertAuthority(Authority authority);
	List<Authority> selectAuthorityByUserName(String userId);
}
