package com.blackolive.app.domain.productdetail;

import java.util.List;

import com.blackolive.app.domain.productList.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnAListPageDTO {
	
	private List<QnAListDTO> qnaList;
	private PageDTO qnaPageDTO;

} // class
