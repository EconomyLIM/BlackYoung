package com.blackolive.app.controller.productdetail;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blackolive.app.domain.productList.PageDTO;
import com.blackolive.app.domain.productdetail.ProductDetailDTO;
import com.blackolive.app.domain.productdetail.ProductDetailIMGDTO;
import com.blackolive.app.domain.review.ReviewDTO;
import com.blackolive.app.domain.review.ReviewImgDTO;
import com.blackolive.app.domain.review.ReviewScoreDTO;
import com.blackolive.app.service.productdetail.ProductDetailService;
import com.blackolive.app.service.review.ReviewService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ReviewAjaxController {

	private ReviewService reviewService;
	private ProductDetailService productDetailService;
	
	@GetMapping("/getReview")
	public String getReview(@RequestParam(value = "currentPage", defaultValue = "1")int currentPage 
			,@RequestParam(value ="productDisplayId")String productDisplayId,
			@RequestParam(value = "gdasSort", defaultValue = "0")int gdasSort,
			@RequestParam(value="productId", defaultValue = "ALL")String productId,
			@RequestParam(value="searchType1",defaultValue = "Y")String searchType_1,
			Model model) {
		
		int numberOfPageBlock =10; //
		int totalRecords =0; // 총 레코드 수 게시글 수
		
		int perPage = 1; // 한페이지에 출력하는 변수를 서버에 전송하는 변수 원래는 24이지만 테스트로인해 5로수정
		int totalpage = 0; // 한페이지가 얼마나 나오는 수
		PageDTO pageDTO = null;
		totalRecords = this.reviewService.getTotalReviewRecordsService(productDisplayId, productId);
		totalpage = this.reviewService.getTotalReviewPagesServiec(productDisplayId, productId, perPage);
		model.addAttribute("pDto",new PageDTO(currentPage, perPage, numberOfPageBlock, totalpage));
			// 리뷰 리스트 불러오기
		List<ReviewDTO> reviewlist = this.reviewService.reviewListService(productDisplayId, gdasSort, productId, currentPage, perPage,searchType_1);
		model.addAttribute("reviewlist",reviewlist);
		List<ReviewDTO> reviewlistall = this.reviewService.reviewListAllService(productDisplayId, productId);
		// 리뷰 점수
		ReviewScoreDTO reviewScoreDTO = this.reviewService.reviewScoreService(productDisplayId, productId);
		model.addAttribute("reviewScore",reviewScoreDTO);
		// 리뷰 이미지
		List<ReviewImgDTO> reviewimglist = null;
		List<List<ReviewImgDTO>> reviewimg = new ArrayList<List<ReviewImgDTO>>();
		
		model.addAttribute("reviewlistall",reviewlistall);
		model.addAttribute("reviewimg",reviewimg);
		model.addAttribute("totalRecords",totalRecords);
		model.addAttribute("reviewcnt",reviewlistall.size());
		List<ProductDetailDTO> productList = this.productDetailService.getProductService(productDisplayId);
		model.addAttribute("productList",productList);
		List<ProductDetailIMGDTO> productDisplayImgs = this.productDetailService.getProductDisplayImgService(productDisplayId);
		model.addAttribute("productDisplayImgs", productDisplayImgs);
		System.out.println(gdasSort);
		model.addAttribute("gdasSort",gdasSort);
		model.addAttribute("searchType_1",searchType_1);
		return "/review/review";
	}
	@GetMapping("/reviewimg")
	public String reviewimg(@RequestParam(value="reviewId")String reviewId,Model model) {
		
		model.addAttribute("reviewDTO",this.reviewService.reviewService(reviewId));
		
		return "/review/reviewimg";
	}
	
	@GetMapping("reviewimgpopup")
	public String reviewimgpopup(@RequestParam(value="reviewId")String reviewId
			,@RequestParam(value ="productDisplayId")String productDisplayId,
			@RequestParam(value = "gdasSort", defaultValue = "0")int gdasSort,
			@RequestParam(value="productId", defaultValue = "ALL")String productId,
			@RequestParam(value="searchType1",defaultValue = "Y")String searchType_1,
			@RequestParam(value="index",defaultValue = "1")int index,
			Model model) {
		
		
			// 리뷰 리스트 불러오기
		List<ReviewDTO> reviewlistall = this.reviewService.reviewListAllService(productDisplayId, productId);
		// 리뷰 점수
		ReviewScoreDTO reviewScoreDTO = this.reviewService.reviewScoreService(productDisplayId, productId);
		model.addAttribute("reviewScore",reviewScoreDTO);
		// 리뷰 이미지
		List<ReviewImgDTO> reviewimglist = null;
		List<List<ReviewImgDTO>> reviewimg = new ArrayList<List<ReviewImgDTO>>();
		
		model.addAttribute("reviewlistall",reviewlistall);
		model.addAttribute("reviewimg",reviewimg);
		
		List<ProductDetailDTO> productList = this.productDetailService.getProductService(productDisplayId);
		model.addAttribute("productList",productList);
		List<ProductDetailIMGDTO> productDisplayImgs = this.productDetailService.getProductDisplayImgService(productDisplayId);
		model.addAttribute("productDisplayImgs", productDisplayImgs);
		System.out.println(gdasSort);
		model.addAttribute("gdasSort",gdasSort);
		model.addAttribute("searchType_1",searchType_1);
		model.addAttribute("index",index);
		return "/review/reviewimgpopup";
	}
}
