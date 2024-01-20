package com.blackolive.app.mapper.mypage;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.mypage.BrandLikeVO;
import com.blackolive.app.domain.mypage.ProductLikeVO;

public interface MypageLikeMapper {
	
	//상품 좋아요 목록 가져오기
	public List<ProductLikeVO> getproductlikeList(String userid) throws ClassNotFoundException, SQLException;
	
	//상품 하나 삭제
	public int deleteproductLike(@Param("userid") String userid, @Param("productDisplayId") String productDisplayId) throws ClassNotFoundException, SQLException;
	
	//상품 전체 삭제
	public int deleteproductLikeAll(String userid) throws ClassNotFoundException, SQLException;
	
	//브랜드 좋아요 목록 가져오기
	public List<BrandLikeVO> getbrandLikeList(String userid) throws ClassNotFoundException, SQLException;
	
	//브랜드 하나 삭제
	public int deletebrandLike(@Param("userid") String userid, @Param("brandId") String brandId) throws ClassNotFoundException, SQLException;
	
	//브랜드 전체 삭제
	public int deletebrandLikeAll(String userid) throws ClassNotFoundException, SQLException;
	
	
}
