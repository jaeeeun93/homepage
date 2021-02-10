package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.ReplyDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	
	@Inject
	private ReplyDAO dao2;
	
	@Transactional
	@Override
	public void regist(BoardVO vo) throws Exception {
		dao.create(vo);
		
		String[] files = vo.getFiles();

		if(files == null) { return; }

		for(String fileName : files) {
			dao.addAttach(fileName);
		}
	}
	
	@Override
	public BoardVO read(Integer bno) throws Exception {
		dao.updateViewCnt(bno);
		return dao.read(bno);
	}

	
	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.update(vo);	
	}

	@Override
	public void remove(Integer bno) throws Exception {
		dao.delete(bno);
		
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}
	
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}
	
	@Override

	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);

	}
	
	@Override

	public List<BoardVO> listBestCriteria(SearchCriteria cri) throws Exception {

		return dao.listBest(cri);

	}



	@Override

	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);

	}
	
	@Override
	public Integer post_count(String id) throws Exception {	// 게시글 수 리턴
		
		return dao.post_count(id);
	}
	
}
