package com.blackolive.app.service.adminpage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.adminpage.BuyInfoDTO;
import com.blackolive.app.domain.adminpage.OrderRegisterDTO;
import com.blackolive.app.domain.adminpage.ProductDTO;
import com.blackolive.app.domain.adminpage.ProductDisplayDTO;
import com.blackolive.app.domain.adminpage.ProductDisplayImgDTO;
import com.blackolive.app.domain.adminpage.ProductDisplayInfoDTO;
import com.blackolive.app.domain.adminpage.ProductImgDTO;
import com.blackolive.app.domain.adminpage.SalesPerDayDTO;
import com.blackolive.app.domain.adminpage.SalesPerMonthDTO;

public interface AdminPageIndexService {

	// 월별 판매량 갖고오기 getSalesPerMonth
	public List<SalesPerMonthDTO> getSalesPerMonthService (String brandId);
	
	// 일별 판매금액 갖고오기 getSalesPerDay
	public List<SalesPerDayDTO> getSalesPerDayService(String brandId);
	
	// 상품 표시 id에 쓸 시퀀스 미리 갖고오기
	public int getproductIdSeqService(); 
	
	// 상품 표시 데이터 insert
	public int insertProductDisplayService (ProductDisplayDTO productDisplay, List<ProductDTO> product);
	
	// 상품 데이터 insert
	public int insertProduct(List<ProductDTO> product);
	
	// 상품 표시 이미지 insert
	public int insertProductDisplayImg(ProductDisplayImgDTO productDisplayImgDTO);
	
	// 상품 표시 설명 이미지 insert
	public int insertProductDisplayInfoImgs(List<ProductDisplayInfoDTO> displayInfoDTOs);
	
	public int insertProductImgs(List<ProductImgDTO> productImgDTOs);
	
	public int productSeq();
	
	public int insertPromotion(OrderRegisterDTO orderRegisterDTO, String productDisplayId);
	
	public int insertBuyInfo(String productDisplayId, List<BuyInfoDTO> buyInfoDTOs);
} // interface
