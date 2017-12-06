package com.way.learning.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.admin.dao.AdminDAO;
import com.way.learning.model.member.vo.Member;

@Service
public class AdminServieImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	public List<Member>  selectActiveMember(){
		return adminDAO.selectActiveMember();
	}
	
	public int changeAuthority(String userId,String role){
		return adminDAO.changeAuthority(userId,role);
	}
	

}
