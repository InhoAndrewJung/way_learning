package com.way.learning.controller.question;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.model.question.vo.GeneralQuestion;
import com.way.learning.service.question.AlgorithmQuestionService;
import com.way.learning.service.question.GeneralQuestionService;

@Controller
@RequestMapping("/question/general/*")
public class GeneralQuestionController {
	
	@Autowired
	GeneralQuestionService gqService;
	
	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String pageNo = "1";
		//pageNo = request.getParameter(pageNo);
		System.out.println(pageNo);
		List<GeneralQuestion> list = gqService.getQuestionList(pageNo);
		System.out.println("getQuestionList : "+list);
		return new ModelAndView("/question/general/list","list",list);
		
	}
	
	@RequestMapping("showContent")
	public ModelAndView showContent(String questionNo) throws SQLException {
		
		System.out.println("문제번호: "+questionNo);
		GeneralQuestion content = gqService.showContent(questionNo);
		System.out.println("getShowContent : "+content);
		return new ModelAndView("/question/general/showContent","content",content);
		
	}
	
	

}
