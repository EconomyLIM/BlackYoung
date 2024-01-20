package com.blackolive.app.domain.productdetail;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnAListDTO {

	private String qnaId;
	private String userId;
	private String qnaQuestion;
	private String qnaAnswer;
	private String qnaDate;
	private String qnaStatus;
	private boolean canModify = false;
	
} // class
