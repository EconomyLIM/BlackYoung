package com.blackolive.app.service.store;

import java.util.List;

import org.springframework.stereotype.Service;

import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.domain.store.CityDTO;
import com.blackolive.app.domain.store.DistrictDTO;
import com.blackolive.app.domain.store.StoreDTO;
import com.blackolive.app.domain.store.StoreDetailDTO;
import com.blackolive.app.mapper.store.StoreMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {
	
	//@Autowired
	private StoreMapper storeMapper;
	
	@Override
	public List<StoreDTO> getStoreService(String userId) {
		return this.storeMapper.selectAllStore(userId);
	}
	
	@Override
	public List<StoreDTO> getStoreStockService(String[] tcs, String[] pss, String productId, String userId) {
		return this.storeMapper.selectAllStoreStock(tcs, pss, productId, userId);
	}

	@Override
	public List<CityDTO> getCityService() {
		return this.storeMapper.selectAllCity();
	}

	@Override
	public List<DistrictDTO> getDistrictService(String cityId) {
		return this.storeMapper.selectAllDistrict(cityId);
	}

	@Override
	public List<StoreDTO> getStoreService(String[] tcs, String[] pss, String city, String district, String userId) {
		return this.storeMapper.selectStoreList(tcs, pss, city, district, userId);
	}

	//@Transactional(rollbackFor = Exception.class)
	@Override
	public int udpStoreFavorService(String storeId, String userId, int clickCheck) {
		int rowCount = 0;
		
		this.storeMapper.updateStoreFavorite(storeId, clickCheck);
		
		if(clickCheck == 1) {
			rowCount = this.storeMapper.insertInterestShop(userId, storeId);
		} else {
			rowCount = this.storeMapper.deleteInterestShop(userId, storeId);
		}
		
		return rowCount;
	}

	@Override
	public List<StoreDTO> getInterestShopService(String[] tcs, String[] pss, String userId) {
		return this.storeMapper.selectInterestShop(tcs, pss, userId);
	}

	@Override
	public List<StoreDTO> getStoreService(String[] tcs, String[] pss, String keyword, String userId) {
		return this.storeMapper.selectStoreKeyword(tcs, pss, keyword, userId);
	}

	@Override
	public List<ProductContainer> getProductNameList(String keyword) {
		return this.storeMapper.selectProductName(keyword);
	}

	@Override
	public StoreDetailDTO getStoreDetail(String storeId) {
		return this.storeMapper.selectOneStoreDetail(storeId);
	}

	@Override
	public List<ProductContainer> getStoreBestProduct(int userAge, int userGender, String categoryLargeId) {
		return this.storeMapper.selectStoreBestProduct(userAge, userGender, categoryLargeId);
	}
}
