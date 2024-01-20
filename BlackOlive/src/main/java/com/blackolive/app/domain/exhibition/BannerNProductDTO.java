package com.blackolive.app.domain.exhibition;

import java.util.List;

import com.blackolive.app.domain.productList.ProductContainer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BannerNProductDTO {
	
	private String exhibitionId;
	private String exhibitionBannerImgSrc;
	private String exhibitionBannerSummary;
	private String exhibitionBannerSummary2;
	private String exhibitionBannerKeyword;
	private String exhibitionCategory;
	private List<ProductContainer> getproductcontainer;
}
