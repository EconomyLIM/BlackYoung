package com.blackolive.app.domain.brandPage;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BrandPageDTO {

	private String brandId; 
	private String brandName;
	private int brandLike;
	private String brandSummary;
	private String  brandExplaination;
	private String brandImgSrc;
	private String productDisplayId;
	private int productPrice;
	private String productDisplayName;
	private String productDisplaySrc;
	private int productDisplayLike;
	private String reviewId;
	private int reviewLike;
	private String reviewContent;
	private int reviewGrade;
	private Date productDisplayRegdate;
	private String categoryLargeId;
	private String categoryLargeName;
	private int afterPrice;
	private String productId;
	private int prc; 
	private int pdc;
	private int pmp;
	private int stock;
	private int displLike;
	private int ordercnt;
	private int  productStock;
	private int minprice;
    private String brandVideoId;
    private String brandSlogan;
    private String brandVideoLink;
    private String brandVideoDescription;


}
