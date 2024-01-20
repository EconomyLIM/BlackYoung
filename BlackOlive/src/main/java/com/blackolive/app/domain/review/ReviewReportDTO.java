package com.blackolive.app.domain.review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReviewReportDTO {
	private String reviewReportId;
	private String reviewId;
	private String userId;
	private String reviewReportAnswer;
	private String reviewReportContent;
	private String reviewReportType;
	private String reviewReportRegdate;
}
