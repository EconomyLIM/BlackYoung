package com.blackolive.app.domain.adminpage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SendProcessDTO {
	
	private String orderId;
	private String deliveryCompany;
	private String invoiceNumber;

}
