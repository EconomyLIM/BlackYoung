package com.blackolive.app.service.adminpage;

import java.util.List;

import com.blackolive.app.domain.adminpage.QnaListDTO;

public interface AdminQnAService {

	public List<QnaListDTO> getQnAList();
	
	public QnaListDTO getQnaService(String qnaId);
}
