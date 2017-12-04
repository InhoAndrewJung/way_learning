package com.way.learning.controller.question;

import java.sql.SQLException;
import java.util.List;

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
	
	@RequestMapping("/essayContent")
	public  ModelAndView showEssayContent(ModelAndView mav,int questionNo, String keyword) throws SQLException{

	GeneralQuestion aq=questionService.showEssayContent(questionNo);
	
		 mav.addObject("aq", aq);
		 mav.addObject("keyword", keyword);
		 mav.setViewName("/question/essay/essayContent");
		 
		

		return mav;
	}
	
	/*@RequestMapping("/shortAnswerResult")
	public  ModelAndView shortAnswerResult(ModelAndView mav,int questionNo, String answer) throws SQLException{

	
	System.out.println("questionNo:"+questionNo);
	System.out.println("answer:"+answer);
	int result=questionService.checkAnswer(questionNo, answer);
		if(result ==1){
			mav.addObject("result", "맞았습니다");
		}else{
			 mav.addObject("result", "틀렸습니다. 다시풀어보세요");
			
		}
		mav.addObject("questionNo", questionNo);
		mav.addObject("shortAnswer", "shortAnswer");
		 mav.setViewName("/question/general/generalResult");
		 
		
		 

		return mav;
	}*/
	
	
	
	/*@RequestMapping("/makeQuestion")
	public String makeQuestion(){
		return "/question/general/makeQuestion";
	}
	
	
	@RequestMapping("/insertQuestion")
	public String insertQuestion(@ModelAttribute GeneralQuestion gq, String[] answerChoice) throws SQLException{
		System.out.println("gq:"+gq);
		
		for(String s :answerChoice){
			System.out.println(s);
		}
		
		System.out.println("answerChoice:"+answerChoice);
		
		questionService.insertQuestion(gq,answerChoice);

		return "redirect:/question/general/getList"; 
	}
	
	@RequestMapping("/getList")
	public  ModelAndView getList(ModelAndView mav, @RequestParam(defaultValue="")String keyword, @RequestParam(defaultValue="")String sorting) throws SQLException{
		System.out.println("keyword:"+keyword);
		System.out.println("sorting:"+sorting);
		 List<GeneralQuestion> list=questionService.getList(keyword, sorting);
		 mav.addObject("list", list);
		 mav.addObject("keyword", keyword);
		 mav.setViewName("/question/general/list");

		return mav;
	}
	
	@RequestMapping("/multipleChoiceContent")
	public  ModelAndView multipleChoiceContent(ModelAndView mav,int questionNo, String keyword) throws SQLException{

	GeneralQuestion gq=questionService.multipleChoiceContent(questionNo);
	List<GeneralChoice> aList=questionService.getAnswerChoice(questionNo);
		 mav.addObject("gq", gq);
		 mav.addObject("aList", aList);
		 mav.addObject("keyword", keyword);
		 mav.setViewName("/question/general/multipleChoiceContent");
		 
		 System.out.println("gq:"+gq);
		 System.out.println("aList:"+aList);

		return mav;
	}
	
	@RequestMapping("/multipleChoiceResult")
	public  ModelAndView multipleChoiceResult(ModelAndView mav,int questionNo, String answer) throws SQLException{

	
	System.out.println("questionNo:"+questionNo);
	System.out.println("answer:"+answer);
	int result=questionService.checkAnswer(questionNo, answer);
		if(result ==1){
			mav.addObject("result", "맞았습니다");
		}else{
			 mav.addObject("result", "틀렸습니다. 다시풀어보세요");
			
		}
		mav.addObject("questionNo", questionNo);
		mav.addObject("multipleChoice", "multipleChoice");
		 mav.setViewName("/question/general/generalResult");
		 
		
		 

		return mav;
	}
	
	@RequestMapping("/shortAnswerContent")
	public  ModelAndView shortAnswerContent(ModelAndView mav,int questionNo, String keyword) throws SQLException{

	GeneralQuestion gq=questionService.multipleChoiceContent(questionNo);
	
		 mav.addObject("gq", gq);
		 mav.addObject("keyword", keyword);
		 mav.setViewName("/question/general/shortAnswerContent");
		 
		 System.out.println("gq:"+gq);
		

		return mav;
	}
	
	
	
	
	@RequestMapping("/shortAnswerResult")
	public  ModelAndView shortAnswerResult(ModelAndView mav,int questionNo, String answer) throws SQLException{

	
	System.out.println("questionNo:"+questionNo);
	System.out.println("answer:"+answer);
	int result=questionService.checkAnswer(questionNo, answer);
		if(result ==1){
			mav.addObject("result", "맞았습니다");
		}else{
			 mav.addObject("result", "틀렸습니다. 다시풀어보세요");
			
		}
		mav.addObject("questionNo", questionNo);
		mav.addObject("shortAnswer", "shortAnswer");
		 mav.setViewName("/question/general/generalResult");
		 
		
		 

		return mav;
	}*/
	
	
	

}
