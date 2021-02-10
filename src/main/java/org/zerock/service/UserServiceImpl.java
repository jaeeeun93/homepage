package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.UserVO;
import org.zerock.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	
	@Override
	public UserVO read(String id) throws Exception {
		return dao.read(id);
	}
	
	//팔로우 : 팔로워 증가
	@Override
	public void updateFollowerNum(UserVO vo)throws Exception {
		dao.updateFollowerNum(vo);
	}
	
	//팔로우 : 팔로잉 증가
	@Override
	public void updateFollowingNum(UserVO vo)throws Exception {
		dao.updateFollowingNum(vo);
	}
	
	//언팔로우 : 팔로워 감소
	@Override
	public void minusFollowerNum(UserVO vo)throws Exception {
		dao.minusFollowerNum(vo);
	}
	
	//언팔로우 : 팔로잉 감소
	@Override
	public void minusFollowingNum(UserVO vo)throws Exception {
		dao.minusFollowingNum(vo);
	}

	//회원 수정
	@Override
	public void modify(UserVO vo) throws Exception {
		dao.modify(vo);
	}
	
	//프로필 사진 가져오기
	@Override
	public String getProfile(String id) throws Exception {
		return dao.getProfile(id);
	}
	
	//다른 사람 프로필 사진 가져오기
	@Override
	public String getProfileOther(String id) throws Exception {
		return dao.getProfileOther(id);
	}
	
	//회원 정보 가져오기
	@Override
	public UserVO userInfo(String id) throws Exception {
		return dao.userInfo(id);
	}
	
	// 회원인지 비회원인지
	@Override
	public Integer is_member(String id) throws Exception {
		return dao.is_member(id);
	}
}
