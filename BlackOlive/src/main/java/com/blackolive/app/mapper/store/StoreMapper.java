package com.blackolive.app.mapper.store;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.domain.store.CityDTO;
import com.blackolive.app.domain.store.DistrictDTO;
import com.blackolive.app.domain.store.StoreDTO;
import com.blackolive.app.domain.store.StoreDetailDTO;

public interface StoreMapper {
	
	List<CityDTO> selectAllCity(); // 시,도 리스트
	
	List<DistrictDTO> selectAllDistrict(@Param("cityId") String cityId); // 구 리스트
	
	List<StoreDTO> selectAllStore(@Param("userId") String userId); // 매장 리스트
	
	List<StoreDTO> selectAllStoreStock(@Param("tcs") String[] tcs, @Param("pss") String[] pss, 
			@Param("productId") String productId, @Param("userId") String userId); // 매장 재고 리스트
	
	List<StoreDTO> selectStoreList(@Param("tcs") String[] tcs, @Param("pss") String[] pss
			, @Param("city") String city, @Param("district") String district, @Param("userId") String userId); // 지역으로 검색
	
	int updateStoreFavorite(@Param("storeId") String storeId, @Param("clickCheck") int clickCheck); // 매장 좋아요 수 업데이트
	
	int insertInterestShop(String userId, String storeId); // 관심 매장 추가
	
	int deleteInterestShop(String userId, String storeId);  // 관심 매장 삭제

	List<StoreDTO> selectInterestShop(@Param("tcs") String tcs[], @Param("pss") String pss[], @Param("userId") String userId); // 로그인 시 관심매장 리스트

	List<StoreDTO> selectStoreKeyword(@Param("tcs") String tcs[], @Param("pss") String pss[]
			, @Param("keyword") String keyword, @Param("userId") String userId); // 키워드로 매장 검색

	int selectStoreCnt(); // 검색 된 매장 전체 수

	List<ProductContainer> selectProductName(String keyword); // 해당 키워드 상품 이름 리스트

	StoreDetailDTO selectOneStoreDetail(@Param("storeId") String storeId); // 매장 상세 얻기

	// 매장 베스트 상품 얻어오기
	List<ProductContainer> selectStoreBestProduct(
			@Param("userAge") int userAge
			, @Param("userGender") int userGender
			, @Param("categoryLargeId") String categoryLargeId);
}
