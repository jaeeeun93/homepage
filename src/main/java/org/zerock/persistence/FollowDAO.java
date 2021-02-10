package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.FollowVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;

@Repository
public class FollowDAO {

	private static final String namespace = "org.zerock.mapper.FollowMapper";

	@Inject
	private SqlSession session;
	
	// 팔로워 추가
	public void add_follow(UserVO vo) throws Exception {
		session.insert(namespace + ".add_follow", vo);
	}
	
	// 팔로워 삭제
	public void minus_follow(UserVO vo) throws Exception {
		session.insert(namespace + ".minus_follow", vo);
	}
	
	public Integer follow_check(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".follow_check", vo);
	}
	
	
	public Integer following_check(String id, String id2) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("id", id);
		paramMap.put("id2", id2);
		
		return session.selectOne(namespace + ".following_check", paramMap );
	}
	
	// 팔로워 목록
	public List<FollowVO> follower_list(String id) throws Exception {
		
		return session.selectList(namespace+".follower_list", id);
	}
	
	// 팔로잉 목록
	public List<FollowVO> following_list(String id) throws Exception {
		
		return session.selectList(namespace+".following_list", id);
	}
	 
}
