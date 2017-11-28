package com.way.learning.controller.member;


import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.member.vo.Member;
import com.way.learning.service.member.MemberService;



@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//회원정보수정시 비밀번호 암호화처리를 위한 객체를 주입받는다
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
		
	//회원가입 폼
	@RequestMapping("registerForm")
	public String registerForm() {
		
		return "member/registerForm";
	}
	

	
	//회원 가입하기 :: redirect 방식
	@RequestMapping("registerMember")
	public String insertMaember(Member vo,HttpServletRequest request) throws Exception {
		System.out.println("컨트롤러 멤버 vo:"+vo);
		System.out.println("컨트롤러 멤버 vo:"+vo);
		
		memberService.registerMember(vo,request);
		return "redirect:/";
	
	}
	
	//로그인 폼
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	

	
	
	
	//아이디 중복확인
	@RequestMapping("idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return memberService.idcheck(request.getParameter("userId"));
	}
	
	

	@RequestMapping("updateForm") 
	public String updateForm() {
		return "member/updateForm";
	}
	
	@RequestMapping("updateMember")
	public ModelAndView updateMemberAction(HttpServletRequest request, Member vo) throws Exception {
		memberService.updateMember(vo,request);
		
	
				
		
		return new ModelAndView("member/update_result");
	}
	
}












