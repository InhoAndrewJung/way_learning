package com.way.learning.aop.common;

import java.util.List;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import com.way.learning.aop.service.ActivityService;
import com.way.learning.model.member.vo.Member;

@Component
@Aspect
public class ActivityAspect { //POJO
	
	@Autowired
	private ActivityService activityService;
	
	/*@Around("execution(* com.way.learning.controller..*Controller.*(..))"
	+ " or execution(* com.way.learning.service..*Impl.*(..))"
	+ " or execution(* com.way.learning.model..dao.*Impl.*(..))")*/
	
	@Around("execution( * com.way.learning.service..Tech*ServiceImpl.is*Like(..))")
	public Object updatelikeActivity(ProceedingJoinPoint pjp) throws Throwable{
		Object result= pjp.proceed();
		
		
		System.out.println(pjp.getSignature().getName()+"() target method call....");
		
		
		
			Object[ ] params=pjp.getArgs();
			System.out.println(" activity aopparams[0].toString():"+params[0].toString());
			System.out.println(" activity aopparams[1].toString():"+params[1].toString());
			System.out.println(" activity aopparams[2].toString():"+params[2].toString());
			System.out.println("activity aop result:"+result);
			Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(result.toString().equals("1") ){
				activityService.updateLikeActivity(mvo.getUserId());
			}
			
	
		return result;
	}
	
	
	//com.way.learning.service.board.tech.TechReplyServiceImpl.insertReply
	@Around("execution( * com.way.learning.service..Tech*ServiceImpl.insertBoard(..))"
			+" or execution( * com.way.learning.service..Tech*ServiceImpl.insertReply(..))"
			
			)
	public Object updateInsertActivity(ProceedingJoinPoint pjp) throws Throwable{
		Object result= pjp.proceed();
		
		
		System.out.println(pjp.getSignature().getName()+"() target method call....");
		
		
		
			Object[ ] params=pjp.getArgs();
			
			System.out.println("activity aop result:"+result);
			Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(result.toString().equals("1") ){
				activityService.updateLikeActivity(mvo.getUserId());
			}
			
	
		return result;
	}
}


















