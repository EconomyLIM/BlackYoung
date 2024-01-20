package com.blackolive.app.domain.productdetail;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GiftDTO {

	private String giftId;
	private String giftName;
	private String giftStock;
	private String giftRestirct;
	private String giftDisplayId;
	private String giftDisplayScope;
	private Date giftDisplayStartDay;
	private String brandId;
	private String brandName;
	
}
