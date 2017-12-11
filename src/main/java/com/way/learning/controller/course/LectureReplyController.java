package com.way.learning.controller.course;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.way.learning.model.course.vo.LectureReply;
import com.way.learning.model.member.vo.Member;
import com.way.learning.service.course.LectureReplyService;

@Controller
@RequestMapping("/lectureReply/*")
public class LectureReplyController {
	
	@Autowired
	private LectureReplyService lectureReplyService;
	
	
	@RequestMapping("insertReply")
	public ModelAndView insertReply(LectureReply rvo){
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		
		if(mvo==null){ //로그인 상태가 아니다...글쓰기로 못간다..
			return new ModelAndView("redirect:/");			
		}
		//로그인 한 상태라면
		rvo.setMember(mvo); //cvo와 mvo의 Hasing 관계가 성립된다..
		System.out.println("insertReply 컨트롤러 lvo:"+rvo);
		lectureReplyService.insertReply(rvo);


		return new ModelAndView("redirect:/","rvo",rvo);
	}
	
	@RequestMapping("listReply")
	public ModelAndView listReply(int lectureNo, int courseNo, ModelAndView mav) {
		System.out.println("listReply 컨트롤러 입성");
		System.out.println("넘어온 lectureNo:"+lectureNo);
		System.out.println("넘어온 courseNo:"+courseNo);
		List<LectureReply> list =lectureReplyService.selectListReply(lectureNo, courseNo);
		mav.setViewName("course/lecture/reply_list");
		System.out.println("컨트롤러 list:"+list);
		mav.addObject("list", list);

		return mav;
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="updateReply", produces="application/json; charset=UTF8")
	public  Map<String, Object>  updateReply(String replyNo,String replytext,String courseNo,String lectureNo, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		System.out.println("업뎃 컨트롤러 입성!");
		System.out.println("replyNo:"+replyNo);
		System.out.println("replytext:"+replytext);
		System.out.println("lectureNo:"+lectureNo);
		System.out.println("response:"+response);
		
		HashMap<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("replyNo", replyNo);
		mapParam.put("replytext", replytext);
		mapParam.put("courseNo", courseNo);
		mapParam.put("lectureNo", lectureNo);
		lectureReplyService.updateReply(mapParam);
		String replyText=lectureReplyService.selectUpdatedReply(mapParam);
	
		HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("replyText", replyText);
			System.out.println("리플업뎃 컨트롤러:"+replyText);
		return map;	
	}
	
	
	@ResponseBody
	@RequestMapping("deleteReply")
	public void deleteReply(String replyNo,String courseNo,String lectureNo, ModelAndView mav) {
		System.out.println("삭제 컨트롤러!");
		HashMap<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("replyNo", replyNo);
	
		mapParam.put("courseNo", courseNo);
		mapParam.put("lectureNo", lectureNo);
	
		lectureReplyService.deleteReply(mapParam);
		
		 
		
	}
	
	
	
	

}
