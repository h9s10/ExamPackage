package com.min.edu.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.min.edu.dtos.Answerboard_DTO;

import oracle.net.aso.i;

@Service
public class Answerboard_ServiceImpl implements Answerboard_IService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private Answerboard_IDao iDao;

	@Override
	public List<Answerboard_DTO> selectDynamic(Map<String, String> map) {
		logger.info("IService selectDaynamic");
		return iDao.selectDynamic(map);
	}

	@Override
	public Answerboard_DTO selectDetailBoard(String seq) {
		logger.info("IService selectDetailBoard");
		return iDao.selectDetailBoard(seq);
	}
	
	@Override
	public boolean modifyBoard(Map<String, Object> map) {
		logger.info("ISerivce modifyBoard");
		return iDao.modifyBoard(map);
	}

	@Override
	public boolean insertBoard(Answerboard_DTO dto) {
		logger.info("IService insertBoard");
		return iDao.insertBoard(dto);
	}

	@Override
	public int multiDelete(String[] seqs) {
		logger.info("IService insertBoard");
		return iDao.multiDelete(seqs);
	}

	@Override
	public boolean multiDelete2(Map<String, String[]> map) {
		logger.info("IService insertBoard");
		return iDao.multiDelete2(map);
	}

	@Transactional
	@Override
	public boolean reply(Answerboard_DTO dto) {
		int cnt1 = iDao.replyUpdate(dto);
		int cnt2 = iDao.replyInsert(dto);
		return (cnt1>0 || cnt2>0)?true:false;
	}


	

}