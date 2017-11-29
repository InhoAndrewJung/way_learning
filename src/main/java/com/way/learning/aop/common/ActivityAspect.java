package com.way.learning.aop.common;

import java.util.List;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.way.learning.aop.service.ActivityService;

@Component
@Aspect
public class ActivityAspect { //POJO
	
	@Autowired
	private ActivityService activityService;
	
	/*@Around("execution(* com.way.learning.controller..*Controller.*(..))"
	+ " or execution(* com.way.learning.service..*Impl.*(..))"
	+ " or execution(* com.way.learning.model..dao.*Impl.*(..))")*/
	
	@Around("execution( * com.way.learning.service..Tech*ServiceImpl.is*Like(..))")
	public Object report(ProceedingJoinPoint pjp) throws Throwable{
		Object list= pjp.proceed();
		
		
		System.out.println(pjp.getSignature().getName()+"() target method call....");
		
		
		
			Object[ ] params=pjp.getArgs();
			System.out.println("params[0].toString():"+params[0].toString());
			System.out.println("params[1].toString():"+params[1].toString());
			System.out.println("params[2].toString():"+params[2].toString());
			//activityService.saveReport(params[0].toString(),params[1].toString(),params[2].toString());
	
		return list;
	}
}


















