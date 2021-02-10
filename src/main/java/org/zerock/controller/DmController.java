package org.zerock.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.DmVO;
import org.zerock.service.DmService;

@RestController

@RequestMapping("/dm")

public class DmController {
	
	@Inject 
	private DmService service;
	
	// dm 보내기
	@ResponseBody
	@RequestMapping(value = "/_send", method = RequestMethod.POST)
	public ResponseEntity<String> dm_send(@RequestBody DmVO vo, HttpServletRequest request){
		
		String from_id = vo.getFrom_id();
		String to_id = vo.getTo_id();
		String context = vo.getContext();
		
		ResponseEntity<String> entity = null;
		
		try {
			System.out.println("보내는사람"+from_id);
			System.out.println("받는사람"+to_id);
			System.out.println("내용"+context);
			
			service.send(from_id, to_id, context);
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); // 400에러
		}
		return entity;
	}
}
