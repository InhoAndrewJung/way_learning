package com.way.learning.model.member.dao;

import java.util.HashMap;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.way.learning.model.member.vo.Member;
import com.way.learning.model.question.vo.AnswerResult;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSession sqlSession;

	@Override
	public Member findMemberById(String userId) {
		return sqlSession.selectOne("memberMapper.findMemberById", userId);
	}

	@Override
	public Member login(Member memberVO) {
		return sqlSession.selectOne("memberMapper.login", memberVO);
	}

	@Override
	public void updateMember(Member vo, HttpServletRequest request) {
		sqlSession.update("memberMapper.updateMember", vo);
	}

	@Override
	public void registerMember(Member vo) {
		sqlSession.insert("memberMapper.registerMember", vo);
	}

	@Override
	public int idcheck(String userId) {
		System.out.println("다오임플 아이디:" + userId);
		return sqlSession.selectOne("memberMapper.idcheck", userId);
	}

	@Override
	public String findIdByEmail(String email) {

		return sqlSession.selectOne("memberMapper.findIdByEmail", email);
	}

	@Override
	public int updatefindPass(String password, String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("password", password);
		map.put("userId", userId);
		return sqlSession.update("memberMapper.updatefindPass", map);
	}

	@Override
	public int emailcheck(String email) {

		return sqlSession.selectOne("memberMapper.emailcheck", email);
	}

	@Override
	public List<String> selectRightNo(String userId) {
		return sqlSession.selectList("memberMapper.selectRightNo", userId);
	}

	@Override
	public List<String> selectWrongNo(String userId) {
		return sqlSession.selectList("memberMapper.selectWrongNo", userId);
	}

	@Override
	public AnswerResult selectMyRecord(String userId) {
		return sqlSession.selectOne("memberMapper.selectMyRecord", userId);
	}

	@Override
	public int selectMyRanking(String userId) {
		return sqlSession.selectOne("memberMapper.selectMyRanking", userId);
	}

	@Override
	public List<AnswerResult> selectAllRanking(String sorting) {
		System.out.println("selectAllRanking dao sorting:" + sorting);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sorting", sorting);
		return sqlSession.selectList("memberMapper.selectAllRanking", map);
	}

	@Override
	public List selectBoardFavorite() {
		System.out.println("selectBoardFavorite dao ");

		return sqlSession.selectList("memberMapper.selectBoardFavorite");
	}

	@Override
	public List selectReplyFavorite() {
		System.out.println("selectReplyFavorite dao ");
		
		return sqlSession.selectList("memberMapper.selectReplyFavorite");				
	}



}
