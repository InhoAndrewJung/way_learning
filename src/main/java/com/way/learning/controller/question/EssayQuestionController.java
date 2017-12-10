package com.way.learning.controller.question;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.model.question.vo.GeneralChoice;
import com.way.learning.model.question.vo.GeneralQuestion;
import com.way.learning.service.question.QuestionService;
import com.way.learning.util.Compute;
import com.way.learning.util.Data;
import com.way.learning.util.Preprocess;

@Controller
@RequestMapping("/question/essay/*")
public class EssayQuestionController {
	

	@Autowired
	private QuestionService questionService;
	
	@RequestMapping("/makeQuestion")
	public String makeQuestion(){
		return "/question/essay/makeQuestion";
	}
	
	@RequestMapping("/insertQuestion")
	public String insertEssayQuestion(@ModelAttribute AlgorithmQuestion aq) throws SQLException{

		questionService.insertEssayQuestion(aq);

		return "redirect:/question/essay/getList"; 
	}
	
	@RequestMapping("/getList")
	public  ModelAndView getList(ModelAndView mav, @RequestParam(defaultValue="") String keyword) throws SQLException{
		System.out.println("keyword:"+keyword);
	
		 List<AlgorithmQuestion> list=questionService.getEssayList(keyword);
		 mav.addObject("list", list);
		 mav.addObject("keyword", keyword);
		 mav.setViewName("/question/essay/list");

		return mav;
	}
	@RequestMapping("/getEssayList")
	public ModelAndView getEssayList(HttpServletRequest request, ModelAndView mav, HttpServletResponse response,
			@RequestParam(defaultValue = "") String keyword)
			throws SQLException {
		System.out.println("keyword:" + keyword);
		List<AlgorithmQuestion> list = questionService.getEssayList(keyword);
		System.out.println("qna  컨트롤러 에서 list:" + list);

		mav.addObject("list", list);
		mav.addObject("keyword", keyword);
		mav.setViewName("/question/essay/list");

		return mav;
	}
	
	@RequestMapping("/showEssayContent")
	public  ModelAndView showEssayContent(ModelAndView mav,int questionNo, String keyword) throws SQLException{

		AlgorithmQuestion aq=questionService.showEssayContent(questionNo);
	
		 mav.addObject("aq", aq);
		 mav.addObject("keyword", keyword);
		 mav.setViewName("/question/essay/essayContent");
	
		

		return mav;
	}
	
	@RequestMapping("/essayResult")
	public  ModelAndView essayResult(int questionNo, String code,ModelAndView mav) throws  Exception{
		 
		
		String[] compiledResult = new String[4];
		
		int tcNo = 0; //TestCase number
		//Handling System.in & Compare user soureCode and Answer
		Preprocess proc = new Preprocess();
		for(tcNo=0; tcNo<2; tcNo++) {
			code = proc.process(code, questionNo, tcNo);
			System.out.println("After process:"+code);
			//Compile using javac
			Compute com = new Compute();
			compiledResult = com.compile(code, questionNo, tcNo);
			//put error message and result to setVO
		}
		//0 : answerResult, 1 : error, 2 : result 
		System.out.println("에러메세지@controller : "+ compiledResult[0]);
		if(compiledResult[0].contains("Exception")) {
			System.out.println("런타임에러 확인 :"+compiledResult[0]);
			compiledResult[0] = "Exception";
		}
		
		System.out.println("런타임에러 확인 :"+compiledResult[1]);
		Data set = new Data(compiledResult[0], compiledResult[1], compiledResult[2]);
		mav.setViewName("/question/essay/essayResult");
		mav.addObject("code",set);
		mav.addObject("questionNo",questionNo);
		
		return mav;	
	}
		
	
	

	
	
	

}
