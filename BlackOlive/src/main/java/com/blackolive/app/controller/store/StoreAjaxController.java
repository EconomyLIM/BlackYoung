package com.blackolive.app.controller.store;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.domain.store.DistrictDTO;
import com.blackolive.app.domain.store.StoreDTO;
import com.blackolive.app.domain.store.StoreDetailDTO;
import com.blackolive.app.service.head.HeadService;
import com.blackolive.app.service.store.StoreService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/store")
@AllArgsConstructor
public class StoreAjaxController {
	private StoreService storeService;
	private HeadService headService;
	
	@GetMapping("/getDistrict/{city_id}")
	public ResponseEntity<List<DistrictDTO>> getDistrict(@PathVariable String city_id) {
		return new ResponseEntity<>(this.storeService.getDistrictService(city_id), HttpStatus.OK);
	}
	
	@GetMapping("/getStoreAl")
	public ResponseEntity<List<StoreDTO>> getStoreAll(Principal principal) {
		String userId = null;
		if (principal != null) {
			userId = principal.getName();
		}
		return new ResponseEntity<>(this.storeService.getStoreService(userId), HttpStatus.OK);
	}
	
	@GetMapping("/getStoreStockList/{productId}")
	public ResponseEntity<List<StoreDTO>> getStoreStockList(String[] tcs, String[] pss, @PathVariable String productId, Principal principal) {
		String userId = null;
		if (principal != null) {
			userId = principal.getName();
		}
		return new ResponseEntity<>(this.storeService.getStoreStockService(tcs, pss, productId, userId), HttpStatus.OK);
	}
	
	@GetMapping("/getStoreList")
	public ResponseEntity<List<StoreDTO>> getDistrict(String[] tcs, String[] pss, String city, String district, Principal principal) {
		String userId = null;
		if (principal != null) {
			userId = principal.getName();
		}
		return new ResponseEntity<>(this.storeService.getStoreService(tcs, pss, city, district, userId), HttpStatus.OK);
	}
	
	@GetMapping("/getStoreKeyword")
	public ResponseEntity<List<StoreDTO>> getStoreKeyword(String[] tcs, String[] pss, String keyword, Principal principal) {
		String userId = null;
		if (principal != null) {
			userId = principal.getName();
		}
		return new ResponseEntity<>(this.storeService.getStoreService(tcs, pss, keyword, userId), HttpStatus.OK);
	}
	
	@PostMapping("/setStoreFavorite")
	public ResponseEntity<String> setFavorite(String storeId, Integer clickCheck, Principal principal) throws Exception {
		return this.storeService.udpStoreFavorService(storeId, principal.getName(), clickCheck) == 1
				? new ResponseEntity<>("success", HttpStatus.OK) 
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping("/getInterestShopList")
	public ResponseEntity<List<StoreDTO>> getInterestShop(String[] tcs, String[] pss, Principal principal) {
		return new ResponseEntity<>(this.storeService.getInterestShopService(tcs, pss, principal.getName()), HttpStatus.OK);
	}
	
	@GetMapping("/getProductName/{keyword}")
	public ResponseEntity<List<ProductContainer>> getProductName(@PathVariable String keyword) {
		return new ResponseEntity<>(this.storeService.getProductNameList(keyword), HttpStatus.OK);
	}
	
	@GetMapping("/getStoreDetail")
	public ResponseEntity<StoreDetailDTO> getStoreDetail(String storeId) {
		return new ResponseEntity<>(this.storeService.getStoreDetail(storeId), HttpStatus.OK);
	}
	
	@GetMapping("/getCategoryLarge") 
	public ResponseEntity<List<CategoryLargeDTO>> getCategoryLarge() throws SQLException {
		return new ResponseEntity<>(this.headService.getRankingCatLargeName(""), HttpStatus.OK);
	}
	
	@GetMapping("/getStoreBestProduct")
	public ResponseEntity<List<ProductContainer>> getStoreBestProduct(int userAge, int userGender, String categoryLargeId) {
		return new ResponseEntity<>(this.storeService.getStoreBestProduct(userAge, userGender, categoryLargeId), HttpStatus.OK);
	}
}
