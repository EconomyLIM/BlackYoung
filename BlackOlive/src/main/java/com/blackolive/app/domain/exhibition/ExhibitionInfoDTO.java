package com.blackolive.app.domain.exhibition;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExhibitionInfoDTO {
	
	private String exhibitionId;
	private String exhibitionName;
	private String exhibitionStartDay;
	private String exhibitionEndDay;
	private String exhibitionCategory;

}
