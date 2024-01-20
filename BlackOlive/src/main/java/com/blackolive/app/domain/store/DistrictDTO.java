package com.blackolive.app.domain.store;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DistrictDTO {
	private String districtId;
	private String cityId;
	private String districtName;
}
