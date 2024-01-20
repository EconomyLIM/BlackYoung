package com.blackolive.app.domain.store;

import java.util.Calendar;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
public class StoreDTO {
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

	private String openYN = "N"; // 영업 여부 체크
	private String favYN; // 유저의 관심 매장 체크
	
	private int stockCnt; // 재고 확인
	private String stockCheck; // class속성에 들어갈 값
	private String stockMessage; // css에 뿌릴 메시지

	public StoreDTO(String storeId, String weekday, String saturday, String sunday) {
		this.storeId = storeId;
		this.weekday = weekday;
		this.saturday = saturday;
		this.sunday = sunday;

		// 매장 오픈 여부
		Calendar today = Calendar.getInstance();
		int dayOfWeek = today.get(Calendar.DAY_OF_WEEK);
		String currTime = today.get(Calendar.HOUR_OF_DAY) + ":" + today.get(Calendar.MINUTE);
		String[] times = null;

		if (dayOfWeek == 1) {
			times = sunday.split(" - ");
		} else if (dayOfWeek == 2) {
			times = sunday.split(" - ");
		} else {
			times = weekday.split(" - ");
		}

		if (currTime.compareTo(times[0]) >= 0 && currTime.compareTo(times[1]) < 0)
			this.openYN = "Y";
	}

	public void setStockCnt(int stockCnt) {
		this.stockCnt = stockCnt;
		
		// 매장 재고 여부
		if (stockCnt > 10) {
			this.stockCheck = "3";
			this.stockMessage = "현재재고보유 가능성이 높습니다.";
		} else if (stockCnt > 5) {
			this.stockCheck = "2";
			this.stockMessage = "현재 재고보유 가능성이 있습니다.";
		} else if (stockCnt > 0) {
			this.stockCheck = "1";
			this.stockMessage = "현재 재고보유 가능성이 낮습니다.";
		} else if (stockCnt == 0) {
			this.stockCheck = "0";
			this.stockMessage = "현재 품절입니다.";
		} else {
			this.stockCheck = "0";
			this.stockMessage = "해당상품 미운영 매장입니다.";
		}
	}

}
