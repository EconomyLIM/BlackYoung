package com.blackolive.app.service.search;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.head.CategorySmallDTO;
import com.blackolive.app.domain.productList.BrandDTO;
import com.blackolive.app.domain.productList.ProductContainer;

public interface SearchService {
	
	// 검색된 상품 리스트
		public List<ProductContainer> searchProductListService(
				String[] searchWord,
				String categorySmallId,
				String sort,
				String[] brandId,
				int currentPage,
				int perPage,
				String userId,
				int minPrice,
				int maxPrice,
				String quickyn
				);
		// 검색된 상품의 스몰 카테고리
		public List<CategorySmallDTO> searchCategorySmallService(String[] searchWord);
		// 검색된 상품의 브랜드 목록
		public List<BrandDTO> searchBrandListService(String[] searchWord, String categorySmallId);
		// 검색된 상품의 총 레코드 수
		public int searchTotalRecordsService(String[] searchWord, 
				String categorySmallId, 
				String brandId[],
				int minPrice,
				int maxPrice);
		// 검색된 상품의 페이지 수
		public int searchTotalPagesService(String[] searchWord, 
				String categorySmallId, 
				int perPage, 
				String brandId[],
				int minPrice,
				int maxPrice);
		
		// 검색 ajax
		public List<ProductContainer>searchAjaxService(String word);
		// 브랜드 검색 ajax
		public BrandDTO searchBrandAjaxService(String word);
		
		// 검색어 조회
		public List<String> searchWordService();
		// 검색어 중복 확인
		public int checkSearchWordService(String searchWord);
		//검색어 저장/업뎃
		public int addSearchWordService(String searchWord);

}
