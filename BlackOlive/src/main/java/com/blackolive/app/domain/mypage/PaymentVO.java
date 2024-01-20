package com.blackolive.app.domain.mypage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentVO {
	
	private int orderPrice;				//주문금액(상품+배송)
	private int totalPrice;				//상품금액
	private int deliveryPrice;			//배송비
	private int couponDiscountPrice;	//쿠폰할인금액
	private int pointPrice;				//포인트금액
	private int paymentPrice;			//결제금액
	private String paymentType;			//결제수단
	private String cardType;			//카드종류
	private String installmentType;		//할부종류
	private String paymentDate;			//결제일
	private String refundDate;			//환불일
	private String refundPrice;			//환불금액
	private String refundReason;		//환불이유
	private String refundStatus;		//환불처리상태
}	
