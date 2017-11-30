package com.way.learning.aop.common;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

// @Controller @service @repository..

@Component //스프링에서 관리하는 bean
@Aspect //aop bean
//컨트롤러,서비스,다오 의 모든 method 실행 전후에 logPrint()메소드가 실행됨!!!
public class LogAdvice {
	
	/*private static final Logger logger =LoggerFactory.getLogger(LogAdvice.class);
	
	@Around("execution(* com.way.learning.controller..*Controller.*(..))"
	+ " or execution(* com.way.learning.service..*Impl.*(..))"
	+ " or execution(* com.way.learning.model..dao.*Impl.*(..))")
	
	public Object logPrint(ProceedingJoinPoint jointPoint)throws Throwable{
		long start =System.currentTimeMillis(); //before 
		Object result= jointPoint.proceed(); //핵심로직 수행
		//class name
		String type=jointPoint.getSignature().getDeclaringTypeName();	
		String name="";
		if(type.indexOf("controller") >-1) {
			name="Controller \t:";
		}else if(type.indexOf("service") >-1) {
			name="ServiceImpl \t:";
		}else if(type.indexOf("DAO") >-1) {
			name="DAOImpl \t:";
		}
		
		//Sytem.out.println("type:"+type);
		//method name
		logger.info(name+type+"."+jointPoint.getSignature().getName()+"()");
		//매개변수
		logger.info(
				Arrays.toString(jointPoint.getArgs()));
		
		//핵심 로직으로 이동!!
		long end =System.currentTimeMillis();
		long time = end-start;
		logger.info("실행시간:"+time);
		return result;

	}*/

}
