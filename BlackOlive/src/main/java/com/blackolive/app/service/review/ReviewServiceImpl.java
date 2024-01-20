package com.blackolive.app.service.review;

import java.util.List;

import org.springframework.stereotype.Service;

import com.blackolive.app.domain.review.ReviewDTO;
import com.blackolive.app.domain.review.ReviewImgDTO;
import com.blackolive.app.domain.review.ReviewScoreDTO;
import com.blackolive.app.mapper.review.ReviewMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService{

	private ReviewMapper reviewMapper;
	
	@Override
	public List<ReviewDTO> reviewListService(String productDisplayId, int gdasSort, String productId,
			int currentPage, int numberPerPage, String searchType_1) {
		// TODO Auto-generated method stub
		int begin = (currentPage -1) * numberPerPage + 1;
		int end = begin + numberPerPage -1 ;
		return this.reviewMapper.reviewList(productDisplayId, gdasSort, productId, begin, end,searchType_1);
	}

	@Override
	public List<ReviewImgDTO> reviewimgService(String reviewId) {
		// TODO Auto-generated method stub
		return this.reviewMapper.reviewimg(reviewId);
	}

	@Override
	public ReviewScoreDTO reviewScoreService(String productDisplayId, String productId) {
		// TODO Auto-generated method stub
		return this.reviewMapper.reviewScore(productDisplayId, productId);
	}

	@Override
	public int getTotalReviewPagesServiec(String productDisplayId, String productId, int numberPerPage)
			 {
		// TODO Auto-generated method stub
		return this.reviewMapper.getTotalReviewPages(productDisplayId, productId, numberPerPage);
	}

	@Override
	public int getTotalReviewRecordsService(String productDisplayId, String productId)  {
		// TODO Auto-generated method stub
		return this.reviewMapper.getTotalReviewRecords(productDisplayId, productId);
	}

	@Override
	public List<ReviewDTO> reviewListAllService(String productDisplayId, String productId) {
		// TODO Auto-generated method stub
		return this.reviewMapper.reviewListAll(productDisplayId, productId);
	}

	@Override
	public ReviewDTO reviewService(String reviewId) {
		// TODO Auto-generated method stub
		return this.reviewMapper.review(reviewId);
	}

}
