package com.blackolive.app.domain.adminpage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesPerDayDTO {
	
	private String day;
	private int daylySales;
	
} //class
