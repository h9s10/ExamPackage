package com.min.edu.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.min.edu.dtos.Answerboard_DTO;

@Repository
public class Answerboard_DaoImpl implements Answerboard_IDao {

	private final String NS = "com.min.edu.model.Answerboard_IDao.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Answerboard_DTO> selectDynamic(Map<String, String> map) {
		List<Answerboard_DTO> lists = sqlSession.selectList(NS+"selectDynamic", map);
		return lists;
	}

	@Override
	public Answerboard_DTO selectDetailBoard(String seq) {
		Answerboard_DTO dto = sqlSession.selectOne(NS+"selectDetailBoard" , seq);
		return dto;
	}
	
	@Override
	public int replyInsert(Answerboard_DTO dto) {
		return sqlSession.insert(NS+"replyInsert", dto);
	}

	@Override
	public int replyUpdate(Answerboard_DTO dto) {
		return sqlSession.update(NS+"replyUpdate", dto);
	}

	@Override
	public boolean modifyBoard(Map<String, Object> map) {
		int cnt = sqlSession.update(NS+"modifyBoard", map);
		return cnt>0?true:false;
	}

	@Override
	public boolean insertBoard(Answerboard_DTO dto) {
		int cnt = sqlSession.insert(NS+"insertBoard", dto);
		return cnt>0?true:false;
	}

	@Override
	public int multiDelete(String[] seqs) {
		int cnt = 0;
		for (int i = 0; i < seqs.length; i++) {
			cnt += sqlSession.update(NS+"multiDelete", seqs[i]);
		}
		return cnt;
	}

	@Override
	public boolean multiDelete2(Map<String, String[]> map) {
		int cnt = sqlSession.update(NS+"multiDelete2", map);
		return cnt>0?true:false;
	}




	
	

}