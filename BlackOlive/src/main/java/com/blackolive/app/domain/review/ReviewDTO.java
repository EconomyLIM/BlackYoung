package com.blackolive.app.domain.review;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {

	private String reviewId;
	private String userId;
	private String productDisplayId; 
	private int reviewLike;
	private String reviewContent;
	private int reviewGrade;
	private Date reviewRegdate;
	private int reviewPoll1;
	private int reviewPoll2;
	private int reviewPoll3;
	private String productId;
	private String nickname;
	private String profileContent;
	private String profileImg;
	private String skintoneName;
	private String skintypeName;
	private List<SkintbDTO> skinTrouble;
	private List<ReviewImgDTO> reviewimg;
	
	
}
