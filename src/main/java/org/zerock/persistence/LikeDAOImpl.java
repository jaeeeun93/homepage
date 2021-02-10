package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.LikeVO;
import org.zerock.domain.SearchCriteria;

@Repository

public class LikeDAOImpl implements LikeDAO {
	@Inject

	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.LikeMapper";

	@Override
	public void create(LikeVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}

	@Override
	public Integer like_check(LikeVO vo) throws Exception {
		return session.selectOne(namespace+".like_check", vo);
		
	}
	
	@Override
	public Integer hate_check(LikeVO vo) throws Exception {
		return session.selectOne(namespace+".hate_check", vo);
		
	}
	
	@Override
	public Integer duple_check(LikeVO vo) throws Exception {
		return session.selectOne(namespace+".duple_check", vo);		
	}

	@Override
	public void addLikeCheck(LikeVO vo) throws Exception {
		session.update(namespace+".addLikeCheck", vo);
	}
	
	@Override
	public void addHateCheck(LikeVO vo) throws Exception {
		session.update(namespace+".addHateCheck", vo);
	}
	
	@Override
	public List<LikeVO> read_like(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".read_like", cri);
	}
	
}
