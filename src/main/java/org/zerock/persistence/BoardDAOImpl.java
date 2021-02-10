package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.LikeVO;
import org.zerock.domain.SearchCriteria;

@Repository
//root context와 persistence와 연동하기 위해서
public class BoardDAOImpl implements BoardDAO{
	
	private static final String namespace = "org.zerock.mapper.BoardMapper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace+".create",vo); //vo객체를 넘겨야 겟방식 처리 가능
	}
	

	@Override
	public BoardVO read(Integer bno) throws Exception {
		return session.selectOne(namespace+".read",bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		session.update(namespace+".update",vo);		
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace+".delete",bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return session.selectList(namespace+".listAll");
	}
	
	
	  @Override public List<BoardVO> listPage(int page) throws Exception { 
		  if(page == 0) {
		  //0일 경우 페이지가 1 
		  page = 1; 
	  } //없어도 되는 if구문
	  page = (page - 1) * 10; 
	  return session.selectList(namespace+".listPage",page); 
	  }
	  	
	
	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}
	
	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}
	
	@Override
	public List<BoardVO> listBest(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listBest", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".listSearchCount", cri);
	}
	
	@Override

	public void updateViewCnt(Integer bno) throws Exception {

		session.update(namespace+".updateViewCnt", bno);

	}
	
	@Override
	public void addAttach(String fullName) throws Exception {
		session.insert(namespace+".addAttach",fullName);
	}
	
	@Override
	public void addLikeCnt(LikeVO vo) throws Exception {
		session.update(namespace+".addLikeCnt", vo);
	}
	
	@Override
	public void addHateCnt(LikeVO vo) throws Exception {
		session.update(namespace+".addHateCnt", vo);
	}
	
	@Override
	public Integer post_count(String id) throws Exception {
		return session.selectOne(namespace+".post_count" , id);
	}
}