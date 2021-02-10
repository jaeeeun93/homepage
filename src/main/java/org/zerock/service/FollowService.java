package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.FollowVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.persistence.FollowDAO;

@Service
public class FollowService {

	@Inject
	private FollowDAO dao;
	
	
	// 팔로우 : 팔로워 추가
	public void add_follow(UserVO vo) throws Exception {
		dao.add_follow(vo);
	}
	
	// 언팔로우 : 팔로워 삭제
	public void minus_follow(UserVO vo) throws Exception {
		dao.minus_follow(vo);
	}
	
	
	
	public Integer follow_check(UserVO vo) throws Exception {
		return dao.follow_check(vo);
	}
	
	
	public Integer following_check(String id, String id2) throws Exception {
	
		return dao.following_check(id, id2);
	}
	
	
	//팔로워 목록 출력
	public List<FollowVO> follower_list(String id) throws Exception {
		
		return dao.follower_list(id); 
	}
	
	//팔로잉 목록 출력
	
	public List<FollowVO> following_list(String id) throws Exception {
		
		return dao.following_list(id); 
	}
}
