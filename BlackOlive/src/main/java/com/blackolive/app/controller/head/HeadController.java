package com.blackolive.app.controller.head;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.domain.head.CategoryMidDTO;
import com.blackolive.app.service.head.HeadServiceImpl;
import com.blackolive.app.service.search.SearchService;

@ControllerAdvice
public class HeadController {

	@Autowired
	HeadServiceImpl headServiceImpl;
	@Autowired
	private SearchService searchService;
	
	@ModelAttribute
	public void getCategory(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		
		Map<CategoryLargeDTO, List<CategoryMidDTO>> firstTotalCategory = this.headServiceImpl.getHeadCategorySerivce(1);
		Map<CategoryLargeDTO, List<CategoryMidDTO>> secondTotalCategory = this.headServiceImpl.getHeadCategorySerivce(2);
		Map<CategoryLargeDTO, List<CategoryMidDTO>> thirdTotalCategory = this.headServiceImpl.getHeadCategorySerivce(3);
		List<String> keywords = this.searchService.searchWordService();
		
		
		model.addAttribute("keywords",keywords);
		 model.addAttribute("firstTotalCategory", firstTotalCategory);
		model.addAttribute("secondTotalCategory", secondTotalCategory);
		model.addAttribute("thirdTotalCategory", thirdTotalCategory);
		
		
		//request.setAttribute("firstTotalCategory", firstTotalCategory);
	//request.setAttribute("secondTotalCategory", secondTotalCategory);
	//request.setAttribute("thirdTotalCategory", thirdTotalCategory);
		
	} //getCategory
	
	
} // class
