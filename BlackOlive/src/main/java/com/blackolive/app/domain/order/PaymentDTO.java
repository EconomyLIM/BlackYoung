package com.blackolive.app.domain.order;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentDTO {
	private String paymentId;
	private String orderId;
	private int totalPrice;
	private int paymentPrice;
	private int deliveryPrice;
	private int couponDiscountPrice;
	private int pointPrice;
	private String paymentType;
	private int savedMoney;
	private Date paymentDate;
	private String paymentStatus;
	private String cardType;
	private String installmentType;
	private String cashReciptCheck;
}
