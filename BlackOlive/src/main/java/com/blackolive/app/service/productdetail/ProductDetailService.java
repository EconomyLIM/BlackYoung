package com.blackolive.app.service.productdetail;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.head.AllCategoryDTO;
import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.domain.productdetail.GiftDTO;
import com.blackolive.app.domain.productdetail.ProductBuyinfoDTO;
import com.blackolive.app.domain.productdetail.ProductDetailBrandDTO;
import com.blackolive.app.domain.productdetail.ProductDetailDTO;
import com.blackolive.app.domain.productdetail.ProductDetailExplainIMGDTO;
import com.blackolive.app.domain.productdetail.ProductDetailIMGDTO;
import com.blackolive.app.domain.productdetail.ProductPromotionDTO;
import com.blackolive.app.domain.productdetail.QnAListDTO;

public interface ProductDetailService {
	
	AllCategoryDTO getTotalCategoryService(String productDisplayId);
	
	List<ProductDetailDTO> getProductService(String productDisplayId);
	
	// 해당 상품의 프로모션 갖고오기 getProductPromotion
	List<ProductPromotionDTO> getProductPromotionService(String productDisplayId);
	
	// 해당 상품의 표시 이미지 갖고오기 getProductDisplayImg
	List<ProductDetailIMGDTO> getProductDisplayImgService(String productDisplayId);
	
	// 해당 상품의 설명 이미지 갖고오기 getProductDisplayExplainImg
	List<ProductDetailExplainIMGDTO> getProductDisplayExplainImgService(String productDisplayId);
	
	// 해당 상품의 브랜드 정보 갖고오기 getProductBrandInfo
	ProductDetailBrandDTO getProductBrandInfoSerivce(String productDisplayId);
	
	// 해당 상품의 구매정보 갖고오기 getProductBuyInfo
	List<ProductBuyinfoDTO> getProductBuyInfoService (String productDisplayId);
	
	// 해당 상품의 QnA 갖고오기 getProductQna
	List<QnAListDTO> getProductQnaService (String productDisplayId, int currentPage, int perPage);
	
	// productView 기록 
	public void insertProductViewSerivce(String largeId, String productDisplayId);
	
	// QnA 레코드 수 갖고오기
	int getQnaTotalRecordsService(String productDisplayId);
	
	// QnA 총 페이지수 갖고오기
	int getQnATotalPagesService(String productDisplayId);
	
	// 해당 상품의 증정품 가져오기
	GiftDTO getGiftService(String productDisplayId);

	// 쿠키용
	ProductContainer cookieService(String productDisplayId);
	
	// 상품 정보 하나 가져오기
	ProductDetailDTO getOneProduct(String productDisplayId);
	
} // interface
