package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
@Repository
public class UserDAO {
	
	private static final String namespace = "org.zerock.mapper.UserMapper";
	
	@Inject
	private SqlSession session;
	
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".login", dto);
	}
	
	public void join(UserVO vo) throws Exception {
		session.insert(namespace+".join",vo);
	}
	
	public int idChk(String userid) throws Exception {
		int result = session.selectOne(namespace+".idChk", userid);
		return result;
	}
	
	public String idFind(UserVO vo) throws Exception {
		String findId = session.selectOne(namespace+".idFind", vo);
		return findId;
	}
	
	public String passFind(UserVO vo) throws Exception {
		String findPass = session.selectOne(namespace+".passFind", vo);
		return findPass;
	}
	
	public UserVO read(String id) throws Exception {
		return session.selectOne(namespace+".read", id);
	}
	
	//팔로우 : 팔로워 증가
	public void updateFollowerNum(UserVO vo) throws Exception {
		session.update(namespace+".updateFollowerNum", vo);
	}
	
	//팔로우 : 팔로잉 증가
	public void updateFollowingNum(UserVO vo) throws Exception{
		session.update(namespace+".updateFollowingNum", vo);
	}
	
	//언팔로우 : 팔로워 감소
	public void minusFollowerNum(UserVO vo) throws Exception {
		session.update(namespace+".minusFollowerNum", vo);
	}
	
	//언팔로우 : 팔로잉 감소
	public void minusFollowingNum(UserVO vo) throws Exception{
		session.update(namespace+".minusFollowingNum", vo);
	}
	
	//회원 수정
	public void modify(UserVO vo) throws Exception {
		session.update(namespace+".modify", vo);
	}
	
	//프로필 사진 가져오기
	public String getProfile(String id) throws Exception {
		return session.selectOne(namespace+".getProfile", id);
	}
	
	//다른 사람 프로필 사진 가져오기
	public String getProfileOther(String id) throws Exception {
		return session.selectOne(namespace+".getProfileOther", id);
	}
	
	//회원 정보 가져오기
	public UserVO userInfo(String id) throws Exception {
		return session.selectOne(namespace+".userInfo", id);
	}
	
	// 회원인지 비회원인지
	public Integer is_member(String id) throws Exception {
		return session.selectOne(namespace+".is_member", id);
	}
}
