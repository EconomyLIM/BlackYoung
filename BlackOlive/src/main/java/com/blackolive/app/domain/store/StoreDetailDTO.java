package com.blackolive.app.domain.store;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StoreDetailDTO {
	private String storeId;
	private String districtId;
	private String storeName;
	private String storeTel;
	private String storeAddress;
	private String storeDirection;
	private String storeParking;
	private String storeSignificant;
	private int storeFavorite;
	private double lat;
	private double lng;
	private String weekday;
	private String saturday;
	private String sunday;
	private String holiday;
	
	private String openYN = "N"; // 영업 여부
	private String favYN; // 유저의 관심 매장 체크
	
	private List<StoreCategoryDTO> storeCategory;
	private List<OliveServiceDTO> oliveService;
	private List<StoreThumbnailDTO> storeThumbnail;
	
	public StoreDetailDTO(String storeId, String weekday, String saturday, String sunday) {
		this.storeId = storeId;
		this.weekday = weekday;
		this.saturday = saturday;
		this.sunday = sunday;
		
		// 매장 오픈 여부
		Calendar today = Calendar.getInstance();
		int dayOfWeek = today.get(Calendar.DAY_OF_WEEK);
		String currTime = today.get(Calendar.HOUR_OF_DAY) + ":" + today.get(Calendar.MINUTE);
		String[] times = null;
		
		if(dayOfWeek == 1) {
			times = sunday.split(" - ");
		} else if(dayOfWeek == 2) {
			times = sunday.split(" - ");
		} else {
			times = weekday.split(" - ");
		}
		
		if(currTime.compareTo(times[0]) >= 0 && currTime.compareTo(times[1]) < 0) 
			this.openYN = "Y";
	}
	
	
}
