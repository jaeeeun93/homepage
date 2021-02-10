package org.zerock.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

@RestController

@RequestMapping("/replies")

public class ReplyController {

	@Inject

	private ReplyService service;

	 public static String getRemoteIP(HttpServletRequest request){
         String ip = request.getHeader("X-FORWARDED-FOR"); 
         
         //proxy 환경일 경우
         if (ip == null || ip.length() == 0) {
             ip = request.getHeader("Proxy-Client-IP");
         }
 
         //웹로직 서버일 경우
         if (ip == null || ip.length() == 0) {
             ip = request.getHeader("WL-Proxy-Client-IP");
         }
 
         if (ip == null || ip.length() == 0) {
             ip = request.getRemoteAddr() ;
         }
         
         return ip;
    }

	//리턴 타입 ResponseEntity<String> entity 설계

	//새로운 댓글을 등록 실패시 BAD_REQUEST(400)를 결과로 전송된다.

	//데이터 전송 방식은 JSON 포맷을 이용할 것이므로 이를 처리하는 @RequestBody

	//글 등록

	@ResponseBody
	@RequestMapping(value = "", method = RequestMethod.POST)

	public ResponseEntity<String> register(@RequestBody ReplyVO vo, HttpServletRequest request) {
		
		String ip = getRemoteIP(request);
		String replyer = vo.getReplyer();
		String replytext = vo.getReplytext();

		ResponseEntity<String> entity = null;

		System.out.println(getRemoteIP(request));
	    
	    try {

	    	service.addReply(vo);
	    	service.addIp(ip, replyer, replytext );
	    	
	    	entity = new ResponseEntity<String>("success", HttpStatus.OK);

	    } catch (Exception e) {

	    	e.printStackTrace();

	    	entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); //400에러

	    }

	    return entity;

	}

	

	//@RequestMapping()을 보면 URI 내의 경로에 {bno}를 활용한다.

	//{bno}는 메소드의 파라미터에서 @PathVariable("bno")로 활용된다.

	//메소드의 처리가 성공하는 경우 - HttpStatus.OK 헤더를 전송하고, 데이터를 같이 전송처리한다.

	//글 목록

	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)

	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno) {

		// @PathVariable - URI 경로에서 원하는 데이터를 추출하는 용도로 사용



		ResponseEntity<List<ReplyVO>> entity = null;

		

		try {

			entity = new ResponseEntity<>(service.listReply(bno), HttpStatus.OK);

		} catch (Exception e) {

			e.printStackTrace();

			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}



		return entity;

	}

	

	//글 수정

	@RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })

	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) {

	

		ResponseEntity<String> entity = null;

		

		try {

			vo.setRno(rno);

			service.modifyReply(vo);



			entity = new ResponseEntity<String>("success", HttpStatus.OK);

		} catch (Exception e) {

			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);

		}

		return entity;

	}

	

	//글 삭제

	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)

	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {



		ResponseEntity<String> entity = null;

		

		try {

			service.removeReply(rno);

			entity = new ResponseEntity<String>("success", HttpStatus.OK);

		} catch (Exception e) {

			e.printStackTrace();

			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);

		}

		return entity;

	}

	

	// - /replies/게시물 번호/페이지 번호

	//페이징 처리를 위해서는 PageMaker를 가져와야 한다.

	//Ajax로 호출될 것이므로 Model 아닌 Map 타입의 객체를 생성 이용한다.

	//페이징 처리

	@RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)

	public ResponseEntity<Map<String, Object>> listPage(

		@PathVariable("bno") Integer bno,

		@PathVariable("page") Integer page) {



		ResponseEntity<Map<String, Object>> entity = null;

	    

		try {

			Criteria cri = new Criteria();

			cri.setPage(page);



			PageMaker pageMaker = new PageMaker();

			pageMaker.setCri(cri);



			Map<String, Object> map = new HashMap<String, Object>();

			List<ReplyVO> list = service.listReplyPage(bno, cri);



			map.put("list", list);



			int replyCount = service.count(bno);

			pageMaker.setTotalCount(replyCount);



			map.put("pageMaker", pageMaker);



			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);



		} catch (Exception e) {

			e.printStackTrace();

			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);

		}

		return entity;

	}



}