package com.blackolive.app.service.review;

import java.util.List;

import com.blackolive.app.domain.review.ReviewDTO;
import com.blackolive.app.domain.review.ReviewImgDTO;
import com.blackolive.app.domain.review.ReviewScoreDTO;

public interface ReviewService {

	List<ReviewDTO> reviewListService(String productDisplayId, int gdasSort, String productId, int currentPage, int numberPerPage, String searchType_1);
	
	List<ReviewDTO> reviewListAllService(String productDisplayId,String productId);
	
	List<ReviewImgDTO> reviewimgService( String reviewId);
	
	ReviewDTO reviewService(String reviewId);
	
	ReviewScoreDTO reviewScoreService(String productDisplayId, String productId);
	
	int getTotalReviewPagesServiec(String productDisplayId, String productId, int numberPerPage);

	int getTotalReviewRecordsService(String productDisplayId, String productId);
}
