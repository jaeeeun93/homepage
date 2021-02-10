package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.DmVO;
import org.zerock.persistence.DmDAO;

@Service
public class DmService {
	
	@Inject
	private DmDAO dao;
	
	public void addDm(String from_id, String to_id) throws Exception {
		
		dao.addDm(from_id, to_id);
	}
	
	//DM 눌렀을 때 팔로잉 목록 출력
	public List<DmVO> following_list(String send_id) throws Exception {
		return dao.following_list(send_id);
	}
	
	
	//DM 대화 내용 출력, 시간 등
	public List<DmVO> context_all(String from_id, String to_id) throws Exception {
		return dao.context_all(from_id, to_id);
	}

	public Integer following_list_count(String from_id, String to_id) throws Exception {
		return dao.following_list_count(from_id, to_id);
	}
	
	//DM 보내기
	public void send(String from_id, String to_id, String context) throws Exception {
		
		dao.send(from_id, to_id, context);
	}
}
