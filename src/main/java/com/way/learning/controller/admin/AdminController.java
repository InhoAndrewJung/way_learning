package com.way.learning.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.member.vo.Member;
import com.way.learning.service.admin.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService AdminService;

	@RequestMapping("/main")
	public String  main(ModelAndView mav) throws Exception {
		
		
		
		return "/admin/main";

	}
	
	@RequestMapping("/selectActiveMember")
	public ModelAndView  selectActiveMember(ModelAndView mav) throws Exception {
		
		List list=AdminService.selectActiveMember();
		mav.addObject("list", list);
		mav.setViewName("/admin/showActiveMember");
		return mav;

	}
	
	@ResponseBody
	@RequestMapping("/changeAuthority")
	public int  changeAuthority(ModelAndView mav, String userId, String role) throws Exception {
		System.out.println("role:"+role);
		int result=AdminService.changeAuthority(userId,role);
		
		return result;

	}

}
