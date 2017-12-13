package com.way.leanring.test;

import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

public class Admin_MyBatisUnitAppTest {
	@Test
	public void unitTest() throws Exception {
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession session = factory.openSession();

	/*	List list = session.selectList("adminMapper.selectActiveMember");
		System.out.println(list + "검색성공~!");

		String userId = "1111";
		String role = "ROLE_MEMBER";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("role", role);

		int changeAuthority = session.update("adminMapper.changeAuthority", map);
		System.out.println(changeAuthority + "업데이트 성공,, 랭킹 순번 먹임 !");

		List<Course> list1 = session.selectList("adminMapper.selectAllCourseList");
		for (Course v : list1) {
			System.out.println(v + "검색성공~!");
		}*/

		String isAccept = "1";
		String courseNo = "1";
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("isAccept", isAccept);
		map1.put("courseNo", courseNo);
		int changeAcceptStatus = session.update("adminMapper.changeAcceptStatus", map1);
		System.out.println(changeAcceptStatus + "업데이트 성공 !");
		session.commit();

	}

}
