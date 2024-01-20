package com.blackolive.app.domain.adminpage;

import java.math.BigDecimal;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	
	private String productId;
	private String productDisplayId;
	private String categorySmallId;
	private String productName;
	private BigDecimal productPrice;
	private int productStock;
	
	private CommonsMultipartFile productImg;

}
