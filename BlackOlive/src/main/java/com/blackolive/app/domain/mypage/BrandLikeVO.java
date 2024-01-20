package com.blackolive.app.domain.mypage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BrandLikeVO {
	
	private String brandName;			//브랜드명
	private String brandId;				//브랜드id
	private int brandLike;		//브랜드 좋아요 수
	private String brandDisplaySrc;		//브랜드 표시 이미지
	
}
