package com.blackolive.app.service.productdetail;

import java.util.List;

import org.springframework.stereotype.Service;

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
import com.blackolive.app.mapper.head.HeadMapper;
import com.blackolive.app.mapper.productdetail.ProductDetailMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ProductDetailServiceImpl implements ProductDetailService{

	private HeadMapper headMapper;
	private ProductDetailMapper productMapper;
	
	@Override
	public AllCategoryDTO getTotalCategoryService(String productDisplayId) {
		log.info("ProductDetailServiceImpl getTotalCategoryService call...");
		
		return this.headMapper.getTotalCategory(productDisplayId);
	} // getTotalCategoryService

	@Override
	public List<ProductDetailDTO> getProductService(String productDisplayId) {
		log.info("ProductDetailServiceImpl getProductService call...");
		
		return this.productMapper.getProduct(productDisplayId);
	} // getProductService

	// ============================ 현재 상품의 프로모션 갖고오기 ==============================
	@Override
	public List<ProductPromotionDTO> getProductPromotionService(String productDisplayId) {
		log.info("ProductDetailServiceImpl getProductPromotionService call...");
		
		return this.productMapper.getProductPromotion(productDisplayId);
	} // getProductPromotionService

	// ============================ 현재 상품의 이미지 갖고오기 ==============================
	@Override
	public List<ProductDetailIMGDTO> getProductDisplayImgService(String productDisplayId) {
		log.info("ProductDetailServiceImpl getProductPromotionService call...");
		
		return this.productMapper.getProductDisplayImg(productDisplayId);
	} // getProductPromotionService

	// ============================ 해당 상품의 설명 이미지 갖고오기 ==============================
	@Override
	public List<ProductDetailExplainIMGDTO> getProductDisplayExplainImgService(String productDisplayId) {
		log.info("ProductDetailServiceImpl getProductDisplayExplainImgService call...");
		
		return this.productMapper.getProductDisplayExplainImg(productDisplayId);
	} // getProductDisplayExplainImgService

	// ============================ 해당 상품의 브랜드 정보 갖고오기 ==============================
	@Override
	public ProductDetailBrandDTO getProductBrandInfoSerivce(String productDisplayId) {
		log.info("ProductDetailServiceImpl getProductDisplayExplainImgService call...");
		
		return this.productMapper.getProductBrandInfo(productDisplayId);
	} // getProductBrandInfoSerivce
	
	// ============================ 해당 상품의 구매 정보 갖고오기 ==============================
	@Override
	public List<ProductBuyinfoDTO> getProductBuyInfoService(String productDisplayId) {
		log.info("ProductDetailServiceImpl getProductBuyInfoService call...");
		
		return this.productMapper.getProductBuyInfo(productDisplayId);
	} // getProductBuyInfoService
	
	// ============================ 해당 상품의 구매 정보 갖고오기 ==============================
	@Override
	public List<QnAListDTO> getProductQnaService(String productDisplayId, int currentPage, int perPage) {
		log.info("ProductDetailServiceImpl getProductQnaService call...");
		
		int start = (currentPage -1) * perPage + 1;
		int end = start + perPage -1 ;
		
		return this.productMapper.getProductQna(productDisplayId, start, end);
	} // getProductQnaService

	// ============================ 해당 상품의 뷰 기록 저장 ==============================
	@Override
	public void insertProductViewSerivce(String largeId, String productDisplayId) {
		log.info("ProductDetailServiceImpl insertProductViewSerivce call...");
		
		this.productMapper.insertProductView(largeId, productDisplayId);
	}

	// ============================ 해당 상품의 QnA 레코드 수 ==============================
	@Override
	public int getQnaTotalRecordsService(String productDisplayId) {
		log.info("ProductDetailServiceImpl getQnaTotalRecordsService call...");
		
		return this.productMapper.getQnaTotalRecords(productDisplayId);
	} // getQnaTotalRecordsService

	// ============================ 해당 상품의 QnA 페이지 수 ==============================
	@Override
	public int getQnATotalPagesService(String productDisplayId) {
		log.info("ProductDetailServiceImpl getQnATotalPages call...");
		return this.productMapper.getQnATotalPages(productDisplayId);
	}

	// 해당 상품의 증정품 가져오기
	@Override
	public GiftDTO getGiftService(String productDisplayId) {
		log.info("증정품 서비스...");
		return this.productMapper.getGift(productDisplayId);
	}

	@Override
	public ProductContainer cookieService(String productDisplayId) {
		// TODO Auto-generated method stub
		return this.productMapper.cookie(productDisplayId);
	}

	@Override
	public ProductDetailDTO getOneProduct(String productDisplayId) {
		return this.productMapper.selectOneProduct(productDisplayId);
	} 
	
	

} // class
