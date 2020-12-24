package com.min.edu.model;

import java.util.List;
import java.util.Map;

import com.min.edu.dtos.Answerboard_DTO;

public interface Answerboard_IService {

	public List<Answerboard_DTO> selectDynamic(Map<String, String> map);
	
	public Answerboard_DTO selectDetailBoard(String seq);

	public boolean modifyBoard(Map<String, Object> map);

	public boolean insertBoard(Answerboard_DTO dto);

	public int multiDelete(String[] seqs);

	public boolean multiDelete2(Map<String, String[]> map);
	
	public boolean reply(Answerboard_DTO dto);
	
}










