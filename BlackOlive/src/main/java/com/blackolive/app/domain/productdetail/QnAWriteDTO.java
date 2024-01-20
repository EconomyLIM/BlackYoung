package com.blackolive.app.domain.productdetail;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnAWriteDTO {
	
	private String productDisplayId;
	private String userId;
	private String qnaQuestion;

} // class
