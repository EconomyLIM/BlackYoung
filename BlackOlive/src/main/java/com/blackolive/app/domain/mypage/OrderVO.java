package com.blackolive.app.domain.mypage;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderVO {
	
	private String orderId;				//주문id
	private Date orderDate;				//주문일자
	private String productDisplaySrc;	//상품표시이미지경로
	private String categorySmallId;		//상품소분류
	private String categoryMidId;		//상품중분류
	private String brandName;			//브랜드명
	private String productDisplayName;	//상품표시명
	private String productDisplayId;	//상품표시id
	private String productName;			//상품명
	private int productCnt;				//상품수량
	private int productPrice;			//상품금액
	private String orderStatus;			//주문상태
	private int totalPrice;				//주문금액
	private Date refundDate;			//환불일자
	private String refundStatus;		//환불상태
	
	
}
