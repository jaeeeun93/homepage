package org.zerock.service;

import java.util.List;

import org.zerock.domain.LikeVO;
import org.zerock.domain.SearchCriteria;

public interface LikeService {

		public void addLike(LikeVO vo) throws Exception;
		public void addLikeCnt(LikeVO vo) throws Exception;
		public void addLikeCheck(LikeVO vo) throws Exception;
		public void addHateCnt(LikeVO vo) throws Exception;
		public void addHateCheck(LikeVO vo) throws Exception;
		public Integer like_check(LikeVO vo) throws Exception;
		public Integer hate_check(LikeVO vo) throws Exception;
		public Integer duple_check(LikeVO vo) throws Exception;
		
		public List<LikeVO> read_like(SearchCriteria cri) throws Exception;
		
}
