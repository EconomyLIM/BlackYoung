package com.blackolive.app.service.search;

import java.util.List;

import org.springframework.stereotype.Service;

import com.blackolive.app.domain.head.CategorySmallDTO;
import com.blackolive.app.domain.productList.BrandDTO;
import com.blackolive.app.domain.productList.ProductContainer;
import com.blackolive.app.mapper.search.SearchMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService {

	private SearchMapper searchMapper;
	
	@Override
	public List<ProductContainer> searchProductListService(String[] searchWord, String categorySmallId, String sort,
			String[] brandId, int currentPage, int perPage, String userId, int minPrice,
			int maxPrice, String quickyn) {
		
		int begin = (currentPage -1) * perPage + 1;
		int end = begin + perPage -1 ;
		if (userId == null) {
			userId ="0";
		}//if
		
		return this.searchMapper.searchProductList(searchWord, categorySmallId, sort, brandId, currentPage, perPage, begin, end, userId, minPrice, maxPrice,quickyn);
	}

	@Override
	public List<CategorySmallDTO> searchCategorySmallService(String[] searchWord) {
		// TODO Auto-generated method stub
		return this.searchMapper.searchCategorySmall(searchWord);
	}

	@Override
	public List<BrandDTO> searchBrandListService(String[] searchWord, String categorySmallId) {
		// TODO Auto-generated method stub
		return this.searchMapper.searchBrandList(searchWord, categorySmallId);
	}

	@Override
	public int searchTotalRecordsService(String[] searchWord, String categorySmallId, String[] brandId, int minPrice,
			int maxPrice) {
		// TODO Auto-generated method stub
		return this.searchMapper.searchTotalRecords(searchWord, categorySmallId, brandId, minPrice, maxPrice);
	}

	@Override
	public int searchTotalPagesService(String[] searchWord, String categorySmallId, int perPage, String[] brandId,
			int minPrice, int maxPrice) {
		// TODO Auto-generated method stub
		return this.searchMapper.searchTotalPages(searchWord, categorySmallId, perPage, brandId, minPrice, maxPrice);
	}

	@Override
	public List<ProductContainer> searchAjaxService(String word) {
		
		List<ProductContainer> list = this.searchMapper.searchAjax(word);
		for (int i = 0; i < list.size(); i++) {
			ProductContainer item = list.get(i);
			 String fieldToSearch = item.getProductDisplayName();
           // 만약 리스트의 항목에 해당 단어가 포함되어 있다면 변경
			 if (fieldToSearch != null && fieldToSearch.contains(word)) {
			        fieldToSearch = fieldToSearch.replaceAll(word, "<span>" + word + "</span>");
			        item.setProductDisplayName(fieldToSearch); // 변경된 문자열로 필드를 대체
			        list.set(i, item); // 변경된 객체를 리스트에 다시 설정
			    }
       }
		
		return list;
	}

	@Override
	public BrandDTO searchBrandAjaxService(String word) {
		
		return this.searchMapper.searchBrandAjax(word);
	}

	@Override
	public List<String> searchWordService() {
		// TODO Auto-generated method stub
		return this.searchMapper.searchWord();
	}

	@Override
	public int checkSearchWordService(String searchWord) {
		// TODO Auto-generated method stub
		return this.searchMapper.checkSearchWord(searchWord);
	}

	@Override
	public int addSearchWordService(String searchWord) {
		if (checkSearchWordService(searchWord) == 1) {
			return this.searchMapper.updateSearchWord(searchWord);
		}else {
			return this.searchMapper.insertSearchWord(searchWord);
		}
		
	}

}
