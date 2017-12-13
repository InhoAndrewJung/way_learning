package com.way.leanring.test;

import java.io.Reader;
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
	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();

	
//Member : authoritiesMapper.xml
				 Authority authority=new Authority(userId, role);
				 int insertAuthority=session.insert("authoritiesMapper.insertAuthority", authority);			 
				 System.out.println(insertAuthority+"삽입 성공..");
				 
				 String userId="";
				 List<Authority> list=Session.selectList("authoritiesMapper.selectAuthorityByUserName", userId);
				 for (Authority v : list) {
						System.out.println(v);
					}
				 
				 
				 
//Member : memberMapper.xml		
				 String userId="opilior";	
				 Member m=session.selectOne("memberMapper.findMemberById", userId);
				 
				 Member m=new Member(userId, password);
				 Member member=session.selectOne("memberMapper.login", m);
				 
				 Member vo=new Member(userId, email, password, activity, imgProfile, regDate, userType, uploadFile)
				 int updateAuthority=session.update("memberMapper.updateMember", vo);
				 System.out.println(updateAuthority+"업데이트 성공..");
				 
				 Member vo=new Member(userId, email, password, activity, imgProfile, regDate, userType, uploadFile)
				 int registerMember= session.insert("memberMapper.registerMember", vo);
				 System.out.println(registerMember+"삽입 성공..");
				 
				 String userId="opilior";
				 int idcheck=session.selectOne("memberMapper.idcheck", userId);
				 System.out.println(idcheck+"검색 성공.."); 
				 
				 String email="";
				 String userId=session.selectOne("memberMapper.findIdByEmail", email);
				 System.out.println(userId+"검색 성공..");
				 
				 String password=""; String userId="";
				 Map<String, Object> map = new HashMap<String, Object>();
					map.put("password", password);
					map.put("userId", userId);
				 int updatefindPass=session.update("memberMapper.updatefindPass", map);
				 
				 String email="";
				 int emailcheck=session.selectOne("memberMapper.emailcheck", email);
				 System.out.println(emailcheck+"검색 성공..");
				 
				 String userId="opilior";
				 List<String> list= Session.selectList("memberMapper.selectRightNo", userId);
				 
				 for (String v : list) {
						System.out.println(v);
					}
				 
				 String userId="opilior";
				 List<String> list= Session.selectList("memberMapper.selectWrongNo", userId);
				 
				 for (String v : list) {
						System.out.println(v);
					}
				 
				 String userId="opilior";
				 AnswerResult ar=session.selectOne("memberMapper.selectMyRecord", userId);
				 System.out.println(ar+"검색 성공..");
				 
				 String userId="opilior";
				 int selectMyRanking=session.selectOne("memberMapper.selectMyRanking", userId);
				 System.out.println(selectMyRanking+"삽입 성공..");
				 
				 String sorting=""; 
				 Map<String, Object> map = new HashMap<String, Object>();
					map.put("sorting", sorting);
				 List<AnswerResult>=session.selectList("memberMapper.selectAllRanking", map);
				 System.out.println(sorting + "검색성공..");
				 
				 String userId="opilior";
				 List list=session.selectList("memberMapper.selectBoardFavorite",userId);
				 System.out.println(list + "검색성공..");
				 
				 String userId="opilior";
				 List list=session.selectList("memberMapper.selectReplyFavorite",userId);			
				 System.out.println(list + "검색성공..");
				 
				 
				 String userId="opilior";
				 List list=session.selectList("memberMapper.selectLectureFavorite",userId);
				 System.out.println(list + "검색성공..");
				 
				 String userId="opilior";
				 List list=session.selectList("memberMapper.selectMyLectureRecord",userId);
				 System.out.println(list + "검색성공..");
				 
				 String userId="";
				 int deleteMember=session.delete("memberMapper.deleteMember",userId);
				 System.out.println(deleteMember + "삭제성공..");
	
	
}

}
