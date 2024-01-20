package com.blackolive.app.mapper.review;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.review.ReviewDTO;
import com.blackolive.app.domain.review.ReviewImgDTO;
import com.blackolive.app.domain.review.ReviewScoreDTO;

public interface ReviewMapper {

	// 리뷰 페이징
	List<ReviewDTO> reviewList(@Param("productDisplayId") String productDisplayId, 
			@Param("gdasSort") int gdasSort, @Param("productId") String productId, 
			@Param("currentPage") int currentPage, @Param("numberPerPage") int numberPerPage,
			@Param("searchType_1")String searchType_1);
	// 리뷰 전체
	List<ReviewDTO> reviewListAll(@Param("productDisplayId") String productDisplayId,@Param("productId") String productId);
	//리뷰 이미지
	List<ReviewImgDTO> reviewimg( @Param("reviewId")String reviewId);
	// 리뷰 단일
	ReviewDTO review( String reviewId);
	// 상품 점수
	ReviewScoreDTO reviewScore(@Param("productDisplayId")String productDisplayId, @Param("productId")String productId);
	//페이징 처리
	// 전체 페이지 구하기
	int getTotalReviewPages(@Param("productDisplayId")String productDisplayId, @Param("productId")String productId,@Param("numberPerPage") int numberPerPage);
		// 
	int getTotalReviewRecords(@Param("productDisplayId")String productDisplayId,@Param("productId") String productId);
	
}
