package com.blackolive.app.domain.head;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class TotalListDTO {
	
	private Map<CategoryLargeDTO, List<CategoryMidDTO>> largeList;

} // class
