package com.blackolive.app.domain.mypage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductLikeVO {
	
	//private int rowNumber;					//rownum
	private String productDisplaySrc;		//상품표시 이미지 경로
	private String brandName;				//브랜드명
	private String productDisplayName;		//상품표시명
	private String categorySmallId;			//상품소분류
	private String categoryMidId;			//상품중분류
	private String productPrice;			//상품가격
	private String afterPrice;				//할인된 가격
	private String productDisplayId;		//상품표시id
	private String productId;				//상품id
	private int promotionCoupon;			//쿠폰 프로모션
	private int promotionDiscount;			//할인 프로모션
	private int promotionPresent;			//증정 프로모션
	private int stock;						//재고량
	
}
