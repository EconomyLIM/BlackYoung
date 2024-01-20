package com.blackolive.app.domain.adminpage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderCheckDTO {
	
	private String orderId;
	private String userId;
	private String deliveryId;
	private String orderDate;
	private char todayOption;
	private char packagingOption;
	private String orderStatus;
	private String deliveryCompany;
	private String invoiceNumber;
	private String sendDate;
	
}
