package com.way.learning.model.member.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.way.learning.model.member.vo.Member;

public interface MemberDAO {

	String findIdByEmail(String email);

	int updatefindPass( String password, String userId);

	Member findMemberById(String id);

	Member login(Member memberVO);

	void updateMember(Member vo, HttpServletRequest request);

	void registerMember(Member vo);

	int idcheck(String id);

}