package com.way.learning.controller.question;

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

@Controller
@RequestMapping("/question/general/*")
public class GeneralQuestionController {

	@Autowired
	private QuestionService questionService;

	@RequestMapping("/makeQuestion")
	public String makeQuestion() {
		return "/question/general/makeQuestion";
	}

	@RequestMapping("/insertQuestion")
	public String insertQuestion(@ModelAttribute GeneralQuestion gq, String[] answerChoice) throws SQLException {
		System.out.println("gq:" + gq);

		for (String s : answerChoice) {
			System.out.println(s);
		}

		System.out.println("answerChoice:" + answerChoice);

		questionService.insertGeneralQuestion(gq, answerChoice);

		return "redirect:/question/general/getList";
	}

	@RequestMapping("/getList")
	public ModelAndView getList(HttpServletRequest request, ModelAndView mav, HttpServletResponse response,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "") String sorting)
			throws SQLException {
		System.out.println("keyword:" + keyword);
		System.out.println("sorting:" + sorting);


		List<GeneralQuestion> list = questionService.getGeneralList(keyword, sorting);
		System.out.println("qna  컨트롤러 에서 list:" + list);

		mav.addObject("list", list);
		mav.addObject("keyword", keyword);
		mav.setViewName("/question/general/list");

		return mav;
	}




	@RequestMapping("/multipleChoiceContent")
	public ModelAndView multipleChoiceContent(ModelAndView mav, int questionNo, String keyword) throws SQLException {

		GeneralQuestion gq = questionService.showGeneralContent(questionNo);
		List<GeneralChoice> aList = questionService.getAnswerChoice(questionNo);
		mav.addObject("gq", gq);
		mav.addObject("aList", aList);
		mav.addObject("keyword", keyword);
		mav.setViewName("/question/general/multipleChoiceContent");

		System.out.println("gq:" + gq);
		System.out.println("aList:" + aList);

		return mav;
	}

	@RequestMapping("/multipleChoiceResult")
	public ModelAndView multipleChoiceResult(ModelAndView mav, int questionNo, String answer) throws SQLException {

		System.out.println("questionNo:" + questionNo);
		System.out.println("answer:" + answer);
		int result = questionService.checkAnswer(questionNo, answer);
		boolean resultBoolean=false;
		if(result!=0) resultBoolean=true;
		mav.addObject("result", resultBoolean);

		mav.addObject("questionNo", questionNo);
		mav.addObject("multipleChoice", "multipleChoice");
		mav.setViewName("/question/general/generalResult");

		return mav;
	}

	@RequestMapping("/shortAnswerContent")
	public ModelAndView shortAnswerContent(ModelAndView mav, int questionNo, String keyword) throws SQLException {

		GeneralQuestion gq = questionService.showGeneralContent(questionNo);

		mav.addObject("gq", gq);
		mav.addObject("keyword", keyword);
		mav.setViewName("/question/general/shortAnswerContent");

		System.out.println("gq:" + gq);

		return mav;
	}

	@RequestMapping("/shortAnswerResult")
	public ModelAndView shortAnswerResult(ModelAndView mav, int questionNo, String answer) throws SQLException {

		System.out.println("questionNo:" + questionNo);
		System.out.println("answer:" + answer);
		int result = questionService.checkAnswer(questionNo, answer);
		if (result == 1) {
			mav.addObject("result", true);
		} else {
			mav.addObject("result", false);

		}
		mav.addObject("questionNo", questionNo);
		mav.addObject("shortAnswer", "shortAnswer");
		mav.setViewName("/question/general/generalResult");

		return mav;
	}

	// 수정, 삭제 추가

	@RequestMapping("/deleteQuestion")
	public ModelAndView deleteQuestion(ModelAndView mav, int questionNo) throws Exception {
		System.out.println("questionNo:" + questionNo);
		int result = questionService.deleteQuestion(questionNo);

		mav.setViewName("redirect:/question/general/getList");

		return mav;
	}

	@RequestMapping("/updateQuestion")
	public ModelAndView updateQuestion(int questionNo, ModelAndView mav) throws Exception {

		GeneralQuestion gq = questionService.showGeneralContent(questionNo);
		mav.addObject("gq", gq);

		if (gq.getCategory().equals("multipleChoice")) {
			List<GeneralChoice> aList = questionService.getAnswerChoice(questionNo);
			mav.addObject("aList", aList);
			System.out.println("aList:" + aList);
		}
		mav.setViewName("/question/general/updateQuestion");

		System.out.println("gq:" + gq);

		return mav;

	}

	@RequestMapping("updateQuestionAction")
	public ModelAndView updateQuestionAction(@ModelAttribute GeneralQuestion gq, String[] answerChoice,
			ModelAndView mav) throws Exception {
		if (gq.getCategory().equals("multipleChoice")) {
			for (String s : answerChoice) {
				System.out.println(s);
			}
		}
		System.out.println("answerChoice:" + answerChoice);

		questionService.updateQuestion(gq, answerChoice);

		mav.addObject("gq", questionService.showGeneralContent(gq.getQuestionNo()));
		mav.setViewName("redirect:/question/general/getList");

		return mav;
	}

}
