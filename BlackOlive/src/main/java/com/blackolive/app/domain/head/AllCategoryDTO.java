package com.blackolive.app.domain.head;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AllCategoryDTO {

	private int categoryTotalId;
	private String categoryLargeId;
	private String categoryLargeName;
	private String categoryMidId;
	private String categoryMidName;
	private String categorySmallId;
	private String categorySmallName;
	
} // class
