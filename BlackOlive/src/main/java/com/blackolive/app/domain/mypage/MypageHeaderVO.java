package com.blackolive.app.domain.mypage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MypageHeaderVO {
	
	private String userid;		//회원 id
	private String username;	//회원 이름
	private String grade;		//회원 등급
	private String userimg;		//회원 프로필 이미지
	private int usercoupon;		//회원 잔여 쿠폰 개수
	private int userpoint;		//회원 잔여 포인트
	private int userdeposit;	//회원 잔여 예치금
	
}
