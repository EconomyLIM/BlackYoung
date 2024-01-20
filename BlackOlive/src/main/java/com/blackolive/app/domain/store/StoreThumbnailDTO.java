package com.blackolive.app.domain.store;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreThumbnailDTO {
	private String thumbnailId;
	private String storeId;
	private String thumbnailSrc;
}
