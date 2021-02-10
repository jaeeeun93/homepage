package org.zerock.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.LikeVO;
import org.zerock.service.LikeService;

@RestController

@RequestMapping("/like")

public class LikeController {
	
	private static final Logger logger = LoggerFactory.getLogger(LikeController.class);
	
	@Inject
	private LikeService service;
	
	//좋아요 생성
		@RequestMapping(value = "", method = RequestMethod.POST)

		public ResponseEntity<String> register(@RequestBody LikeVO vo) {

		    ResponseEntity<String> entity = null;

		    try {
		    	int chk = 0;
		    	chk =service.duple_check(vo);
		    	
		    	if (chk == 0) {
		    		service.addLike(vo);
			    	entity = new ResponseEntity<String>("success", HttpStatus.OK);
				}
		    } catch (Exception e) {
		    	e.printStackTrace();
		    	entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); //400에러
		    }
		    return entity;
		}
	
	//좋아요 수 업데이트
		@ResponseBody
		@RequestMapping(value = "/cnt", method = RequestMethod.POST)

		public ResponseEntity<String> register2(@RequestBody LikeVO vo, HttpSession session) {

		    ResponseEntity<String> entity = null;
		    String resultMsg="";

		    try {
		    	int result = service.like_check(vo);
		    	logger.info("dddd" + session.getAttribute("id") );
		    	
		    	if (session.getAttribute("id") == null) {
		    		entity = new ResponseEntity<String>("login", HttpStatus.OK);
		    	}else if (result == 0) {
		    		service.addLikeCnt(vo);
		    		service.addLikeCheck(vo);
			    	entity = new ResponseEntity<String>("success", HttpStatus.OK);
				} else {
					entity = new ResponseEntity<String>("duple", HttpStatus.OK);
				}
		    	
		    } catch (Exception e) {
		    	
		    	e.printStackTrace();
		    	entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); //400에러
		    }
		    return entity;
		}
		
	
	//싫어요 수 업데이트
		@ResponseBody
		@RequestMapping(value = "/hate", method = RequestMethod.POST)

		public ResponseEntity<String> register3(@RequestBody LikeVO vo, HttpSession session) {

		    ResponseEntity<String> entity = null;
		    String resultMsg="";

		    try {
		    	int result = service.hate_check(vo);
		    	
		    	if (session.getAttribute("id") == null) {
		    		entity = new ResponseEntity<String>("login", HttpStatus.OK);
		    	}else if (result == 0) {
		    		service.addHateCnt(vo);
		    		service.addHateCheck(vo);
			    	entity = new ResponseEntity<String>("success", HttpStatus.OK);
				} else {
					entity = new ResponseEntity<String>("duple", HttpStatus.OK);
				}
		    	
		    } catch (Exception e) {
		    	
		    	e.printStackTrace();
		    	entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); //400에러
		    }
		    return entity;
		}

		
}
