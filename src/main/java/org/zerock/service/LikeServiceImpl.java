package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.LikeVO;
import org.zerock.domain.ReplyVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.LikeDAO;

@Service

public class LikeServiceImpl implements LikeService {

	@Inject
	private LikeDAO dao;
	
	@Inject
	private BoardDAO dao2;
	
	@Override
	public void addLike(LikeVO vo) throws Exception {

		 dao.create(vo);
	}
	
	@Override
	public void addLikeCheck(LikeVO vo) throws Exception {

		 dao.addLikeCheck(vo);
	}
	
	@Override
	public void addLikeCnt(LikeVO vo) throws Exception {
		
		dao2.addLikeCnt(vo);
	}
	
	@Override
	public void addHateCheck(LikeVO vo) throws Exception {

		 dao.addHateCheck(vo);
	}
	
	@Override
	public void addHateCnt(LikeVO vo) throws Exception {
		
		dao2.addHateCnt(vo);
	}
	
	@Override
	public Integer like_check(LikeVO vo) throws Exception {
		return dao.like_check(vo);
	}
	
	@Override
	public Integer hate_check(LikeVO vo) throws Exception {
		return dao.hate_check(vo);
	}
	
	@Override
	public Integer duple_check(LikeVO vo) throws Exception {
		return dao.duple_check(vo);
	}
	
	@Override
	public List<LikeVO> read_like(SearchCriteria cri) throws Exception{
		return dao.read_like(cri);
	}
	
}
