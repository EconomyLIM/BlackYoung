package com.blackolive.app.domain.productdetail;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductPromotionDTO {

	private String promotionDiscountId;
	private String promotionDiscountStartDay;
	private String promotionDiscountEndDay;
	private int promotionDiscountPrice;
	private String promotionCouponId;
	private String promotionCouponName;
	private String promotionCouponStartDay;
	private String promotionCouponEndDay;
	private int promotionCouponDiscount;
	
} // class
