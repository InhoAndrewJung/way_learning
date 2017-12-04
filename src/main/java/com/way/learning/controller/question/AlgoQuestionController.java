package com.way.learning.controller.question;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.member.vo.Member;
import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.service.question.AlgorithmQuestionService;

@Controller
@RequestMapping("/question/algo/*")
public class AlgoQuestionController {
	
	@Autowired
	AlgorithmQuestionService algoService;
	
	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String pageNo = "1";
		//pageNo = request.getParameter(pageNo);
		System.out.println(pageNo);
		List<AlgorithmQuestion> list = algoService.getQuestionList(pageNo);
		System.out.println("getQuestionList : "+list);
		return new ModelAndView("/question/algo/list","list",list);
		
	}
	
	@RequestMapping("showContent")
	public ModelAndView showContent(String questionNo) throws SQLException {
		
		System.out.println("문제번호: "+questionNo);
		AlgorithmQuestion content = algoService.showContent(questionNo);
		System.out.println("getShowContent : "+content);
		return new ModelAndView("/question/algo/showContent","content",content);
		
	}
	
	@RequestMapping("submit")
	public ModelAndView updateSubmit(String questionNo, String answer) throws SQLException {
		
		System.out.println("제출된 문제번호 :"+questionNo);
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		algoService.updateSubmit(questionNo, mvo.getUserId());
		
		return null;
		
	}
	
	@RequestMapping("write")
	public ModelAndView write(AlgorithmQuestion vo) throws SQLException {
		
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println("제출된 문제번호 :" + );
		algoService.write(vo, mvo.getUserId());
		
		return null;
		
	}
	
	

}
