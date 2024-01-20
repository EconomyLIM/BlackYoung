package com.blackolive.app.domain.review;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDetailDTO {
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
	private List<ReviewImgDTO> reviewimg;
	
	private String nickname;
	private String profileContent;
	private String profileImg;
	private String skintoneName;
	private String skintypeName;
	private List<SkintbDTO> skinTrouble;
	
	private String gradeName;	// 등급 
	private int rnk;			// 랭킹
	private int reviewCnt;	// 유저의 전체 리뷰 수
	private int likeCnt;		// 유저의 전체 리뷰 도움 수
	
	private String productName;
	private int productPrice;
	private String productImgSrc;
	private String brandName;
}