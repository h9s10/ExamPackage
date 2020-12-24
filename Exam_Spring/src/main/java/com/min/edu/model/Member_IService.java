package com.min.edu.model;

import java.util.List;
import java.util.Map;

import com.min.edu.dtos.Member_DTO;

public interface Member_IService {

	public List<Member_DTO> memList();
	
	public boolean signupMember(Member_DTO dto);
	
	public boolean idDuplicateCheck(String id);
	
	public Member_DTO loginMember(Member_DTO dto);
}









