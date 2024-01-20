package com.blackolive.app.domain.adminpage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDisplayDTO {
	
	private String productDisplayId;
	private String brandId;
	private String productDisplayName;
	private char productDisplayOption;

} // class
