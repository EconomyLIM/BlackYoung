package com.blackolive.app.mapper.adminpage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.adminpage.QnaListDTO;

public interface QnAMapper {

	public List<QnaListDTO> getQnaList ();
	
	public QnaListDTO getQnA(@Param("qnaId") String qnaId);
	
}
