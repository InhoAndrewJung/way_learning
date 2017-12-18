package com.way.leanring.test;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

public class AOP_MyBatisUnitAppTest {
	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();


//AOP : activityMapper.xml
		String userId="";String behavior="";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("behavior", behavior);
		int updateActivity= session.update("activityMapper.updateActivity", map);
		System.out.println(updateActivity + "업데이트 성공 !");
//AOP : updateAnswerMapper.xml
		int questionNo=1;
		int updatePostCntSubmit= session.update("updateAnswerMapper.updatePostCntSubmit", questionNo);
		System.out.println(updatePostCntSubmit + "업데이트 성공 !");
		
		
		int questionNo2=1;
		 int updatePostCntRight= session.update("updateAnswerMapper.updatePostCntRight",questionNo);
		System.out.println( updatePostCntRight + "업데이트 성공 !");
		
		int questionNo3=1; String userId1="1111";
		Map<String,Object> map1 = new HashMap<String,Object>();
		map.put("questionNo", questionNo3);
		map.put("userId", userId1);
		int insertMyCntsubmit =session.insert("updateAnswerMapper.insertMyCntsubmit",map1);
		System.out.println(  insertMyCntsubmit + "삽입 성공 !");
		session.commit();
		
		int questionNo4=1; String userId2="";
		Map<String,Object> map2 = new HashMap<String,Object>();
		map.put("questionNo", questionNo);
		map.put("userId", userId);
		int updatePostCntRight1=session.update("updateAnswerMapper.updateMyCntRight",map2);
		System.out.println(  updatePostCntRight1 + "업데이트 성공 !");
		session.commit();
		
		int questionNo5=1; String userId3="1111";
		Map<String,Object> map3 = new HashMap<String,Object>();
		map.put("questionNo", questionNo5);
		map.put("userId", userId3);
		int insertMyCntRight=session.insert("updateAnswerMapper.insertMyCntRight",map3);
		System.out.println(  insertMyCntRight + "삽입 성공 !");
		session.commit();
		
		int questionNo6=1; String userId4="1111";
		Map<String,Object> map4 = new HashMap<String,Object>();
		map.put("questionNo", questionNo6);
		map.put("userId", userId4);
		int updateMyCntWrong=session.update("updateAnswerMapper.updateMyCntWrong",map);
		System.out.println(  updateMyCntWrong + "업데이트 성공 !");
		session.commit();
		
		int questionNo7=1; String userId5="1111";
		Map<String,Object> map5 = new HashMap<String,Object>();
		map.put("questionNo", questionNo7);
		map.put("userId", userId5);
		int insertMyCntWrong=session.insert("updateAnswerMapper.insertMyCntWrong",map5);
		System.out.println(  insertMyCntWrong + "삽입 성공 !");
		session.commit();
		
		int questionNo8=1; String userId6="1111";
		Map<String,Object> map6 = new HashMap<String,Object>();
		map.put("questionNo", questionNo8);
		map.put("userId", userId6);
		int updateMyCntError=session.update("updateAnswerMapper.updateMyCntError",map6);
		System.out.println(  updateMyCntError + "업데이트 성공 !");
		session.commit();
		
		int questionNo9=1; String userId7="1111";
		Map<String,Object> map7 = new HashMap<String,Object>();
		map.put("questionNo", questionNo9);
		map.put("userId", userId7);
		int insertMyCntError=session.insert("updateAnswerMapper.insertMyCntError",map7);
		System.out.println(  insertMyCntError + "업데이트 성공 !");
		session.commit();

	
}

}
