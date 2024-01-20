package com.blackolive.app.domain.adminpage;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderRegisterDTO {

	private String smallCategory; // 상품 소분류
	private String productDisplayName; // 상품 표시 이름
	private CommonsMultipartFile formFileMultiple; // 상품 표시 이미지
	private List<CommonsMultipartFile> multiInfoImgs; // 상품 표시 설명 이미지
	private List<ProductDTO> products;
	// 할인프로모션
	private BigDecimal promotionDiscountPrice;
	private Date promotionDiscountStartDay;
	private Date promotionDiscountEndDay;
	// 쿠폰프로모션	
	private String promotionCouponName;
	private char promotionCouponKind;
	private double promotionCouponDiscount;
	private Date promotionCouponStartDay;
	private Date promotionCouponEndDay;
	// 증정프로모션
	private char promotionPresentKind;
	private String promotionPresentName;
	private Date promotionPresentStartDay;
	private Date promotionPresentEndDay;
	
	// 구매 정보
	private List<BuyInfoDTO> buyInfos;
}
