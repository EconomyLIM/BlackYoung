package com.blackolive.app.service.adminpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.adminpage.QnaListDTO;
import com.blackolive.app.mapper.adminpage.QnAMapper;

@Service
public class AdminQnAServiceImpl implements AdminQnAService{

	@Autowired
	private QnAMapper qnaMapper;
	@Override
	public List<QnaListDTO> getQnAList() {

		return this.qnaMapper.getQnaList();
	}
	@Override
	public QnaListDTO getQnaService( String qnaId) {

		return this.qnaMapper.getQnA(qnaId);
	}

}
