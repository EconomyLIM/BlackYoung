package com.blackolive.app.service.adminpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.adminpage.BuyInfoDTO;
import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.domain.head.CategoryMidDTO;
import com.blackolive.app.domain.head.CategorySmallDTO;
import com.blackolive.app.mapper.adminpage.AdminPageIndexMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminPageRestServiceImpl implements AdminPageRestService{
	
	@Autowired
	private AdminPageIndexMapper adminPageMapper;

	// 대분류 카테고리 갖고오는 작업
	@Override
	public List<CategoryLargeDTO> getLargeCategoryService(int categoryTotalId) {
		
		log.info("AdminPageRestServiceImpl getLargeCategoryService call...");
		return this.adminPageMapper.getLargeCategory(categoryTotalId);
	} // getLargeCategoryService

	// 중분류 카테고리 갖고오는 작업
	@Override
	public List<CategoryMidDTO> getMidCategory(String categoryLargeId) {
		log.info("AdminPageRestServiceImpl getMidCategory call...");
		return this.adminPageMapper.getMidCategory(categoryLargeId);
	} // getMidCategory

	//  소분류 카테고리 갖고오는 작업
	@Override
	public List<CategorySmallDTO> getSmallCategory(String categoryMidId) {
		log.info("AdminPageRestServiceImpl getSmallCategory call...");
		return this.adminPageMapper.getSmallCategory(categoryMidId);
	}

	// 구매정보 갖고오는 작업
	@Override
	public List<BuyInfoDTO> getBuyInfoService(int buyinfoCategory) {
		log.info("AdminPageRestServiceImpl getBuyInfoService call...");
		return this.adminPageMapper.getBuyInfo(buyinfoCategory);
	}

} // class
