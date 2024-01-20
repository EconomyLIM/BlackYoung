package com.blackolive.app.domain.order;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CouponDTO {
	private String couponId;
	private String couponCategory;
	private String couponName;
	private double couponPrice;
	private int couponCondition;
	
	private Date coupStartdate;
	private Date coupEnddate;
}
