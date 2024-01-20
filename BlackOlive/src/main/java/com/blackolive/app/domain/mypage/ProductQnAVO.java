package com.blackolive.app.domain.mypage;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductQnAVO {
	
	private String brandName;				//브랜드명
	private String productDisplaySrc;		//상품표시이미지
	private String productDisplayId;		//상품표시id
	private String productDisplayName;		//상품표시명
	private String qnaQuestion;				//qna질문
	private String qnaAnswer;				//qna답변
	private Date qnaDate;					//qna작성일
	private String qnaStatus;				//qna상태
	private String productName;				//상품명
	private String categorySmallId;			//상품소분류
	private String categoryMidId;			//상품중분류
	private String productId;				//상품id
	
	
}
