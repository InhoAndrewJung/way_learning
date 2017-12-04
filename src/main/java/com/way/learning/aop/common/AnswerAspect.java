package com.way.learning.aop.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.way.learning.aop.service.answer.AnswerService;
import com.way.learning.model.member.vo.Member;

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
	
	
	
	
	
	
}







