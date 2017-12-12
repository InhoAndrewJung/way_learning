package com.way.learning.aop.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.aop.service.answer.AnswerService;
import com.way.learning.model.member.vo.Member;
import com.way.learning.util.Data;

@Component
@Aspect
public class AnswerAspect {

	@Autowired
	private AnswerService answerService;
	
	
	
	@Around("execution( * com.way.learning.service..*ServiceImpl.checkAnswer(..))")
	public Object updateAnswerResult(ProceedingJoinPoint pjp) throws Throwable{
		System.out.println(pjp.getSignature().getName()+"() target method call....");
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Object[ ] params=pjp.getArgs();
		int questionNo=Integer.parseInt(params[0].toString());
		String userId=mvo.getUserId();
		
		answerService.updatePostCntSubmit(questionNo);
		answerService.updateMyCntSubmit(questionNo,userId );
		Object result= pjp.proceed();
		System.out.println("updateAnswerResult aop result:"+result);

			if(result.toString().equals("1") ){
				answerService.updatePostCntRight(questionNo);
				answerService.updateMyCntRight(questionNo,userId );
				
			}else{
				answerService.updateMyCntWrong(questionNo, userId );
				
			}
			
	
		return result;
	}
	
	
//com.way.learning.controller.question public  ModelAndView essayResult(ModelAndView mav,int questionNo, String code)
	@Around("execution( * com.way.learning..essayResult(..))")
	public Object updateEssayAnswerResult(ProceedingJoinPoint pjp) throws Throwable{
		System.out.println(pjp.getSignature().getName()+"() target method call....");
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Object[ ] params=pjp.getArgs();
		int questionNo=Integer.parseInt(params[0].toString());
		System.out.println("에세이 questionNo:"+questionNo);
		String userId=mvo.getUserId();
		
		answerService.updatePostCntSubmit(questionNo);
		answerService.updateMyCntSubmit(questionNo,userId );
		Object result= pjp.proceed();
		
		ModelAndView mav=(ModelAndView)result;
		Data set=(Data)mav.getModel().get("code");
		
		System.out.println("set.getAnswerResult():"+set.getAnswerResult());
		if(set.getAnswerResult().equals("correct")){
			answerService.updatePostCntRight(questionNo);
			answerService.updateMyCntRight(questionNo,userId );
		}else if(     set.getAnswerResult().equals("wrong") && !(set.getError().equals("Exception"))       ){
			answerService.updateMyCntWrong(questionNo, userId );
		}else if(set.getError().equals("Exception")){
			answerService.updateMyCntError(questionNo, userId );
		}
		return result;
	}

}







