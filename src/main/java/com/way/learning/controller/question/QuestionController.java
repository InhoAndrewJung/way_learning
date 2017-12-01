package com.way.learning.controller.question;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.question.vo.GeneralQuestion;
import com.way.learning.service.question.QuestionService;

@Controller
@RequestMapping("/question/*")
public class QuestionController {
	
	private QuestionService questionService;
	
	@RequestMapping("/general/makeQuestion")
	public String makeQuestion(){
		return "/question/makeQuestion";
		
		 
	}
	
	
	@RequestMapping("/general/insertQuestion")
	public String insertQuestion(@ModelAttribute GeneralQuestion gq, String[] answerChoice) throws SQLException{
		System.out.println("gq:"+gq);
		
		for(String s :answerChoice){
			System.out.println(s);
		}
		
		System.out.println("answerChoice:"+answerChoice);
		
		questionService.insertQuestion(gq,answerChoice);
		
		
		return "redirect:/";
		
		 
	}
	
	
	

}
