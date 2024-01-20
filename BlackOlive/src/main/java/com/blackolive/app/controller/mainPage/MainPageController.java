package com.blackolive.app.controller.mainPage;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blackolive.app.domain.exhibition.BannerNProductDTO;
import com.blackolive.app.domain.exhibition.ExhibitionBannerDTO;
import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.domain.head.EventDTO;
import com.blackolive.app.domain.head.GiftCardDTO;
import com.blackolive.app.domain.head.MsgCardDTO;
import com.blackolive.app.domain.productList.BrandTopDTO;
import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.domain.review.ReviewDTO;
import com.blackolive.app.domain.review.ReviewDetailDTO;
import com.blackolive.app.domain.review.ReviewReportDTO;
import com.blackolive.app.mapper.mainPage.MainPageMapper;
import com.blackolive.app.service.exhibition.ExhibitionService;
import com.blackolive.app.service.head.HeadServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainPageController {

	@Autowired
	private MainPageMapper mainPageMapper;
	
	@Autowired
	private HeadServiceImpl headServiceImpl;
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	@GetMapping(value ="/")
	public String mainPage(Principal principal, Model model) throws SQLException {

		log.info("MainPageController / call... ");
		
		List<BannerNProductDTO> bannerNProduct = this.exhibitionService.getExhibitionBannerNProduct(null);
		model.addAttribute("bannerNProduct", bannerNProduct);
		List<ExhibitionBannerDTO> mainfullbanner = this.exhibitionService.getExhibitionBannerService(6);
		model.addAttribute("mainfullbanner", mainfullbanner);
		List<ExhibitionBannerDTO> weekly = this.exhibitionService.getExhibitionBannerService(2);
		model.addAttribute("weekly", weekly);
		List<ExhibitionBannerDTO> magazine = this.exhibitionService.getExhibitionBannerService(3);
		model.addAttribute("magazine", magazine);
		List<ExhibitionBannerDTO> Onlyone = this.exhibitionService.getExhibitionBannerService(4);
		model.addAttribute("Onlyone", Onlyone);
		List<ProductContainer> getMdRecommend = this.exhibitionService.getMdRecommendService();
		model.addAttribute("getMdRecommend",getMdRecommend);
		List<ExhibitionBannerDTO> todayGoods = this.exhibitionService.getExhibitionBannerService(5);
		model.addAttribute("todayGoods", todayGoods);
		List<BrandTopDTO> mbrandlist = this.exhibitionService.getTopBrandService();
		model.addAttribute("mbrandlist",mbrandlist);

		List<ExhibitionBannerDTO> midBanner = this.exhibitionService.getExhibitionBannerService(1);
		model.addAttribute("midBanner",midBanner);
		
		String userId="johndoe5";
		if (principal != null) {
			userId = principal.getName();
		} // if

		List<ProductContainer> pdList = this.exhibitionService.similardisplService(userId);
		model.addAttribute("pdList",pdList);
		
		List<ProductContainer> recommendList = this.exhibitionService.selectUserVIewService(userId, null);
		model.addAttribute("recommendList",recommendList);
		
		return "mainPage.mainPage";
	} // example
	
	@GetMapping("/store/getMembership")
	public String getMembership() {
		return "mainPage.membership";
	}
	
	@GetMapping("/store/getCoupon")
	public String getCoupon() {
		return "mainPage.coupon";
	}
	
	@GetMapping("/store/getEvent")
	public String getEvent(
			@RequestParam(value = "click", defaultValue = "모든회원") String click
			, Model model) throws SQLException {
		List<EventDTO> list = this.headServiceImpl.getEventList(click);
		
		model.addAttribute("click", click);
		model.addAttribute("list", list);
		return "mainPage.event";
	}
	
	@GetMapping("/store/getEventDetail")
	public String getEventDetail(String eventId, Model model) throws SQLException {
		EventDTO dto =  this.headServiceImpl.getEventDetail(eventId);
		
		model.addAttribute("dto", dto);
		
		return "mainPage.eventDetail";
	}
	
	@GetMapping("/store/getGiftCard")
	public String getGiftCard(Model model) throws SQLException {
		List<GiftCardDTO> list = this.headServiceImpl.getGiftCardList();
		model.addAttribute("list", list);
		
		return "mainPage.giftCard";
	}
	
	@GetMapping("/store/getGiftCardForm")
	public String getGiftCardForm(String click, String giftCardId, Model model) throws SQLException {
		GiftCardDTO dto = this.headServiceImpl.getGiftCardDetail(giftCardId);
		List<MsgCardDTO> list = this.headServiceImpl.getMsgcardList();
		
		model.addAttribute("click", click);
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		
		return "mainPage.giftCardForm";
	}
	
	@GetMapping("/store/getRanking")
	public String getRanking(
			String click
			, @RequestParam(value = "type", defaultValue = "판매 랭킹") String type
			, String categoryLargeId
			, Model model) throws SQLException {
		List<CategoryLargeDTO> categoryLargeList = this.headServiceImpl.getRankingCatLargeName(type);
		List<ProductContainer> productList = null; 
		List<ReviewDTO> reviewList = null; 
		
		if(type.equals("판매 랭킹")) {
			productList = this.headServiceImpl.getSaleRankingProduct(categoryLargeId);
			model.addAttribute("productList", productList);
		} else {
			if(categoryLargeId == null || categoryLargeId.isEmpty()) {
				categoryLargeId = "0001";				
			}
			reviewList = this.headServiceImpl.getReviewBest(categoryLargeId);
			model.addAttribute("reviewList", reviewList);
		}
		
		System.out.println("reviewList : " + reviewList);
		
		model.addAttribute("click", click);
		model.addAttribute("type", type);
		model.addAttribute("categoryLargeList", categoryLargeList);
		
		
		return "mainPage.ranking";
	}
	
	// 리뷰 상세 Ajax 처리
	@GetMapping("/store/getReviewDetail")
	@ResponseBody
	public ResponseEntity<ReviewDetailDTO> getReviewDetail(String reviewId) throws SQLException {
		return new ResponseEntity<>(this.headServiceImpl.getReviewDetail(reviewId), HttpStatus.OK);
	}
	
	// 리뷰 도움돼요 Ajax 처리
	@PostMapping("/store/udpReviewLike")
	@ResponseBody
	public ResponseEntity<String> udpReviewLike(String reviewId, int likePlus, Principal principal) throws SQLException {
		if(principal == null)
			return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
			
		return this.headServiceImpl.udpReviewList(reviewId, likePlus) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping("/store/reviewReport")
	@ResponseBody
	public ResponseEntity<String> reviewReport(ReviewReportDTO reviewReportDTO, Principal principal) throws SQLException {
		if(principal == null)
			return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
		
		reviewReportDTO.setUserId(principal.getName());
		return this.headServiceImpl.addReviewReport(reviewReportDTO) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/store/getReviewer")
	public String getReviewer() {
		
		
		return "mainPage.topReviewer";
	}
	
	@GetMapping("/pdList")
	public String pdList(@RequestParam int type,Principal principal,Model model){
		
		List<ProductContainer> pdList = null;
		
		String userId = "user1";
		if (principal != null) {
			userId = principal.getName();
		}
		
		if (type == 1) {
			pdList = this.exhibitionService.similardisplService(userId);
		}else {
			pdList = this.exhibitionService.selectUserVIewService(userId, null);
		}
		
		model.addAttribute("pdList",pdList);
		
		return "/mainPage/pdList";
		
	}
	
	@GetMapping("history")
	public void history(HttpServletRequest request) {
		request.getSession().setAttribute("productHistory", null);
	}
	
} // class
