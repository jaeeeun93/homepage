package org.zerock.service;

import java.util.List;

import org.zerock.domain.UserVO;


public interface UserService {
	
	public UserVO read(String id) throws Exception;
	
	//팔로우 : 팔로워 증가
	public void updateFollowerNum(UserVO vo) throws Exception;
	
	//팔로우 : 팔로잉 증가
	public void updateFollowingNum(UserVO vo) throws Exception;
	
	//언팔로우 : 팔로워 감소
	public void minusFollowerNum(UserVO vs) throws Exception;
	
	//언팔로우 : 팔로잉 감소
	public void minusFollowingNum(UserVO vs) throws Exception;
	
	public void modify(UserVO vo) throws Exception;
	
	//프로필 사진 가져오기
	public String getProfile(String id) throws Exception;
	
	// 다른사람 프로필 사진 가져오기
	public String getProfileOther(String id) throws Exception;

	// 회원정보 가져오기
	public UserVO userInfo(String id) throws Exception;
	
	// 회원인지 비회원인지
	public Integer is_member(String id) throws Exception;
}
