package com.blackolive.app.service.mypage;

import java.sql.SQLException;
import java.util.List;

import com.blackolive.app.domain.mypage.BrandLikeVO;
import com.blackolive.app.domain.mypage.ProductLikeVO;

public interface MypageLikeService {
	
	
	//상품 좋아요 목록 서비스
	public List<ProductLikeVO> productLikeListService(String userid) throws ClassNotFoundException, SQLException;	
	
	
	//상품 좋아요 한개 삭제 서비스
	public int productLikeDeleteService(String userid, String productDisplayId) throws ClassNotFoundException, SQLException;
	
	//상품 좋아요 전체 삭제 서비스
	public int productLikeDeleteAllService(String userid) throws ClassNotFoundException, SQLException;
	
	//브랜드 좋아요 목록 서비스
	public List<BrandLikeVO> brandLikeListService(String userid) throws ClassNotFoundException, SQLException;
	
	//브랜드 좋아요 한개 삭제 서비스
	public int brandLikeDeleteService(String userid, String brandId) throws ClassNotFoundException, SQLException;
	
	//브랜드 좋아요 전체 삭제 서비스
	public int brandLikeDeleteAllService(String userid) throws ClassNotFoundException, SQLException;
	
}
