package com.blackolive.app.domain.exhibition;

import java.util.List;

import com.blackolive.app.domain.productList.ProductContainer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExhibitionCategoryDTO {

	private String exhibitionCategoryId;
	private String exhibitionCategoryName;
	private List<ProductContainer> productContainer;
	
} // class
