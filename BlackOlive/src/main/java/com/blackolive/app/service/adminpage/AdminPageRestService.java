package com.blackolive.app.service.adminpage;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.adminpage.BuyInfoDTO;
import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.domain.head.CategoryMidDTO;
import com.blackolive.app.domain.head.CategorySmallDTO;

public interface AdminPageRestService {

	// 대분류 카테고리 갖고오는 작업 getLargeCategoryService
	public List<CategoryLargeDTO> getLargeCategoryService(int categoryTotalId);
	
	// 중분류 카테고리 갖고오는 작업
	public List<CategoryMidDTO> getMidCategory (String categoryLargeId);
		
	// 소분류 카테고리 갖고오는 작업
	public List<CategorySmallDTO> getSmallCategory (String categoryMidId);
	
	// 구매 정보 갖고오는 작업 getBuyInfo
	public List<BuyInfoDTO> getBuyInfoService(int buyinfoCategory);
} // interface
