package com.blackolive.app.service.store;

import java.util.List;

import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.domain.store.CityDTO;
import com.blackolive.app.domain.store.DistrictDTO;
import com.blackolive.app.domain.store.StoreDTO;
import com.blackolive.app.domain.store.StoreDetailDTO;

public interface StoreService {
	
	List<StoreDTO> getStoreService(String userId); // 오버로딩
	
	List<StoreDTO> getStoreStockService(String[] tcs, String[] pss, String productId, String userId); // 오버로딩
	
	List<CityDTO> getCityService();
	
	List<DistrictDTO> getDistrictService(String cityId);

	List<StoreDTO> getStoreService(String[] tcs, String[] pss, String city, String district, String userId); // 오버로딩
	
	int udpStoreFavorService(String StoreId, String userId, int clickCheck);

	List<StoreDTO> getInterestShopService(String[] tcs, String[] pss, String userId);

	List<StoreDTO> getStoreService(String[] tcs, String[] pss, String keyword, String userId); // 오버로딩

	List<ProductContainer> getProductNameList(String keyword);

	StoreDetailDTO getStoreDetail(String storeId);

	List<ProductContainer> getStoreBestProduct(int userAge, int userGender, String categoryLargeId);
}
