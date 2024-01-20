package com.blackolive.app.domain.mypage;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
	
	private Date orderDate;				//주문일자
	private String BrandName;			//브랜드명
	private String productDisplayId;	//상품표시id
	private String productDisplayName;	//상품표시명
	private String productDisplaySrc;	//상품표시이미지경로
	private String productId;			//상품id		
	private String productName;			//상품명
	private String orderType;			//주문유형
	
	private String reviewRegdate;		//리뷰작성일
	private String reviewGrade;			//리뷰별점
	private String reviewContent;		//리뷰내용
	
	private Date reviewWritableDate;		//일반리뷰 작성가능일자
	private Date reviewMonthWritableDate;	//한달사용리뷰 작성가능일자
	
}	
                                            