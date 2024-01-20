package com.blackolive.app.domain.review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewImgDTO {

	private String reviewImgId;
	private String reviewId;
	private String reviewImgSrc; 
	
}
