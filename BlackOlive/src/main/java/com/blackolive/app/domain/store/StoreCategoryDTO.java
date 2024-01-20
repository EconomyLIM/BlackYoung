package com.blackolive.app.domain.store;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreCategoryDTO {
	private String categoryId;
	private String categoryName;
}
