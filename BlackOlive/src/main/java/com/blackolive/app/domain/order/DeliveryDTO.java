package com.blackolive.app.domain.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeliveryDTO {
	private String deliveryId;
	private String userId;
	private String deliveryName;
	private String deliveryZipcode;	
	private String deliveryRoadAddr;
	private String deliveryAddr;
	private String deliveryDetailAddr;
	private String deliveryRecipient;
	private String deliveryTel;
	private String deliveryTel2;
	private String requestSelect;
	private String requestContent;
	private int defaultDelivery;
}
