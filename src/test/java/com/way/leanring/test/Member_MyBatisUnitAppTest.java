package com.way.leanring.test;

import java.io.Reader;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.way.learning.model.member.vo.Authority;
import com.way.learning.model.member.vo.Member;
import com.way.learning.model.question.vo.AnswerResult;

public class Member_MyBatisUnitAppTest {
	String userId = "1111";
	String password = "1111";
	String email = "11edfa11@naver.com";

	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();

		// Member : authoritiesMapper.xml
		Authority authority = new Authority(userId, "ROLE_MEMBER");
		int insertAuthority = session.insert("authoritiesMapper.insertAuthority", authority);
		System.out.println(insertAuthority + "삽입 성공..");
		session.commit();

		List<Authority> list1 = session.selectList("authoritiesMapper.selectAuthorityByUserName", userId);
		for (Authority v : list1) {
			System.out.println(v);
		}

		// Member : memberMapper.xml

		Member vo1 = new Member(userId, email, password, 10, "dd.jpg", new Date(2017, 12, 18));
		int registerMember = session.insert("memberMapper.registerMember", vo1);
		System.out.println(registerMember + "삽입 성공..");
		session.commit();

		Member m = session.selectOne("memberMapper.findMemberById", userId);

		Member m1 = new Member(userId, password);
		Member member = session.selectOne("memberMapper.login", m1);

		Member vo = new Member(userId, email, password, 1, "dd.jpg", new Date(2017, 12, 18));
		int updateAuthority = session.update("memberMapper.updateMember", vo);
		System.out.println(updateAuthority + "업데이트 성공..");
		session.commit();

		int idcheck = session.selectOne("memberMapper.idcheck", userId);
		System.out.println(idcheck + "검색 성공..");

		String email = "ealurill@naver.com";
		String userId1 = session.selectOne("memberMapper.findIdByEmail", email);
		System.out.println(userId1 + "검색 성공..");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("password", password);
		map.put("userId", userId);
		int updatefindPass = session.update("memberMapper.updatefindPass", map);
		session.commit();

		int emailcheck = session.selectOne("memberMapper.emailcheck", email);
		System.out.println(emailcheck + "검색 성공..");

		List<String> list = session.selectList("memberMapper.selectRightNo", userId);

		for (String v : list) {
			System.out.println(v);
		}

		List<String> list2 = session.selectList("memberMapper.selectWrongNo", userId);

		for (String v : list2) {
			System.out.println(v);
		}

		AnswerResult ar = session.selectOne("memberMapper.selectMyRecord", userId);
		System.out.println(ar + "검색 성공..");

		int selectMyRanking = session.selectOne("memberMapper.selectMyRanking", userId);
		System.out.println(selectMyRanking + "삽입 성공..");

		String sorting = "";
		Map<String, Object> map1 = new HashMap<String, Object>();
		map.put("sorting", sorting);
		List<AnswerResult> list3 = session.selectList("memberMapper.selectAllRanking", map1);
		for (AnswerResult v : list3) {
			System.out.println(v);
		}
		System.out.println(sorting + "검색성공..");

		List list4 = session.selectList("memberMapper.selectBoardFavorite", userId);
		System.out.println(list4 + "검색성공..");

		List list5 = session.selectList("memberMapper.selectReplyFavorite", userId);
		System.out.println(list5 + "검색성공..");

		List list6 = session.selectList("memberMapper.selectLectureFavorite", userId);
		System.out.println(list6 + "검색성공..");

		List list7 = session.selectList("memberMapper.selectMyLectureRecord", userId);
		System.out.println(list7 + "검색성공..");

		int deleteMember = session.delete("memberMapper.deleteMember", userId);
		System.out.println(deleteMember + "삭제성공..");
		session.commit();
	}

}
