package com.blackolive.app.controller.mypage;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blackolive.app.domain.counselor.Criteria;
import com.blackolive.app.domain.counselor.PersonalAskVO;
import com.blackolive.app.domain.mypage.BrandLikeVO;
import com.blackolive.app.domain.mypage.DeliveryStatusVO;
import com.blackolive.app.domain.mypage.DeliveryVO;
import com.blackolive.app.domain.mypage.MypageHeaderVO;
import com.blackolive.app.domain.mypage.OrderVO;
import com.blackolive.app.domain.mypage.PaymentVO;
import com.blackolive.app.domain.mypage.ProductLikeVO;
import com.blackolive.app.domain.mypage.ProductQnAVO;
import com.blackolive.app.service.counselor.PersonalAskService;
import com.blackolive.app.service.mypage.MypageLayoutService;
import com.blackolive.app.service.mypage.MypageLikeService;
import com.blackolive.app.service.mypage.MypageMainService;
import com.blackolive.app.service.mypage.MypageOrderDeliveryService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
public class MypageMainController {
	
	@Autowired
	private MypageLayoutService layoutService;
	
	@Autowired
	private MypageMainService mainService;
	
	@Autowired
	private MypageOrderDeliveryService orderDeliveryService;
	
	@Autowired
	private MypageLikeService likeService;
	
	@Autowired
	private PersonalAskService personalAskService;
	
	//마이페이지로 이동 컨트롤러 메서드
	//회원id -  
	@GetMapping(value = "main")
	public String mypagemain(
				//id 가져오기
				Principal principal,
				Model model
			) throws ClassNotFoundException, SQLException{
		log.info("> mypagemain GET");
		//모듈 DB 데이터 가져오기
		String userid = principal.getName();
		//해더
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userid);
		model.addAttribute("headerVO", headerVO);
		
		//사이드바
		int sideVO = this.layoutService.mypageSide(userid);
		model.addAttribute("sideVO", sideVO);
				
		//컨텐츠 가져오기
		//주문배송현황
		DeliveryStatusVO deliveryStatusVO = this.mainService.deliveryStatus(userid);
		model.addAttribute("deliveryStatusVO", deliveryStatusVO);
		
		//좋아요한 상품
		List<ProductLikeVO> likeVO = this.likeService.productLikeListService(userid);
		model.addAttribute("likeVO", likeVO);
		
		//1:1문의내역
		List<PersonalAskVO> askVO = this.mainService.personalAskListService(userid);
		model.addAttribute("askVO", askVO);
		
		//상품 QnA 내역
		List<ProductQnAVO> qnaVO = this.mainService.productQnAservice(userid);
		model.addAttribute("qnaVO", qnaVO);
		
		
		return "mypage.mypage";
		
	}
	

	//주문배송페이지 컨트롤러 메서드
	@GetMapping("/orderdelivery")
	public String getorderdelivery(
				@RequestParam(name = "startDate", required = false) String startdate,
				@RequestParam(name = "endDate", required = false) String enddate,
				@RequestParam(name = "searchOrderType", required = false) String searchType,
				Principal principal,
				Model model
			) throws ClassNotFoundException, SQLException{
		log.info("> getorderdelivery GET");
		//모듈 DB 데이터 가져오기
		String userid = principal.getName();
		//해더
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userid);
		model.addAttribute("headerVO", headerVO);
		//사이드바
		int sideVO = this.layoutService.mypageSide(userid);
		model.addAttribute("sideVO", sideVO);
		
		//주문배송현황
		DeliveryStatusVO deliveryStatusVO = this.mainService.deliveryStatus(userid);
		model.addAttribute("deliveryStatusVO", deliveryStatusVO);
		
		
		String orderType = null;
		//구매 기간만 설정시	
		if ( startdate == null  ) {
			
			List<OrderVO> orderList = this.orderDeliveryService.orderlistservice(userid);
			model.addAttribute("orderList", orderList);
	
		//구매 기간 설정시	
		} else if (searchType.equals("")) {
			
			List<OrderVO> orderList = this.orderDeliveryService.orderlistservicewithdate(userid, startdate, enddate);
			model.addAttribute("orderList", orderList);
			
		//구매 기간 + 매장 설정시	
		} else if (searchType.equals("10")) {
			orderType = "온라인";
			List<OrderVO> orderList = this.orderDeliveryService.orderlistservicewithcondition(userid, startdate, enddate, orderType);	
			model.addAttribute("orderList", orderList);
			
			//검색 조건 없이 목록 호출	
		} else {			
			orderType = "매장";
			List<OrderVO> orderList = this.orderDeliveryService.orderlistservicewithcondition(userid, startdate, enddate, orderType);					
			model.addAttribute("orderList", orderList);
		}

		return "mypage.orderdelivery";
	}

	//주문 상세보기 
	@GetMapping("/orderdeliverydetail")
	public String orderdeliverydetailcontroller(
				@RequestParam("orderId") String orderId,
				Principal principal,
				Model model
			) throws ClassNotFoundException, SQLException {
		log.info("> orderdeliverydetail GET,  orderId = " + orderId);
		
		//모듈 DB 데이터 가져오기
		String userid = principal.getName();
		//해더
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userid);
		model.addAttribute("headerVO", headerVO);
		//사이드바
		int sideVO = this.layoutService.mypageSide(userid);
		model.addAttribute("sideVO", sideVO);
		
		//주문 상세정보
		OrderVO orderVO = this.orderDeliveryService.detailorderservice(orderId);
		model.addAttribute("orderVO", orderVO);
		
		//배송지 상세정보
		DeliveryVO deliveryVO = this.orderDeliveryService.deliveryservice(orderId);
		model.addAttribute("deliveryVO", deliveryVO);
		
		//결제 상세정보
		PaymentVO paymentVO = this.orderDeliveryService.paymentservice(orderId);
		model.addAttribute("paymentVO", paymentVO);
		
		return "mypage.orderdeliverydetail";
	}
	
	//좋아요 페이지 상품 좋아요 컨트롤러 메서드
	@GetMapping("/productlike")
	public String productlikecontroller(
				@RequestParam(name = "productId", required = false) String productId,
				@RequestParam(name = "deleteType", required = false) String deleteType,
				Model model,
				Principal principal
			) throws ClassNotFoundException, SQLException {
		log.info("> productlikecontroller GET");
		
		//모듈 DB 데이터 가져오기
		String userid = principal.getName();
		//해더
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userid);
		model.addAttribute("headerVO", headerVO);
		//사이드바
		int sideVO = this.layoutService.mypageSide(userid);
		model.addAttribute("sideVO", sideVO);
		
		//삭제 파라미터가 있다면
		if (deleteType != null) {
			
			if ( deleteType.equals("1") ) {
				//productId에 해당하는 상품 좋아요 목록에서 삭제
				int result = this.likeService.productLikeDeleteService(userid, productId);
				model.addAttribute("result", result);
				
			} else if (deleteType.equals("2")) {
				//좋아요 목록 전체 삭제
				int result = this.likeService.productLikeDeleteAllService(userid);
				model.addAttribute("result", result);
			}
		}
		
		//상품 좋아요 페이지 목록 조회
		List<ProductLikeVO> likeVO = this.likeService.productLikeListService(userid);
		model.addAttribute("likeVO", likeVO);
		
		return "mypage.productlike";
	}
	
	//좋아요 페이지 브랜드 좋아요 컨트롤러 메서드
	@GetMapping("/brandlike")
	public String brandlikecontroller(
				@RequestParam(name = "brandId", required = false) String brandId,
				@RequestParam(name = "deleteType", required = false) String deleteType,
				Principal principal,
				Model model
			) throws ClassNotFoundException, SQLException {
		
		//모듈 DB 데이터 가져오기
		String userid = principal.getName();		
		//해더
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userid);
		model.addAttribute("headerVO", headerVO);
		//사이드바
		int sideVO = this.layoutService.mypageSide(userid);
		model.addAttribute("sideVO", sideVO);
		
		//삭제 파라미터가 있다면
		if (deleteType != null) {
			if ( deleteType.equals("1") ) {
				//brandId에 해당하는 상품 좋아요 목록에서 삭제
				int result = this.likeService.brandLikeDeleteService(userid, brandId);
				model.addAttribute("result", result);
				
			} else if (deleteType.equals("2")) {
				//좋아요 목록 전체 삭제
				int result = this.likeService.brandLikeDeleteAllService(userid);
				model.addAttribute("result", result);
			}
		}
		
		//브랜드 좋아요 페이지 목록 조회
		List<BrandLikeVO> brandVO = this.likeService.brandLikeListService(userid);
		model.addAttribute("brandVO", brandVO);
		
		return "mypage.brandlike";
	}

	//상품 QnA 목록 가져오기
	@GetMapping("/productQnA")
	public String productQnAcontroller(
			@RequestParam(name = "startDate", required = false) String startdate,
			@RequestParam(name = "endDate", required = false) String enddate,
			Principal principal,
			Model model
			) throws ClassNotFoundException, SQLException {
		//모듈 DB 데이터 가져오기
		String userid = principal.getName();		
		//해더
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userid);
		model.addAttribute("headerVO", headerVO);
		//사이드바
		int sideVO = this.layoutService.mypageSide(userid);
		model.addAttribute("sideVO", sideVO);
		
		//상품QnA 가져오기
		if (startdate == null) {
			//처음 페이지 
			List<ProductQnAVO> qnaVO = this.mainService.productQnAmainservice(userid) ; 
			model.addAttribute("qnaVO", qnaVO);
		} else {
			//날짜에 따른 조회 
			List<ProductQnAVO> qnaVO = this.mainService.productQnAwithDateservice(userid, startdate, enddate);
			model.addAttribute("qnaVO", qnaVO);
		}
		
		return "mypage.productQnA";
	}
	
	/*
	@GetMapping("/reviewwrite")
	public String reviewwritecontroller(
			Principal principal,
			Model model
			) throws ClassNotFoundException, SQLException {
		//모듈 DB 데이터 가져오기
		String userid = principal.getName();		
		//해더
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userid);
		model.addAttribute("headerVO", headerVO);
		//사이드바
		int sideVO = this.layoutService.mypageSide(userid);
		model.addAttribute("sideVO", sideVO);
				
		
		return "mypage.reviewwrite";
	}
	
	
	@GetMapping("/reviewmonthwrite")
	public String reviewmonthwritecontroller(
			Principal principal,
			Model model
			) throws ClassNotFoundException, SQLException {
		//모듈 DB 데이터 가져오기
		String userid = principal.getName();		
		//해더
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userid);
		model.addAttribute("headerVO", headerVO);
		//사이드바
		int sideVO = this.layoutService.mypageSide(userid);
		model.addAttribute("sideVO", sideVO);
		
		
		return "mypage.reviewmonthwrite";
	}
	
	
	@GetMapping("/reviewview")
	public String reviewviewcontroller(
			Principal principal,
			Model model
			) throws ClassNotFoundException, SQLException {
		//모듈 DB 데이터 가져오기
		String userid = principal.getName();		
		//해더
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userid);
		model.addAttribute("headerVO", headerVO);
		//사이드바
		int sideVO = this.layoutService.mypageSide(userid);
		model.addAttribute("sideVO", sideVO);
		
		
		return "mypage.reviewview";
	}
	
	*/
	
	
	
}
