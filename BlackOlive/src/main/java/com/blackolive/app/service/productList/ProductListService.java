package com.blackolive.app.service.productList;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.domain.head.CategoryMidDTO;
import com.blackolive.app.domain.head.CategorySmallDTO;
import com.blackolive.app.domain.productList.BrandDTO;
import com.blackolive.app.domain.productList.CurrentCategoryInfoDTO;
import com.blackolive.app.domain.productList.CurrentCategoryNameDTO;
import com.blackolive.app.domain.productList.ProductContainer;

public interface ProductListService {

	// 중분류 카테고리를 선택할 시 상위 카테고리 갖고오기
	public List<CategoryLargeDTO> getCategoryLargeService (String midId);

	// 중분류 카테고리 선택할 시 하위 분류 카테고리 갖고오기
	public List<CategorySmallDTO> getCategorySmallService(String midId);

	// 소분류 카테고리를 선택할 시 중위 카테고리 갖고오기
	public List<CategoryMidDTO> getCategoryMidService(String largeId);

	//  총 레코드 수 갖고오기
	public int getTotalRecordsSerivce(int group, String id, String[] brandId);

	// 총 페이지 수 갖고오기
	public int getTotalPagesService(int group, int numberPerPage, String id, String[] brandId);

	// 브랜드 갖고오기 
	public List<BrandDTO> getBrandList(int group, String id);

	// 상품 리스트 갖고오기
	public List<ProductContainer> getProductListService(int group, String id, String sort, String[] brandId, int currentPage, int perPage, String userId);

	// 현재 선택한 카테고리의 정보(상위정보도) 갖고오는 작업
	public CurrentCategoryInfoDTO getCurrentCategoryInfoSerivce(String midId);

	// 현재 선택한 카테고리의 이름을 갖고오는 작업
	public CurrentCategoryNameDTO getCurrentCategoryNameService (int group, String id);

	// 좋아요 버튼을 누르면 데이터에 추가하는 작업
	public boolean addProductLikeSerivce(String userId, String productDisplayId);

	// 좋아요 버튼을 한번 더 누르면 데이터에 삭제하는 작업
	public boolean removeProductLikeSerivce(String userId, String productDisplayId);

	// 좋아요 상태 확인
	public boolean isProductLikedSerivce(String userId, String productDisplayId);
	
	// 브랜드 좋아요
	// 좋아요 버튼을 누르면 데이터에 추가하는 작업
	public boolean addBrandLikeSerivce(String userId, String brandId);

		// 좋아요 버튼을 한번 더 누르면 데이터에 삭제하는 작업
	public boolean removeBrandLikeSerivce(String userId, String brandId);

		// 좋아요 상태 확인
	public boolean isBrandLikedSerivce(String userId, String brandId);
	
	// 상품 아이디를 가지고 상품 정보 객체 갖고오기
	public List<ProductContainer> getTopviewProductService(String largeId, String userId);
	


} // interface
