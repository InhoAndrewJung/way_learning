package com.way.learning.model.member.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.way.learning.model.member.vo.Member;
import com.way.learning.model.question.vo.AnswerResult;



public interface MemberDAO {

	Member findMemberById(String id);

	Member login(Member memberVO);

	void updateMember(Member vo,HttpServletRequest request);

	void registerMember(Member vo);

	int idcheck(String id);
	public List<String> selectRightNo(String userId);
	public List<String> selectWrongNo(String userId);
	public AnswerResult selectMyRecord(String userId);
	public int selectMyRanking(String userId);
	public List<AnswerResult> selectAllRanking(String sorting);


}