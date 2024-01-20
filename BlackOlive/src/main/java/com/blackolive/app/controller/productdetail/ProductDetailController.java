package com.blackolive.app.controller.productdetail;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blackolive.app.domain.head.AllCategoryDTO;
import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.domain.head.CategoryMidDTO;
import com.blackolive.app.domain.head.CategorySmallDTO;
import com.blackolive.app.domain.productList.PageDTO;
import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.domain.productdetail.GiftDTO;
import com.blackolive.app.domain.productdetail.ProductBuyinfoDTO;
import com.blackolive.app.domain.productdetail.ProductDetailBrandDTO;
import com.blackolive.app.domain.productdetail.ProductDetailDTO;
import com.blackolive.app.domain.productdetail.ProductDetailExplainIMGDTO;
import com.blackolive.app.domain.productdetail.ProductDetailIMGDTO;
import com.blackolive.app.domain.productdetail.ProductPromotionDTO;
import com.blackolive.app.domain.productdetail.QnAListDTO;
import com.blackolive.app.domain.review.ReviewDTO;
import com.blackolive.app.domain.review.ReviewImgDTO;
import com.blackolive.app.domain.review.ReviewScoreDTO;
import com.blackolive.app.service.exhibition.ExhibitionService;
import com.blackolive.app.service.productList.ProductListService;
import com.blackolive.app.service.productdetail.ProductDetailService;
import com.blackolive.app.service.review.ReviewService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/store/goods")
public class ProductDetailController {
	
	private ProductDetailService productDetailService;
	private ProductListService productListService;
	private ReviewService reviewService;
	private ExhibitionService exhibitionService;
	
	@GetMapping()
	public String getProductInfo(@RequestParam("productDisplayId")String productDisplayId,
			@RequestParam(value = "gdasSort", defaultValue = "0")int gdasSort,
			@RequestParam(value="productId", defaultValue = "ALL")String productId,
			@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value="searchType1",defaultValue = "Y")String searchType_1,
			Principal principal,
			HttpServletRequest request,
					Model model) throws UnsupportedEncodingException {
		//=======================  해당 상품의 모든 카테고리 ===========================
		AllCategoryDTO allCategoryDTO = this.productDetailService.getTotalCategoryService(productDisplayId);
		
		int cateHId = allCategoryDTO.getCategoryTotalId();
		String CategoryLargeId = allCategoryDTO.getCategoryLargeId();
		String CategoryMidId = allCategoryDTO.getCategoryMidId();
		
		// 상품 조회 기록 저장
		this.productDetailService.insertProductViewSerivce(CategoryLargeId, productDisplayId);
		
		List<CategoryLargeDTO> categoryLargeList = this.productListService.getCategoryLargeService(CategoryMidId);
		List<CategoryMidDTO> categoryMidList = this.productListService.getCategoryMidService(CategoryLargeId);
		List<CategorySmallDTO> categorySmallList = this.productListService.getCategorySmallService(CategoryMidId);
		
		model.addAttribute("allCategoryDTO",allCategoryDTO);
		model.addAttribute("categoryLargeList",categoryLargeList);
		model.addAttribute("categoryMidList",categoryMidList);
		model.addAttribute("categorySmallList",categorySmallList);
		
		//=======================  해당 상품의 모든 상위칸에 있는 정보 ===========================	
		List<ProductDetailDTO> productList = this.productDetailService.getProductService(productDisplayId);
		model.addAttribute("productList",productList);
		
		//=======================  해당 상품의 증정품 정보 ===========================	
				GiftDTO giftDTO = this.productDetailService.getGiftService(productDisplayId);
				System.out.println("증정품: " + giftDTO);
				model.addAttribute("giftDTO",giftDTO);
				
		//=======================  해당 상품의 프로모션 ===========================
		List<ProductPromotionDTO>productPromotion = this.productDetailService.getProductPromotionService(productDisplayId);
		model.addAttribute("productPromotion",productPromotion);
		
		//======================= 해당 상품의 이미지 갖고오기 ===========================
		List<ProductDetailIMGDTO> productDisplayImgs = this.productDetailService.getProductDisplayImgService(productDisplayId);
		model.addAttribute("productDisplayImgs", productDisplayImgs);
		
		//======================= 해당 상품의 설명 이미지 갖고오기 ===========================
		List<ProductDetailExplainIMGDTO> productExplainImgs = this.productDetailService.getProductDisplayExplainImgService(productDisplayId);
		model.addAttribute("productExplainImgs", productExplainImgs);
		
		// ======================= 해당 상품의 리뷰 갖고오기 ===========================

			// 페이징 처리
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
		model.addAttribute("gdasSort",gdasSort);
		model.addAttribute("reviewlistall",reviewlistall);
		model.addAttribute("reviewimg",reviewimg);
		model.addAttribute("totalRecords",totalRecords);
		model.addAttribute("reviewcnt",reviewlistall.size());


		// ======================= 해당 브랜드 정보 갖고오기 ===========================
		ProductDetailBrandDTO productBrandInfo = this.productDetailService.getProductBrandInfoSerivce(productDisplayId);
		model.addAttribute("productBrandInfo", productBrandInfo);
		
		// ======================= 해당 상품 상세 설명 정보 갖고오기 ===========================
		List<ProductBuyinfoDTO> productBuyinfo = this.productDetailService.getProductBuyInfoService(productDisplayId);
		model.addAttribute("productBuyinfo", productBuyinfo);
		
		// ======================= 해당 QnA 갖고오기 ===========================
		List<QnAListDTO> qnaList = this.productDetailService.getProductQnaService(productDisplayId, 1, 10);
		// model.addAttribute("qnaList", qnaList);
		
		// QnA 페이징 처리
		int qnaTotalRecords = this.productDetailService.getQnaTotalRecordsService(productDisplayId);
		model.addAttribute("qnaTotalRecords",qnaTotalRecords);
		int qnaTotalPages =this.productDetailService.getQnATotalPagesService(productDisplayId);
		PageDTO qnaPagedto = new PageDTO(1, 10, 10, qnaTotalPages);
		// model.addAttribute("qnaPagedto", qnaPagedto);
		
		// ======================= (데이터 수집) 사용자가 조회했던 중분류 카테고리 저장 ========
		
		// ===================== 상품 추천
		
		// 쿠키 값확인
		List<ProductContainer> history = new ArrayList<ProductContainer>();
		ProductContainer historyDTO = null;
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		        if (cookie.getName().equals("productItems")) {
		            // 원하는 쿠키 가져오기
		            String productItemsValue = cookie.getValue();
		            productItemsValue = java.net.URLDecoder.decode(productItemsValue, "UTF-8");
		            // 쿠키 값을 쉼표(,)를 기준으로 나누기
		            String[] items = productItemsValue.split(",");
		            // 각각의 값에 대해 작업하기
		            for (String item : items) {
		            	System.out.println(item);
		                // 각각의 item에 대해 headService.productHistoryService() 호출하여 historyDTO 생성
		                historyDTO = this.productDetailService.cookieService(item);
		                history.add(historyDTO);
		            }
		        }
		    }
		}
		request.getSession().setAttribute("productHistory", history);
		
		String userId="user1";
		if (principal != null) {
			userId = principal.getName();
		} // if
		
		this.exhibitionService.checkUserVIewService(userId, CategoryMidId);
		
		return "productDetail.productDetail";
	}

}
