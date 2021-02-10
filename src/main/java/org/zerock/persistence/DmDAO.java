package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.DmVO;

@Repository
public class DmDAO {
	
	private static final String namespace = "org.zerock.mapper.DmMapper";
	
	@Inject
	private SqlSession session;
	
	// dm생성
	public void addDm(String from_id, String to_id) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("from_id", from_id);
		paramMap.put("to_id", to_id);
		
		session.insert(namespace+".addDm", paramMap);
	}

	//DM 눌렀을 때 팔로잉 목록 출력
	public List<DmVO> following_list(String from_id) {
		
		return session.selectList(namespace+".following_list", from_id);
	}
	
	
	//DM 전체 내용 출력, 시간 등
	public List<DmVO> context_all(String from_id, String to_id) {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("from_id", to_id);
		paramMap.put("to_id", from_id);
		
		return session.selectList(namespace+".context_all", paramMap);
		
		
	}
	
	public Integer following_list_count(String from_id, String to_id) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("from_id", from_id);
		paramMap.put("to_id", to_id);
		
		return session.selectOne(namespace+".following_list_count", paramMap);
	}
	
	// dm 보내기
	public void send(String from_id, String to_id, String context) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("from_id", from_id);
		paramMap.put("to_id", to_id);
		paramMap.put("context", context);
		
		session.insert(namespace+".send", paramMap);
	}
}
