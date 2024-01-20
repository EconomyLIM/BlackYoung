package com.blackolive.app.domain.counselor;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FaqVO {
	
	private int rowNumber;
	private String askCategoryId;
	private String askCategoryMajor;
	private String askCategoryMinor;
	private String faqTitle;
	private String faqContent;
	
}
