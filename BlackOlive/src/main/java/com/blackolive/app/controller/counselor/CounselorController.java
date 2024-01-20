package com.blackolive.app.controller.counselor;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blackolive.app.domain.counselor.Criteria;
import com.blackolive.app.domain.counselor.FaqVO;
import com.blackolive.app.domain.counselor.PageDTO;
import com.blackolive.app.domain.counselor.PersonalAskVO;
import com.blackolive.app.domain.counselor.noticeVO;
import com.blackolive.app.domain.signin.OliveUserDTO;
import com.blackolive.app.service.counselor.CounselorService;
import com.blackolive.app.service.counselor.PersonalAskService;
import com.blackolive.app.service.mypage.MypageOrderDeliveryService;
import com.blackolive.app.service.usermodify.UsermodifyService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/counselor/*")
public class CounselorController {
	
	@Autowired
	private CounselorService counselorService;
	
	@Autowired
	private UsermodifyService usermodifyService;
	
	@Autowired
	private PersonalAskService personalAskService;
	
	@Autowired
	private MypageOrderDeliveryService orderDeliveryService;
	
	@GetMapping("/faq")
	public String getfaqcontroller(
				@RequestParam(name = "askCategoryMinor", required = false) String askCategoryMinor,
				@RequestParam(name = "askCategoryMajor", required = false) String askCategoryMajor,
				Model model,
				Criteria criteria
			) throws ClassNotFoundException, SQLException {
		int total = 0;
		if (askCategoryMinor == null && askCategoryMajor == null) {
			askCategoryMinor = "TOP10";
			askCategoryMajor = "TOP10";
			criteria.setKeyword("TOP10");
			List<FaqVO> faqVO = this.counselorService.faqlistwithMinorservice(askCategoryMajor, askCategoryMinor, criteria);
			model.addAttribute("faqVO", faqVO);
			total = this.counselorService.getMinorTagTotalservice(askCategoryMajor, askCategoryMinor);
			
		} else if (askCategoryMinor == null || askCategoryMinor == "") {
			List<FaqVO> faqVO = this.counselorService.faqlistwithMajorservice(askCategoryMajor, criteria);
			model.addAttribute("faqVO", faqVO);
			total = this.counselorService.getMajorTagTotalservice(askCategoryMajor);
							
		} else {
			List<FaqVO> faqVO = this.counselorService.faqlistwithMinorservice(askCategoryMajor, askCategoryMinor, criteria);
			model.addAttribute("faqVO", faqVO);
			total = this.counselorService.getMinorTagTotalservice(askCategoryMajor, askCategoryMinor);
			
		}
		log.info(">> model adding..");
		model.addAttribute("askCategoryMajor", askCategoryMajor);
		model.addAttribute("askCategoryMinor", askCategoryMinor);
		
		model.addAttribute("pageMaker", new PageDTO(criteria, total));
		
		log.info(">> model add complete");
		return "counselor.faq";
	}
	
	@GetMapping("/faqlist")
	public String postfaqcontroller(
				@RequestParam("pageNum") int pageNum,
				@RequestParam("amount") int amount,
				@RequestParam("keyword") String keyword,
				Model model				
			) throws ClassNotFoundException, SQLException {
		
		log.info(">> faqlist get ");
		
		Criteria criteria = new Criteria(pageNum, amount, keyword);
		
		model.addAttribute("faqVO", this.counselorService.faqlistsearchwithpagingservice(criteria));
		
		int searchtotal = this.counselorService.getTotalservice(criteria);
		model.addAttribute("searchtotal", searchtotal);
		log.info(">> total add " + searchtotal);
		model.addAttribute("pageMaker", new PageDTO(criteria, searchtotal));
		
		return "counselor.faqlist";
	}
	
	// 1:1문의하기 목록 이동
	@GetMapping("/personalAskList")
	public String personalAskListcontroller( Principal principal, Model model
			, @RequestParam(name = "startDate", required = false) String startdate
			, @RequestParam(name = "endDate", required = false) String enddate
			, String userId, Criteria criteria) throws ClassNotFoundException, SQLException {
		log.info("personalAskListcontroller_GET....");
		userId=principal.getName();
		OliveUserDTO userDto = this.usermodifyService.getUser(userId);
		if (startdate == null) {
			List<PersonalAskVO> myAskList = this.personalAskService.selectPersonalAskList(userId);
			model.addAttribute("myAskList", myAskList);
			int askListCnt = this.personalAskService.getTotal(criteria, userId);
			model.addAttribute("pageMaker", new PageDTO(criteria, askListCnt));
		} else {
			//날짜 조회 
			List<PersonalAskVO> myAskList = this.personalAskService.selectPersonalAskListDate(userId, startdate, enddate);
			model.addAttribute("myAskList", myAskList);
			int askListCnt = this.personalAskService.getTotal(criteria, userId);
			model.addAttribute("pageMaker", new PageDTO(criteria, askListCnt));
		}

		return "counselor.personalAskList";
	}
	

	// 1:1문의하기 등록 이동
	@GetMapping("/personalAsk")
	public String personalAskcontroller( Principal principal, Model model, String userId,
						@RequestParam(name = "startDate", required = false) String startdate,
						@RequestParam(name = "endDate", required = false) String enddate
												) throws ClassNotFoundException, SQLException {
		log.info("personalAskcontroller_GET....");
		userId = principal.getName();
		OliveUserDTO userDto = this.usermodifyService.getUser(userId);

		if (startdate == null) {
			List<PersonalAskVO> myOrderlist = this.personalAskService.selectOrderList(userId); 
			model.addAttribute("myOrderlist", myOrderlist);
			model.addAttribute("userDto", userDto);
		} else {
			//날짜 조회 
			List<PersonalAskVO> myOrderlist = this.personalAskService.selectOrderListDate(userId, startdate, enddate);
			model.addAttribute("myOrderlist", myOrderlist);
			model.addAttribute("userDto", userDto);
		}

		return "counselor.personalAsk";
	}
	
	// 1:1문의 등록
	@PostMapping("/personalAskList")
	public String personalAskUpload( Principal principal, Model model, String userId
												,@RequestParam("askCategoryId") String askCategoryId										
												,@RequestParam(value="orderId", required=false) String orderId
												,@RequestParam("personalAskContent") String personalAskContent												
												,@RequestParam(value="personalAskImg", required=false) String personalAskImg												
												, PersonalAskVO askVo) throws ClassNotFoundException, SQLException {
		log.info("personalAskUpload_POST....");
		log.info("askCategoryId : " +askCategoryId +"orderId : " +orderId);
		//로그인 정보
		userId = principal.getName();
		askVo.setAskCategoryId(askCategoryId);
		askVo.setPersonalAskContent(personalAskContent);
		if ( orderId !=null) {
		askVo.setOrderId(orderId);
		} else {
			askVo.setOrderId(null);
		}
		if(personalAskImg !=null ) {
		askVo.setPersonalAskImg(personalAskImg);
		} else {
			askVo.setPersonalAskImg(null);
		}
		this.personalAskService.insertPersonalAsk(askVo, userId,askCategoryId,orderId,personalAskContent, personalAskImg);
		
		return "redirect:/counselor/personalAskList";
	}
	
	@GetMapping("/notice")
	public String noticecontroller(
			@RequestParam(name = "tabs", required = false) String tabs,
			Model model,
			Criteria criteria
			) throws ClassNotFoundException, SQLException {
		log.debug(">> notice get ");
		String importantNotice = "NO_00000039";
		
		if (tabs == null || tabs.equals("")) {
			List<noticeVO> noticeVO = this.counselorService.getNoticeListservice(criteria);
			model.addAttribute("noticeVO", noticeVO);
			tabs = "전체";
			
		} else {
			
			List<noticeVO> noticeVO = this.counselorService.getNoticewithcategoryservice(criteria, tabs);
			model.addAttribute("noticeVO", noticeVO);
		}
				
		//중요표시 게시글
		noticeVO vo = this.counselorService.getNoticeDetailservice(importantNotice);
		model.addAttribute("importantNotice", vo);
		
		int noticetotal = this.counselorService.noticetotal(criteria);
		model.addAttribute("pageMaker", new PageDTO(criteria, noticetotal));
		model.addAttribute("tabs", tabs);
		
		log.info(">> notice model add");
		
		return "counselor.notice";
	}
	
	@GetMapping("/noticedetail")
	public String noticedetailcontroller(
			@RequestParam("noticeId") String noticeId,	
			Model model,
			Criteria criteria
			) throws ClassNotFoundException, SQLException {
		
		noticeVO notice = this.counselorService.getNoticeDetailservice(noticeId);
		model.addAttribute("notice", notice);
		
		int noticetotal = this.counselorService.noticetotal(criteria);
		model.addAttribute("pageMaker", new PageDTO(criteria, noticetotal));
		
		return "counselor.noticedetail";
	}
	
	
}
