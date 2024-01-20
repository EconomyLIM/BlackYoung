package com.blackolive.app.mapper.brandPage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.brandPage.BrandPageDTO;

public interface BrandPageMapper {

	
	
	//브랜드가져오기
	public BrandPageDTO getBrands(@Param("brandId") String brandId);
	// 스킨케어순,마스크팩(대카테고리) 클릭시 가져오기, 인기순, 신상품순, 판매순 클릭시 가져오기   
	public List<BrandPageDTO> getSortBrands(@Param("brandId") String brandId,@Param("dispcatno") String dispcatno
			,@Param("sort") String sort, @Param("numOfItems") int numOfItems);
	//베스트상품 4개(술라이드바용)
	public List<BrandPageDTO> getsellProduct(@Param("brandId") String brandId,@Param("categoryId") String categoryId);
	//리뷰 가져오기 
	public List<BrandPageDTO> getReviews(@Param("brandId") String brandId);
	// 페이지 
	public List<BrandPageDTO> pagingList(String brandId, String sort, String dispcatno, int startRow, int endRow);
	//총페이지
	public int getTotalRecords(String brandId, String sort, String dispcatno);
	
	//유튜브 영상 
	public BrandPageDTO getBrandVideo(@Param("brandId") String brandId);
	
	
    // 프로필 가져오기  	
	// 리뷰 상세내역 가져오기 
}