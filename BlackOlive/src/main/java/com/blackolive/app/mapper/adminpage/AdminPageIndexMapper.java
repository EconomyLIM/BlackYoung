package com.blackolive.app.mapper.adminpage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.adminpage.BuyInfoDTO;
import com.blackolive.app.domain.adminpage.ProductDTO;
import com.blackolive.app.domain.adminpage.ProductDisplayDTO;
import com.blackolive.app.domain.adminpage.ProductDisplayImgDTO;
import com.blackolive.app.domain.adminpage.ProductDisplayInfoDTO;
import com.blackolive.app.domain.adminpage.ProductImgDTO;
import com.blackolive.app.domain.adminpage.PromotionCouponDTO;
import com.blackolive.app.domain.adminpage.PromotionDiscountDTO;
import com.blackolive.app.domain.adminpage.PromotionPresentDTO;
import com.blackolive.app.domain.adminpage.SalesPerDayDTO;
import com.blackolive.app.domain.adminpage.SalesPerMonthDTO;
import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.domain.head.CategoryMidDTO;
import com.blackolive.app.domain.head.CategorySmallDTO;

public interface AdminPageIndexMapper{
	
	// index페이지와 상품등록 Mapper

	// 월별 판매량 갖고오기 getSalesPerMonth
	public List<SalesPerMonthDTO> getSalesPerMonth(@Param("brandId") String brandId);
	
	// 일별 판매량 갖고오기 getSalesPerday
	public List<SalesPerDayDTO> getSalesPerDay (@Param("brandId") String brandId);
	
	// 상품 표시 id에 쓸 시퀀스 미리 갖고오기
	public int getproductIdSeq(); 
	
	public int productSeq();
	
	
	// 상품 표시 데이터 insert insertProductDisplay
	public int insertProductDisplay (@Param("productDisplay") ProductDisplayDTO productDisplay);
	
	// 상품 데이터 insert
	public int insertProduct(@Param("product") List<ProductDTO> product);
	
	// 상품 표시 이미지 insert
	public int insertProductDisplayImg(@Param("productDisplayImgDTO")ProductDisplayImgDTO productDisplayImgDTO);
	
	// 상품 표시 설명 이미지 insert
	public int insertProductDisplayInfoImgs(@Param("displayInfoDTOs") List<ProductDisplayInfoDTO> displayInfoDTOs);
	
	// 상품 이미지 insert
	public int insertProductImgs(@Param("productImgDTOs") List<ProductImgDTO> productImgDTOs);
	
	public int getPromotionDiscountSeq();
	public int getPromotionCouponSeq();
	public int getPromotionPresentSeq();
	
	// 할인 프로모션 insert
	public int insertDiscountPromotion(@Param("promotionDiscountId") String promotionDiscountId, @Param("promotionDiscountDTO") PromotionDiscountDTO promotionDiscountDTO);
	
	// 쿠폰 프로모션 insert
	public int insertCouponPromotion(@Param("promotionCouponId") String promotionCouponId, @Param("promotionCouponDTO") PromotionCouponDTO promotionCouponDTO);
	
	// 증정 프로모션 insert
	public int insertPresentPromotion(@Param("promotionPresentId") String promotionPresentId, @Param("promotionPresentDTO") PromotionPresentDTO promotionPresentDTO);
	
	// 프로모션 insert
	public int insertPromotion(@Param("productDisplayId") String productDisplayId
			, @Param("promotionDiscountId") String promotionDiscountId
			, @Param("promotionCouponId")String promotionCouponId
			, @Param("promotionPresentId")String promotionPresentId);
	
	// 구매정보 insert
	public int insertBuyInfo(@Param("productDisplayId") String productDisplayId,@Param("buyInfoDTOs") List<BuyInfoDTO> buyInfoDTOs);
	
	// ================= Rest Mapper ======================
	
	// 대분류 카테고리 갖고오는 작업 getLargeCategory
	public List<CategoryLargeDTO> getLargeCategory(@Param("categoryTotalId") int categoryTotalId);
	
	// 중분류 카테고리 갖고오는 작업
	public List<CategoryMidDTO> getMidCategory (@Param("categoryLargeId") String categoryLargeId);
	
	// 소분류 카테고리 갖고오는 작업
	public List<CategorySmallDTO> getSmallCategory (@Param("categoryMidId") String categoryMidId);
	
	
	// 구매 정보 갖고오는 작업 getBuyInfo
	public List<BuyInfoDTO> getBuyInfo (@Param("buyinfoCategory") int buyinfoCategory);
	
	

} //interface
