package com.blackolive.app.domain.adminpage;

import java.math.BigDecimal;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PromotionDiscountDTO {
	
	private BigDecimal promotionDiscountPrice;
	private Date promotionDiscountStartDay;
	private Date promotionDiscountEndDay;

}
