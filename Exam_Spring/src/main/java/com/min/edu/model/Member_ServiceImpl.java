package com.min.edu.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.dtos.Member_DTO;

@Service
public class Member_ServiceImpl implements Member_IService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private Member_IDao iDao;
	
	@Override
	public List<Member_DTO> memList() {
		logger.info("회원조회 memList");
		return iDao.memList();
	}

	@Override
	public boolean signupMember(Member_DTO dto) {
		logger.info("회원가입 signupMember : {}",dto);
		return iDao.signupMember(dto);
	}

	@Override
	public boolean idDuplicateCheck(String id) {
		logger.info("아이디 중복 검사 idDuplicateCheck : {}",id);
		return iDao.idDuplicateCheck(id);
	}

	@Override
	public Member_DTO loginMember(Member_DTO dto) {
		logger.info("로그인 loginMember");
		return iDao.loginMember(dto);
	}

}
