package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class CommonExceptionAdvice {

	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	@ExceptionHandler(Exception.class)
	public String common(Exception e) { //common() 메소드를 이용해서 Exception 타입으로 처리되는 모든 예외를 처리하도록 설정된다.

		logger.info("common()......에러처리 부분...");
		logger.info(e.toString());
		return "/error_common";
	}
}
