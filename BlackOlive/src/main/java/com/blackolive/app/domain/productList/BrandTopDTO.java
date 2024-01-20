package com.blackolive.app.domain.productList;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BrandTopDTO {

	private String brandId;
	private String brandName;
	private String brandImgSrc;
	private String brandLike;
	private List<ProductContainer> productContainer;
}
