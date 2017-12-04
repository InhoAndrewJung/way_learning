package com.way.learning.controller.question;

import java.io.IOException;
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
	
	@RequestMapping("/showEssayContent")
	public  ModelAndView showEssayContent(ModelAndView mav,int questionNo, String keyword) throws SQLException{

		AlgorithmQuestion aq=questionService.showEssayContent(questionNo);
	
		 mav.addObject("aq", aq);
		 mav.addObject("keyword", keyword);
		 mav.setViewName("/question/essay/essayContent");
		 
		

		return mav;
	}
	
	@RequestMapping("/essayResult")
	public  ModelAndView shortAnswerResult(ModelAndView mav,int questionNo, String code) throws IOException, InterruptedException, Exception{
		 
		
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
		return new ModelAndView("/question/essay/result","code", set);	
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
