package com.blackolive.app.domain.exhibition;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExhibitionBannerDTO {
	
	private String exhibitionId;
	private String exhibitionBannerImgSrc;
	private String exhibitionBannerSummary;
	private String exhibitionBannerSummary2;
	private String exhibitionBannerKeyword;
	private String exhibitionCategory;

}
