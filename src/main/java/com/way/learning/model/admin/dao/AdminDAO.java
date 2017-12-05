package com.way.learning.model.admin.dao;

import java.util.List;

import com.way.learning.model.member.vo.Member;

public interface AdminDAO {
	public List selectActiveMember();
	public int changeAuthority(String userId,String role);

}
