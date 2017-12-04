package com.way.learning.service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.way.learning.model.member.vo.Authority;
import com.way.learning.model.member.vo.Member;
import com.way.learning.model.question.vo.AnswerResult;

public interface MemberService {
	Member findMemberById(String id);
	
	String findIdByEmail(String email);

	int updatefindPass(String  password,String userId);

	Member login(Member memberVO);

	void updateMember(Member vo, HttpServletRequest request) throws Exception;

	void registerMember(Member vo, HttpServletRequest request) throws Exception;

	String idcheck(String id);

	List<Authority> selectAuthorityByUsername(String username);
<<<<<<< HEAD

	int emailcheck (String email);
=======
	
	public List<String> selectRightNo(String userId);
	public List<String> selectWrongNo(String userId);
	public AnswerResult selectMyRecord(String userId);
	public int selectMyRanking(String userId);
	public List<AnswerResult> selectAllRanking(String sorting);
>>>>>>> master
}
