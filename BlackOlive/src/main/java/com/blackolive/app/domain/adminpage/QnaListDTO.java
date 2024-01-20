package com.blackolive.app.domain.adminpage;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaListDTO {
	
	private String qnaId;
	private String qnaQuestion;
	private String productDisplayId;
	private String productDisplayName;
	private String userId;
	private String qnaStatus;
	private Date qnaDate;

}
