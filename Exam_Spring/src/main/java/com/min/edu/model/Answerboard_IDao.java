package com.min.edu.model;

import java.util.List;
import java.util.Map;

import com.min.edu.dtos.Answerboard_DTO;

public interface Answerboard_IDao {

	public List<Answerboard_DTO> selectDynamic(Map<String, String> map);

	public Answerboard_DTO selectDetailBoard(String seq);
	
	public int replyInsert(Answerboard_DTO dto);

	public int replyUpdate(Answerboard_DTO dto);

	public boolean modifyBoard(Map<String, Object> map);

	public boolean insertBoard(Answerboard_DTO dto);

	public int multiDelete(String[] seqs);

	public boolean multiDelete2(Map<String, String[]> map);
	

}
