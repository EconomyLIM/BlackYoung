package com.blackolive.app;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.domain.head.CategoryMidDTO;
import com.blackolive.app.domain.head.TotalListDTO;
import com.blackolive.app.service.head.HeadServiceImpl;

public class HeadInterCeptor implements HandlerInterceptor{
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
		System.out.println("HeadInterCeptor preHandle working...");
		/*
		 * HeadServiceImpl headServiceImpl = new HeadServiceImpl();
		 * 
		 * TotalListDTO firstTotalCategory = headServiceImpl.getHeadCategorySerivce(1);
		 * TotalListDTO secondTotalCategory = headServiceImpl.getHeadCategorySerivce(2);
		 * TotalListDTO thirdTotalCategory = headServiceImpl.getHeadCategorySerivce(3);
		 * 
		 * request.setAttribute("firstTotalCategory", firstTotalCategory);
		 * request.setAttribute("secondTotalCategory", secondTotalCategory);
		 * request.setAttribute("thirdTotalCategory", thirdTotalCategory);
		 * 
		 * System.out.println(firstTotalCategory);
		 * System.out.println(secondTotalCategory);
		 * System.out.println(thirdTotalCategory);
		 */
        return true;
    } // preHandle

} // class
