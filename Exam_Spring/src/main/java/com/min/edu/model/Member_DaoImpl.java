package com.min.edu.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.min.edu.dtos.Member_DTO;

@Repository
public class Member_DaoImpl implements Member_IDao {

	private final String NS = "com.min.edu.model.Member_IDao.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public List<Member_DTO> memList() {
		return sqlSession.selectList(NS+"memberList");
	}

	@Override
	public Member_DTO loginMember(Member_DTO dto) {
		Member_DTO mDto = null;
		System.out.println("시큐리티 실행");
		
		String dbpw = sqlSession.selectOne(NS+"selStringPw", dto.getId());
		
		if(passwordEncoder.matches(dto.getPw(), dbpw)) {
			mDto = sqlSession.selectOne(NS+"enLogin", dto);
		}
		return mDto;
	}

	@Override
	public boolean signupMember(Member_DTO dto) {
		String enPassword = passwordEncoder.encode(dto.getPw());
		dto.setPw(enPassword);
		int cnt = sqlSession.insert(NS+"signupMember", dto);
		return (cnt>0)?true:false;
	}

	@Override
	public boolean idDuplicateCheck(String id) {
		int cnt = sqlSession.selectOne(NS+"idDuplicateCheck",id);
		return (cnt>0)?true:false;
	}

}




