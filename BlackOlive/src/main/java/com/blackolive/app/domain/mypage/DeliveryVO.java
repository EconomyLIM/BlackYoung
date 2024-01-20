package com.blackolive.app.domain.mypage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeliveryVO {
	
	private String deliveryId;
	private String deliveryRecipient;	//받는사람
	private String deliveryTel;			//연락처1
	private String deliveryTel2;		//연락처2
	private String deliveryZipcode;		//우편번호
	private String deliveryRoadAddr;	//도로명주소
	private String deliveryAddr;		//지번주소
	private String deliveryDetailAddr;	//상세주소
	private String deliveryMsg;			//배송메세지
	
	
}
