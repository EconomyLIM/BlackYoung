package com.blackolive.app.domain.adminpage;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PromotionCouponDTO {

	private String promotionCouponName;
	private char promotionCouponKind;
	private double promotionCouponDiscount;
	private Date promotionCouponStartDay;
	private Date promotionCouponEndDay;
}
