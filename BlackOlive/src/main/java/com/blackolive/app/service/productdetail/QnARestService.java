package com.blackolive.app.service.productdetail;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.productdetail.QnAListDTO;
import com.blackolive.app.domain.productdetail.QnAWriteDTO;

public interface QnARestService {

	// QnA등록 작업 insertQnA
	public int insertQnAService(QnAWriteDTO qnaWriteDTO);
		
	// Qna 수정하기 위해 QnaDTO를 갖고오는 작업 getQnA
	public QnAListDTO getQnAService(String qnaId);
	
	// qna 수정하는 작업 modifyQnA
	public int modifyQnAService(String qnaId, String qnaQuestion);
		
	// qna 삭제하는 작업 deleteQna
	public int deleteQnAService(String qnaId);
	
} // interface
