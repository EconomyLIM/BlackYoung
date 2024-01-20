package com.blackolive.app.mapper.productList;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.blackolive.app.domain.head.CategoryLargeDTO;
import com.blackolive.app.domain.head.CategoryMidDTO;
import com.blackolive.app.domain.head.CategorySmallDTO;
import com.blackolive.app.domain.productList.BrandDTO;
import com.blackolive.app.domain.productList.CurrentCategoryInfoDTO;
import com.blackolive.app.domain.productList.CurrentCategoryNameDTO;
import com.blackolive.app.domain.productList.ProductContainer;

public interface ProductListMapper {

	// 중분류 카테고리를 선택할 시 상위 카테고리 갖고오기
	public List<CategoryLargeDTO> getCategoryLarge (@Param("midId") int midId);

	// 중분류 카테고리 선택할 시 하위 분류 카테고리 갖고오기
	public List<CategorySmallDTO> getCategorySmall(@Param("midId") int midId);

	// 소분류 카테고리를 선택할 시 중위 카테고리 갖고오기
	public List<CategoryMidDTO> getCategoryMid(@Param("largeId") int largeId);


	// ===================== 공통 =====================
	// 총 레코드 수 갖고오는 작업
	public int getTotalRecords( @Param("group") int group, @Param("id")String id, @Param("brandId")String brandId[]);

	// 총 페이지 수 갖고오는 작업
	public int getTotalPages( @Param("group")int group, @Param("perPage")int perPage, @Param("id")String id, @Param("brandId")String brandId[]);

	// 선택한 카테고리를 팔고 있는 브랜드를 갖고오는 작업
	public List<BrandDTO> getBrandList( @Param("group") int group,  @Param("id")String id);

	// 선택한 카테고리의 상품 리스트 갖고오는 작업 + 선택브랜드만 갖고오는 작업 예정
	public List<ProductContainer> getProductList(
			@Param("group") int group,
			@Param("id") String id,
			@Param("sort") String sort,
			@Param("brandId") String[] brandId,
			@Param("currentPage") int currentPage,
			@Param("perPage") int perPage,
			@Param("begin") int begin,
			@Param("end") int end,
			@Param("userId") String userId
			);

	// 선택한 카테고리 이름과 현재 id 갖고오는 작업
	public CurrentCategoryInfoDTO getCurrentCategoryInfo (@Param("midId") String midId);

	// 현재 선택한 카테고리 이름을 갖고오는 작업
	public CurrentCategoryNameDTO getCurrentCategoryName (@Param("group") int group, @Param("id")String id);

	// 좋아요 버튼을 누르면 데이터에 추가하는 작업
	public boolean addProductLike( @Param("userId") String userId,  @Param("productDisplayId")String productDisplayId);

	// 좋아요 버튼을 한번 더 누르면 데이터에 삭제하는 작업
	public boolean removeProductLike( @Param("userId") String userId, @Param("productDisplayId")String productDisplayId);

	// 좋아요 상태 확인
	public String isProductLiked( @Param("userId") String userId,  @Param("productDisplayId")String productDisplayId);
	
	// 그 카테고리에 많이 본 상품아이디 20개 갖고오는 작업 getTopviewProductId
	public List<String> getTopviewProductId (@Param("largeId") String largeId);
	
	// 상품 아이디를 가지고 상품 정보 객체 갖고오기 getTopviewProduct
	public List<ProductContainer> getTopviewProduct (@Param("productDisplayIds")List<String> productDisplayIds, String userId);

	//브랜드 좋아요 관련
	// 좋아요 버튼을 누르면 데이터에 추가하는 작업
	public boolean addBrandLike( @Param("userId") String userId,  @Param("brandId")String brandId);

		// 좋아요 버튼을 한번 더 누르면 데이터에 삭제하는 작업
	public boolean removeBrandLike( @Param("userId") String userId, @Param("brandId")String brandId);

		// 좋아요 상태 확인
	public String isBrandLiked( @Param("userId") String userId,  @Param("brandId")String brandId);
	
} // interface
