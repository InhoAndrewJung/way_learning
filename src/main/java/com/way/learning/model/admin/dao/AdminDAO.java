package com.way.learning.model.admin.dao;

import java.util.List;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.member.vo.Member;

public interface AdminDAO {
	public List selectActiveMember();
	public int changeAuthority(String userId,String role);
	public List<Course> selectAllCourseList();
	public int changeAcceptStatus(String isAccept,String courseNo);

}
