package com.blackolive.app.domain.productdetail;

import java.math.BigDecimal;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDetailDTO {

	private String productDisplaySrc;
    private String brandName;
    private String brandId;
    private String productDisplayName;
    private BigDecimal minPrice;
//    private int minPrice;
    private String categoryLargeId;
    private String categoryMidId;
    private String categorySmallId;
    private BigDecimal afterPrice;
//    private int afterPrice;
    private String productDisplayId;
    private String productId;
    private String couponflag;
    private String discountflag;
    private String presentflag;
    private String todayPickupflag;
    private int orderCnt;
    private int productStock;
    private int productDisplayLike;
    private Date productDisplayRegDate;
    private String productName;
	
}
