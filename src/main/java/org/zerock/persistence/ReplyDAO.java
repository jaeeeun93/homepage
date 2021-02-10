package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;

public interface ReplyDAO {
	public List<ReplyVO> list(Integer bno) throws Exception;

	public void create(ReplyVO vo) throws Exception;

	public void update(ReplyVO vo) throws Exception;
	public void updateIp(String ip, String replyer, String replytext) throws Exception;

	public void delete(Integer rno) throws Exception;

	public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;

	public int count(Integer bno) throws Exception;
	
	public List<ReplyVO> read_reply(SearchCriteria cri) throws Exception;
	public int listReplyCount(SearchCriteria cri) throws Exception;
}
