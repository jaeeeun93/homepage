package org.zerock.service;



import java.util.List;



import javax.inject.Inject;



import org.springframework.stereotype.Service;

import org.zerock.domain.Criteria;

import org.zerock.domain.ReplyVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.ReplyDAO;



@Service

public class ReplyServiceImpl implements ReplyService {



	@Inject

	private ReplyDAO dao;

	

	@Override

	public void addReply(ReplyVO vo) throws Exception {

		dao.create(vo);

	}
	
	@Override

	public void addIp(String ip, String replyer, String replytext) throws Exception {

		dao.updateIp(ip, replyer, replytext);

	}



	@Override

	public List<ReplyVO> listReply(Integer bno) throws Exception {

		return dao.list(bno);

	}



	@Override

	public void modifyReply(ReplyVO vo) throws Exception {

		dao.update(vo);

	}



	@Override

	public void removeReply(Integer rno) throws Exception {

		dao.delete(rno);

	}



	@Override

	public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception {

		return dao.listPage(bno, cri);

	}



	@Override

	public int count(Integer bno) throws Exception {

		return dao.count(bno);

	}

	@Override
	
	public List<ReplyVO> read_reply(SearchCriteria cri) throws Exception{
		return dao.read_reply(cri);
	}
	
	@Override
	public int listReplyCount(SearchCriteria cri) throws Exception {
		return dao.listReplyCount(cri);
	}
}