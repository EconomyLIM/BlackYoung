package com.blackolive.app.service.exhibition;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.exhibition.BannerNProductDTO;
import com.blackolive.app.domain.exhibition.ExhibitionBannerDTO;
import com.blackolive.app.domain.exhibition.ExhibitionCategoryDTO;
import com.blackolive.app.domain.exhibition.ExhibitionImgDTO;
import com.blackolive.app.domain.exhibition.ExhibitionInfoDTO;
import com.blackolive.app.domain.productList.BrandTopDTO;
import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.domain.signin.OliveUserDTO;
import com.blackolive.app.mapper.exhibition.ExhibitionMapper;
import com.blackolive.app.mapper.mainPage.MainPageMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ExhibitionServiceImpl implements ExhibitionService{

	@Autowired
	private ExhibitionMapper exhibitionMapper;
	@Autowired
	private MainPageMapper mainPageMapper;
	
	// 배너 정보 갖고오는 작업
	@Override
	public List<ExhibitionBannerDTO> getExhibitionBannerService(int exhibitionCategory) {
		
		log.info("ExhibitionServiceImpl getExhibitionBannerService call...");
		
		try {
			return this.exhibitionMapper.getExhibitionBanner(exhibitionCategory);
		} catch (SQLException e) {
			log.error("ExhibitionServiceImpl getExhibitionBannerService error...");
			e.printStackTrace();
		} // try catch
		
		return null;
	} // getExhibitionBannerService

	// 배너와 상품이 붙어있는 배너 갖고오는 작업
	@Override
	public List<BannerNProductDTO> getExhibitionBannerNProduct(String categoryLargeId) {
		
		log.info("ExhibitionServiceImpl getExhibitionBannerService call...");
		
		try {
			return this.exhibitionMapper.getExhibitionBannerNProduct(categoryLargeId);
		} catch (SQLException e) {
			log.error("ExhibitionServiceImpl getExhibitionBannerService SQLException error...");
			e.printStackTrace();
		} catch (Exception e) {
			log.error("ExhibitionServiceImpl getExhibitionBannerService Exception error...");
			e.printStackTrace();
		} // try_catch
		return null;
	} // getExhibitionBannerNProduct

	// 기획전 정보 갖고오는 작업
	@Override
	public ExhibitionInfoDTO getExhibitionInfoService(String eventId) {
		log.info("ExhibitionServiceImpl getExhibitionInfoService call...");
		
		try {
			return this.exhibitionMapper.getExhibitionInfo(eventId);
			
		} catch (SQLException e) {
			log.error("ExhibitionServiceImpl getExhibitionInfoService Exception error...");
			e.printStackTrace();
			
		}catch (Exception e) {
			log.error("ExhibitionServiceImpl getExhibitionInfoService Exception error...");
			e.printStackTrace();
			
		} // try_catch
		return null;
	} // getExhibitionInfoService

	// 기획전 사진 갖고오는 작업
	@Override
	public List<ExhibitionImgDTO> getExhibitionImgService(String eventId) {
		log.info("ExhibitionServiceImpl getExhibitionImgService call...");
		try {
			return this.exhibitionMapper.getExhibitionImg(eventId);
		} catch (SQLException e) {
			log.error("ExhibitionServiceImpl getExhibitionBannerService Exception error...");
			e.printStackTrace();
		} catch (Exception e) {
			log.error("ExhibitionServiceImpl getExhibitionImgService Exception error...");
			e.printStackTrace();
			
		} // try_catch
		return null;
	}

	// 기획전 카테고리, 상품 갖고오는 작업
	@Override
	public List<ExhibitionCategoryDTO> getExhibitionCategoryService(String eventId) {
		log.info("ExhibitionServiceImpl getExhibitionImgService call...");
		try {
			
			return this.exhibitionMapper.getExhibitionCategory(eventId);
			
		}catch (SQLException e) {
			log.error("ExhibitionServiceImpl getExhibitionCategoryService Exception error...");
			e.printStackTrace();
		} catch (Exception e) {
			log.error("ExhibitionServiceImpl getExhibitionCategoryService Exception error...");
			e.printStackTrace();
		} // try_catch
		return null;
	}

	@Override
	public List<ProductContainer> getMdRecommendService() {
		// TODO Auto-generated method stub
		try {
			return this.exhibitionMapper.getMdRecommend();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<BrandTopDTO> getTopBrandService() {
		// TODO Auto-generated method stub
		System.out.println("--------------------"+this.exhibitionMapper.getTopBrand().toString());
		return this.exhibitionMapper.getTopBrand();
	}

	@Override
	public OliveUserDTO selectUserInfoService(String userId) {
		// TODO Auto-generated method stub
		if (this.mainPageMapper.selectUserInfo(userId) == null) {
			return this.mainPageMapper.selectUserInfo("user1");
		}else {
			return this.mainPageMapper.selectUserInfo(userId);
		}
		
		
	}

	@Override
	public List<String> similarUserService(String userId) {
		OliveUserDTO userDTO = selectUserInfoService(userId);
		LocalDate localDate = userDTO.getUserBirth();
		LocalDate beforeBirth2 = localDate.minusYears(2);
		LocalDate afterBirth2 = localDate.plusYears(8);
		Date sqlBefore = Date.valueOf(beforeBirth2);
		Date sqlAfter = Date.valueOf(afterBirth2);
		return this.mainPageMapper.similarUser(userDTO.getUserGender(), userDTO.getSkintoneId(), userDTO.getSkintypeId(), sqlBefore, sqlAfter);
	}

	@Override
	public List<String> similarProductService(String userId) {
		
		return this.mainPageMapper.similarProduct(similarUserService(userId));
	}

	@Override
	public List<ProductContainer> similardisplService(String userId) {
		
		return this.mainPageMapper.similardispl(similarProductService(userId));
	}

	

	@Override
	public int checkUserVIewService(String userId, String categoryMidId) {
			int check = this.mainPageMapper.checkUserVIew(userId, categoryMidId);
			
			if (check == 0) {
				return this.mainPageMapper.insertUserView(userId, categoryMidId);
			}else {
				return this.mainPageMapper.updateUserView(userId, categoryMidId);
			}
			
	}

	

	@Override
	public List<ProductContainer> selectUserVIewService(String userId, List<String> categoryMidId) {
		
		return this.mainPageMapper.selectUserVIew(userId, selectcategoryMidIdService(userId));
	}

	@Override
	public List<String> selectcategoryMidIdService(String userId) {
		// TODO Auto-generated method stub
		try {
			if (this.mainPageMapper.selectcategoryMidId(userId) == null || (this.mainPageMapper.selectcategoryMidId(userId).size() == 0)) {
				return this.mainPageMapper.selectcategoryMidId("user1");
			}else {
				return this.mainPageMapper.selectcategoryMidId(userId);
			}
		} catch (Exception e) {
			return this.mainPageMapper.selectcategoryMidId("user1");
		}
		
		
		
	}

} // class
