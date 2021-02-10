package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;


	public interface BoardService {
	public void regist(BoardVO vo)throws Exception;
	public BoardVO read(Integer bno)throws Exception;
	public void modify(BoardVO vo)throws Exception;
	public void remove(Integer bno)throws Exception;
	public List<BoardVO> listAll()throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public List<BoardVO> listBestCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public Integer post_count(String id) throws Exception;
	
}