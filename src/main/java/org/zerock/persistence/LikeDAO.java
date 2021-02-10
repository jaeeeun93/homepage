package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.LikeVO;
import org.zerock.domain.SearchCriteria;

public interface LikeDAO {
	public void create(LikeVO vo) throws Exception;
	public void addLikeCheck(LikeVO vo) throws Exception;
	public void addHateCheck(LikeVO vo) throws Exception;
	public Integer like_check(LikeVO vo) throws Exception;
	public Integer hate_check(LikeVO vo) throws Exception;
	public Integer duple_check(LikeVO vo) throws Exception;
	public List<LikeVO> read_like(SearchCriteria cri) throws Exception;
	
}
