package com.way.learning.service.admin;

import java.util.List;

import com.way.learning.model.member.vo.Member;

public interface AdminService {
	public List  selectActiveMember();
	public int changeAuthority(String userId,String role);

}
