package com.blackolive.app.domain.review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewScoreDTO {

	private int grade5Ratio;
	private int grade4Ratio;
	private int grade3Ratio;
	private int grade2Ratio;
	private int grade1Ratio;
	private int grade13Ratio;
	private int grade12Ratio;
	private int grade11Ratio;
	private int grade23Ratio;
	private int grade22Ratio;
	private int grade21Ratio;
	private int grade33Ratio;
	private int grade32Ratio;
	private int grade31Ratio;
	private float averagegrade;
}
