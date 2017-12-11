package com.way.learning.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.member.vo.Member;
import com.way.learning.service.admin.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@RequestMapping("/main")
	public String  main(ModelAndView mav) throws Exception {
		
		
		
		return "/admin/main";

	}
	
	@RequestMapping("/selectActiveMember")
	public ModelAndView  selectActiveMember(ModelAndView mav) throws Exception {
		
		List list=adminService.selectActiveMember();
		mav.addObject("list", list);
		mav.setViewName("admin/showActiveMember");
		return mav;

	}
	
	@ResponseBody
	@RequestMapping("/changeAuthority")
	public int  changeAuthority(ModelAndView mav, String userId, String role) throws Exception {
		System.out.println("role:"+role);
		int result=adminService.changeAuthority(userId,role);
		
		return result;

	}
	
	
	
	@RequestMapping("selectAllCourseList")
	public ModelAndView selectAccetpedCourseList(ModelAndView mav) throws Exception{

		List<Course> list=adminService.selectAllCourseList();
		mav.setViewName("admin/allCourseList");
		mav.addObject("list", list);

		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping("/changeAcceptStatus")
	public int  changeAcceptStatus(ModelAndView mav, String isAccept,String courseNo) throws Exception {
		System.out.println("isAccept:"+isAccept);
		System.out.println("courseNo:"+courseNo);
		int result=adminService.changeAcceptStatus(isAccept,courseNo);
		
		return result;

	}
	

}
