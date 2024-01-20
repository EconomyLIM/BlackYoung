package com.blackolive.app.domain.productList;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductContainer {
	
	private String productDisplaySrc;
	private String brandName;
	private String brandId;
	private String productDisplayName;
	private int minprice;
	private int afterprice;
	private String categoryLargeId;
	private String categoryMidId;
	private String categorySmallId;
	private String productDisplayId;
	private String productId;
	private String couponflag;
	private String discountflag;
	private String presentflag;
	private String todaypickupflag;
	private int ordercnt;
	private int productStock;
	private int productDisplayLike;
	private Date productDisplayRegdate;
	private int productLikeState;
	
}
