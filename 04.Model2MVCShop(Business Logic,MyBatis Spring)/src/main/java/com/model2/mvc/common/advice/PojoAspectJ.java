package com.model2.mvc.common.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class PojoAspectJ{
	public PojoAspectJ(){
	
	}
	
	public void before(JoinPoint joinPoint){
		System.out.println("before log]"+getClass()+".before() start");
		System.out.println("before log]"+joinPoint.getTarget().getClass().getName());
		System.out.println("before log]"+joinPoint.getSignature().getName());
		if(joinPoint.getArgs().length != 0){
			System.out.println("before log] targetObject method Àü´Þ argument: "+joinPoint.getArgs()[0]);
		}
		System.out.println("before log]"+getClass()+".before() end");
	}
	
	public void afterReturning(JoinPoint joinPoint, Object returnValue){
		System.out.println("after log]"+getClass()+".afterReturning() start");
		System.out.println("after log]"+joinPoint.getTarget().getClass().getName());
		System.out.println("after log]"+joinPoint.getSignature().getName());
		System.out.println("after log] targetObject call method"+joinPoint.getArgs()[0]);
		System.out.println("after log] Å¸°Ù °´Ã¼ÀÇ Èå¸§ÈÄ retrun value"+returnValue);
		System.out.println("after log]"+getClass()+".afterReturning() end");	
	}
	
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable{
		System.out.println("around after]"+getClass()+".invoke() start");
		System.out.println("around after]"+joinPoint.getTarget().getClass().getName());
		System.out.println("around after]"+joinPoint.getSignature().getName());
		System.out.println("around after] targetObject call method"+joinPoint.getSignature().getName());
		if(joinPoint.getArgs().length!=0){
			System.out.println("before log] targetObject method Àü´Þ argument. "+joinPoint.getArgs()[0]);
		}
		
		Object obj = joinPoint.proceed();
		
		System.out.println("around after]Å¸°Ù °´Ã¼ È£ÃâÈÄ return value: "+obj);
		System.out.println("around after]"+getClass()+"invoke() end");
		
		return obj;
	}
	
	public void afterThrowing(JoinPoint joinPoint, Throwable throwable){
		System.out.println("exception]"+getClass()+".afterThrowing() start");
		System.out.println("exception]"+joinPoint.getTarget().getClass().getName());
		System.out.println("exception]"+joinPoint.getSignature().getName());		
		System.out.println("exception] exception");
		System.out.println("exception] exception message:"+throwable.getMessage());
		System.out.println("exception]"+getClass()+".afterThrowing() end");	
	}
}
