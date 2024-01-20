package com.blackolive.app.mapper.productdetail;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.domain.productdetail.GiftDTO;
import com.blackolive.app.domain.productdetail.ProductBuyinfoDTO;
import com.blackolive.app.domain.productdetail.ProductDetailBrandDTO;
import com.blackolive.app.domain.productdetail.ProductDetailDTO;
import com.blackolive.app.domain.productdetail.ProductDetailExplainIMGDTO;
import com.blackolive.app.domain.productdetail.ProductDetailIMGDTO;
import com.blackolive.app.domain.productdetail.ProductPromotionDTO;
import com.blackolive.app.domain.productdetail.QnAListDTO;

public interface ProductDetailMapper {
	
	// 중분류 카테고리를 선택할 시 상위 카테고리 갖고오기
	public List<ProductDetailDTO> getProduct (@Param("productDisplayId") String productDisplayId);
	
	// 해당 상품의 프로모션 갖고오기 getProductPromotion
	public List<ProductPromotionDTO> getProductPromotion(@Param("productDisplayId") String productDisplayId);
	
	// 해당 상품의 표시 이미지 갖고오기 getProductDisplayImg
	public List<ProductDetailIMGDTO> getProductDisplayImg(@Param("productDisplayId") String productDisplayId);
	
	// 해당 상품의 설명 이미지 갖고오기 getProductDisplayExplainImg
	public List<ProductDetailExplainIMGDTO> getProductDisplayExplainImg (@Param("productDisplayId") String productDisplayId);
	
	// 해당 상품의 브랜드 정보 갖고오기 getProductBrandInfo
	public ProductDetailBrandDTO getProductBrandInfo(@Param("productDisplayId") String productDisplayId);
	
	// 해당 상품의 구매정보 갖고오기 getProductBuyInfo
	public List<ProductBuyinfoDTO> getProductBuyInfo (@Param("productDisplayId") String productDisplayId);
	
	// 해당 상품의 QnA 갖고오기 getProductQna
	public List<QnAListDTO> getProductQna (@Param("productDisplayId") String productDisplayId, @Param("start") int start, @Param("end") int end);
	
	// QnA 총 레코드수 갖고오기
	public int getQnaTotalRecords(@Param("productDisplayId") String productDisplayId);
	
	// QnA 총 페이지수 갖고오기
	public int getQnATotalPages(@Param("productDisplayId") String productDisplayId);
	
	// productView 기록 insertProductView
	public void insertProductView(@Param("largeId")String largeId, @Param("productDisplayId") String productDisplayId);
	
	// 증정품 가져오기
	GiftDTO getGift(@Param("productDisplayId")String productDisplayId);
	
	// 쿠키용
	ProductContainer cookie(@Param("productDisplayId")String productDisplayId);
	
	// 상품 하나 가져오기
	public ProductDetailDTO selectOneProduct(@Param("productDisplayId")String productDisplayId);
	
} // interface
