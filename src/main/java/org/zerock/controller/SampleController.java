package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleVO;

@RestController
@RequestMapping("/sample")
public class SampleController {

	//1 문자열 반환
	@RequestMapping(value = "/hello", produces="text/plain;charset=UTF-8") 
	public String abc() {
		return "죽음의 월요일..."; //hello.jsp가 아닌 브라우저로 값을 던져줌
	}
	
	//2 객체 처리
	@RequestMapping("/send")
	public SampleVO aaa() {
		SampleVO vo = new SampleVO();
		
		vo.setMno(1);
		vo.setFirstName("길동");
		vo.setLastName("홍");
		
		return vo;
	}
	
	//3 List 객체 처리
	@RequestMapping("/sendlist")
	public List<SampleVO> bbb() {
		List<SampleVO> list = new ArrayList<SampleVO>();
		
		for(int i=0; i<=10; i++) {
			SampleVO vo = new SampleVO();
			vo.setMno(1);
			vo.setFirstName("길동");
			vo.setLastName("홍");
				
			list.add(vo);
		}
		return list;
	}
		
	// 4. 컬렉션 타입의 객체를 반환하는 경우 (Map)
	@RequestMapping("/sendmap")
	public Map<Integer, SampleVO> sendMap(){
		//맵에서는 객체와 객체를 담아야한다.
		Map<Integer, SampleVO> map = new HashMap<Integer, SampleVO>();
		for(int i=0; i<=10; i++ ) {
			SampleVO vo = new SampleVO();

			vo.setFirstName("");
			vo.setLastName("");
			vo.setMno(i);
			
			map.put(i,vo);
		}			
		return map;
	}
	
	// 5. ResponseEntity 타입
	// @RestController는 별도의 view를 제공하지 않는 형태로 서비스를 실행하기 때문에, 때로는 결과 데이터가 예외적인 상황에서 문제가 발생할 수 있다.
	// 실행시 HTTP ERROR 400 에러가 난다.
	@RequestMapping("/senderror")
	public ResponseEntity<Void> sendListAuth(){
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST); // 400 에러
	}
	
	// 3.5 조인
	// 스프링에서 제공하는 ResponseEntity 타입은 개발자가 직접 결과 데이터 + HTTP의 상태 코드를 직접 제어할 수 있는 클래스이다.
	// 상태코드와 데이터를 함께 전송할 수 있기 때문에 좀 더 세밀한 제어가 필요한 경우에 사용한다.
	@RequestMapping("/sendnot")
	public ResponseEntity<List<SampleVO>> sendListNot(){
		List<SampleVO> list = new ArrayList<SampleVO>();
			
		for(int i=0; i<=10; i++ ) {
			SampleVO vo = new SampleVO();
				
			vo.setFirstName("");
			vo.setLastName("");
			vo.setMno(i);
			
			list.add(vo);
		}
		return new ResponseEntity<List<SampleVO>>(list, HttpStatus.NOT_FOUND); // 404 에러
	}
}
