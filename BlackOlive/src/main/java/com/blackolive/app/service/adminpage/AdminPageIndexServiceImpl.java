package com.blackolive.app.service.adminpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.blackolive.app.domain.adminpage.BuyInfoDTO;
import com.blackolive.app.domain.adminpage.OrderRegisterDTO;
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
import com.blackolive.app.mapper.adminpage.AdminPageIndexMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminPageIndexServiceImpl implements AdminPageIndexService{
	
	@Autowired
	private AdminPageIndexMapper adminPageIndexMapper;
	
	/*
	 * @Autowired private PlatformTransactionManager transactionManager;
	 */

	// ============ 월별 판매량 구하기 =================
	@Override
	public List<SalesPerMonthDTO> getSalesPerMonthService(String brandId) {
		
		log.info("AdminPageIndexServiceImpl getSalesPerMonthService call..");
		
		return this.adminPageIndexMapper.getSalesPerMonth(brandId);
	}

	@Override
	public List<SalesPerDayDTO> getSalesPerDayService(String brandId) {
		
		log.info("AdminPageIndexServiceImpl getSalesPerMonthService call..");
		
		return this.adminPageIndexMapper.getSalesPerDay(brandId);
	}

	@Override
	public int getproductIdSeqService() {
		log.info("AdminPageIndexServiceImpl getproductIdSeqService call..");
		return this.adminPageIndexMapper.getproductIdSeq();
	}

	// 상품 표시 데이터 삽입
	@Override
	@Transactional
	public int insertProductDisplayService(ProductDisplayDTO productDisplay, List<ProductDTO> product) {
		
		int rowCnt = this.adminPageIndexMapper.insertProductDisplay(productDisplay);
		
		int productRowCnt = this.adminPageIndexMapper.insertProduct(product);
		return rowCnt;
	}

	@Override
	@Transactional
	public int insertProduct(List<ProductDTO> product) {
		
		return this.adminPageIndexMapper.insertProduct(product);
	}

	@Override
	public int insertProductDisplayImg(ProductDisplayImgDTO productDisplayImgDTO) {
		
		return this.adminPageIndexMapper.insertProductDisplayImg(productDisplayImgDTO);
	}

	@Override
	public int insertProductDisplayInfoImgs(List<ProductDisplayInfoDTO> displayInfoDTOs) {
		
		return this.adminPageIndexMapper.insertProductDisplayInfoImgs(displayInfoDTOs);
	}

	@Override
	public int insertProductImgs(List<ProductImgDTO> productImgDTOs) {

		return this.adminPageIndexMapper.insertProductImgs(productImgDTOs);
	}

	@Override
	public int productSeq() {
		return this.adminPageIndexMapper.productSeq();
	}

	@Override
	public int insertPromotion(OrderRegisterDTO orderRegisterDTO, String productDisplayId) {
		
//		TransactionStatus transactionStatus = transactionManager.getTransaction(new DefaultTransactionDefinition());
		int rowCnt = 0;
		
		try {
			String promotionDiscountId = "pmd"+ this.adminPageIndexMapper.getPromotionDiscountSeq();
			PromotionDiscountDTO promotionDiscountDTO = new PromotionDiscountDTO(orderRegisterDTO.getPromotionDiscountPrice()
					,orderRegisterDTO.getPromotionDiscountStartDay()
					,orderRegisterDTO.getPromotionDiscountEndDay());
			int pdrow = this.adminPageIndexMapper.insertDiscountPromotion(promotionDiscountId, promotionDiscountDTO);
			
			
			
			String promotionCouponId = "pmc"+ this.adminPageIndexMapper.getPromotionCouponSeq();
			PromotionCouponDTO promotionCouponDTO = new PromotionCouponDTO(
					orderRegisterDTO.getPromotionCouponName()
					, orderRegisterDTO.getPromotionCouponKind()
					, orderRegisterDTO.getPromotionCouponDiscount()
					, orderRegisterDTO.getPromotionCouponStartDay()
					, orderRegisterDTO.getPromotionCouponEndDay());
			int pcrow = this.adminPageIndexMapper.insertCouponPromotion(promotionCouponId, promotionCouponDTO);
				
			
			
			String promotionPresentId = "pmp"+ this.adminPageIndexMapper.getPromotionPresentSeq();
			PromotionPresentDTO promotionPresentDTO = new PromotionPresentDTO(
					orderRegisterDTO.getPromotionPresentKind()
					, orderRegisterDTO.getPromotionPresentName()
					, orderRegisterDTO.getPromotionPresentStartDay()
					, orderRegisterDTO.getPromotionPresentEndDay()
					);
			int pprow = this.adminPageIndexMapper.insertPresentPromotion(promotionPresentId, promotionPresentDTO);
			
			
			
			rowCnt = this.adminPageIndexMapper.insertPromotion(productDisplayId, promotionDiscountId, promotionCouponId, promotionPresentId);
			
//			transactionManager.commit(transactionStatus);
		} catch (Exception e) {
//			 transactionManager.rollback(transactionStatus);
		}

		
		return rowCnt;
	}

	@Override
	public int insertBuyInfo(String productDisplayId, List<BuyInfoDTO> buyInfoDTOs) {
		
		System.err.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.err.println(">>>>>>>>>>>>>>>>>>> productDisplayId: "+ productDisplayId);
		System.err.println(">>>>>>>>>>>>>>>>>>> buyInfoDTOs: "+ buyInfoDTOs.toString());
		
		return this.adminPageIndexMapper.insertBuyInfo(productDisplayId, buyInfoDTOs);
	} 
	

} // class
