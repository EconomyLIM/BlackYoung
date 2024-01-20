package com.blackolive.app.controller.order;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

@Data
@AllArgsConstructor
@ToString
public class OrderHandler {
	private String userId;

	private String deliveryId;			// 배송지 id
	private String deliveryMsg;			// 배송메시지
	private String visitHow;			// 출입 방법
	private String visitPwd;			// 출입 비번
	private String totalPrice;			// 총 상품 금액
	private String totalPay;			// 총 결제 금액
	private String deliveryPrice;		// 배송비
	private String payType;				// 결제 수단
	private String cardType;			// 카드 종류
	private String[] products;			// 주문한 상품 id와 수량 
	private String giftYn;				// 선물 여부	
 
	private String quickYN;				// 오늘 드림 여부
	private String pickupYN;			// 픽업 여부
	private String packagingOption = "N"; 	// 선물 포장 여부
	private String installmentType = "0";		// 할부종류
	private String couponDiscountPrice; // 쿠폰할인금액
	private String pointPrice; 			// 포인트 결제 금액
	private String click;				// 어떤 버튼을 누르고 주문페이지로 온지
	
	private String region;
	private String today_param;
	private String today_date;			// 금일 or 익일
	private String today_type;
	private String today_arrive;		// 오늘 드림 도착 시간
	private String hour_group;			// 걸린 시간 그룹
	private String today_del_date;		// 배송 예정 일시
	
	public OrderHandler() {
		Date today_arrive = new Date();
		int addHour = (int)(Math.random()*3)+1;
		today_arrive.setHours(today_arrive.getHours() + addHour);
		String pattern = "yyyy-MM-dd HH:mm";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		this.today_arrive = sdf.format(today_arrive);
		
		Date currDate = new Date();
		String currStr = currDate.getHours() + "" + currDate.getMinutes();
		String todayStr = today_arrive.getHours() + "" + today_arrive.getMinutes();
		int diff = Integer.parseInt(todayStr) - Integer.parseInt(currStr);
		if(addHour == 1) {
			this.hour_group = "1시간 이내";
		} else if(addHour == 2) {
			this.hour_group = "1시간~2시간";
		} else if(addHour == 3) {
			this.hour_group = "2시간~3시간";
		}
	}
	
	
	public void setToday_param(String today_param) {
		if(today_param == null) return;
		
		String[] today_date_type = today_param.split("-");
		this.today_date = today_date_type[0];				// 금일 or 익일
		this.today_type = today_date_type[1];				// 배송 구분
		
		Date d = new Date();
		if(today_date.equals("익일")) {
			d.setDate(d.getDate()+1);				
		}
		String pattern = "yyyy.MM.dd";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		sdf.format(d);
		this.today_del_date = sdf.format(d);
	}
 
}
