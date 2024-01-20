package com.blackolive.app.controller.exhibition;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blackolive.app.domain.exhibition.BannerNProductDTO;
import com.blackolive.app.domain.exhibition.ExhibitionBannerDTO;
import com.blackolive.app.domain.exhibition.ExhibitionCategoryDTO;
import com.blackolive.app.domain.exhibition.ExhibitionImgDTO;
import com.blackolive.app.domain.exhibition.ExhibitionInfoDTO;
import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.service.exhibition.ExhibitionService;
import com.blackolive.app.service.head.HeadService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ExhibitionController {

	@Autowired
	private HeadService headService;
	
	@Autowired
	private ExhibitionService exhibitionService;
	
	@GetMapping("/store/getExhibition")
	public String getExhibition(@RequestParam(value = "eventId",  required = false)String eventId
			, Model model) {
		
		
		// 기획전 정보 갖고오는 작업
		ExhibitionInfoDTO exhibitionInfoDTO = this.exhibitionService.getExhibitionInfoService(eventId);
		model.addAttribute("exhibitionInfoDTO", exhibitionInfoDTO);
		
		// 기획전 사진 갖고오는 작업
		List<ExhibitionImgDTO> exhibitionImg = this.exhibitionService.getExhibitionImgService(eventId);
		model.addAttribute("exhibitionImg", exhibitionImg);
		
		// 기획전 카테고리, 상품 갖고오는 작업
		List<ExhibitionCategoryDTO> exhibitionCategory = this.exhibitionService.getExhibitionCategoryService(eventId);
		model.addAttribute("exhibitionCategory", exhibitionCategory);
		
		if (eventId.equals("le_00000001")) {
			return "exhibition.luxeedit";
		}
		
		
		return "exhibition.exhibition";
	}//
	
	@GetMapping("/store/main/getExhibition")
	public String getMainExhibition(Model model, @RequestParam(value = "exdispCapno",  required = false)String exString) throws SQLException {
		
		log.info("ExhibitionController /store/main/getExhibition call...");
		
		System.out.println(exString);
		
		// 상단에 있는 대분류 카테고리 갖고오는 작업 
		List<CategoryLargeDTO> largeCategoryList = this.headService.getRankingCatLargeName(null);
		model.addAttribute("largeCategoryList", largeCategoryList);
		
		// WeeklySpecial 갖고오는 작업
		List<ExhibitionBannerDTO> weeklySpecialBanner = this.exhibitionService.getExhibitionBannerService(2);
		model.addAttribute("weeklySpecialBanner", weeklySpecialBanner);
		
		// 배너&상품 갖고오는 작업
		List<BannerNProductDTO> bannerNProduct = this.exhibitionService.getExhibitionBannerNProduct(exString);
		model.addAttribute("bannerNProduct", bannerNProduct);
		
		return "exhibition.mainexhibition";
	}
	
} // class
