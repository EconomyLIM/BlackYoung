package com.blackolive.app.service.productdetail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.productdetail.QnAListDTO;
import com.blackolive.app.domain.productdetail.QnAWriteDTO;
import com.blackolive.app.mapper.productdetail.QnARestMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QnARestServiceImpl implements QnARestService{

	@Autowired
	private QnARestMapper qnaRestMapper;
	
	// ============ QnA 작성하는 메서드 ===============
	@Override
	public int insertQnAService(QnAWriteDTO qnaWriteDTO) {
		log.info("QnARestServiceImpl insertQnAService call...");
		
		return this.qnaRestMapper.insertQnA(qnaWriteDTO);
	} // insertQnAService

	// ============ QnA 갖고오는 메서드 ===============
	@Override
	public QnAListDTO getQnAService(String qnaId) {
		log.info("QnARestServiceImpl getQnAService call...");
		
		return this.qnaRestMapper.getQnA(qnaId);
	} // getQnAService

	// ============ QnA 수정하는 메서드 ===============
	@Override
	public int modifyQnAService(String qnaId, String qnaQuestion) {
		
		log.info("QnARestServiceImpl modifyQnA call...");
		
		return this.qnaRestMapper.modifyQnA(qnaId, qnaQuestion);
	} // modifyQnA

	// ============ QnA 삭제하는 메서드 ===============
	@Override
	public int deleteQnAService(String qnaId) {

		log.info("QnARestServiceImpl deleteQna call...");
		return this.qnaRestMapper.deleteQnA(qnaId);
	} // deleteQna
	
	
	

} //class
