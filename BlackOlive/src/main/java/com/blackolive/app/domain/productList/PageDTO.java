package com.blackolive.app.domain.productList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageDTO {

	private int currentPage =1;
	private int perPage = 10;
	private int numberOfPageBlock = 10;
	private int totalPages;
	private int start;
	private int end;
	private boolean prev;
	private boolean next;

	public PageDTO(int currentPage, int perPage, int numberOfPageBlock, int totalPages) {

		this.currentPage = currentPage;
		this.perPage = perPage;
		this.numberOfPageBlock = numberOfPageBlock;
		this.totalPages = totalPages;

		// 시작 번호, 끝 번호
		start = (currentPage -1) /numberOfPageBlock * numberOfPageBlock +1 ;
		end= start + numberOfPageBlock -1;         
		end =   end > totalPages ? totalPages : end;

		// 이전 버튼, 다음 버튼
		if( start >= 11 ) prev = true;          

		if( end != totalPages ) next = true;
	} //PageDTO(4)

} // class
