package com.blackolive.app.domain.adminpage;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PromotionPresentDTO {
	
	private char promotionPresentKind;
	private String promotionPresentName;
	private Date promotionPresentStartDay;
	private Date promotionPresentEndDay;

}
