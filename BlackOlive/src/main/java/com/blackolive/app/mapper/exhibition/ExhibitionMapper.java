package com.blackolive.app.mapper.exhibition;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.exhibition.BannerNProductDTO;
import com.blackolive.app.domain.exhibition.ExhibitionBannerDTO;
import com.blackolive.app.domain.exhibition.ExhibitionCategoryDTO;
import com.blackolive.app.domain.exhibition.ExhibitionImgDTO;
import com.blackolive.app.domain.exhibition.ExhibitionInfoDTO;
import com.blackolive.app.domain.productList.BrandTopDTO;
import com.blackolive.app.domain.productList.ProductContainer;

public interface ExhibitionMapper {

	// 배너정보 갖고오는 작업 getExhibitionBanner
	public List<ExhibitionBannerDTO> getExhibitionBanner(@Param("exhibitionCategory") int exhibitionCategory) throws SQLException;
	
	// 배너와 상품정보가 같이 있는 배너 갖고오기 getExhibitionBannerNProduct
	public List<BannerNProductDTO> getExhibitionBannerNProduct(@Param("categoryLargeId") String categoryLargeId)throws SQLException;
	
	// ====================== 기획전 상세 페이지 
	
	// 기획전 정보를 갖고오는 작업
	public ExhibitionInfoDTO getExhibitionInfo (@Param("eventId")String eventId) throws SQLException;
	
	// 기획전 사진 갖고오는 작업 getExhibitionImg
	public List<ExhibitionImgDTO> getExhibitionImg(@Param("eventId")String eventId) throws SQLException;
	
	// 기획전 내부카테고리와 상품 리스트 갖고오는 작업
	public List<ExhibitionCategoryDTO> getExhibitionCategory(@Param("eventId")String eventId) throws SQLException;
	
	public List<ProductContainer> getMdRecommend()throws SQLException;
	
	public List<BrandTopDTO> getTopBrand();
	
} // interface
