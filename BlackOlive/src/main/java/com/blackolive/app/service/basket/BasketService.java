package com.blackolive.app.service.basket;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.basket.BasketDTO;

public interface BasketService {

	List<BasketDTO> basketService(String quickyn, String userId);
	int updateService(String quickyn, String userId, int productCnt, String productId);
	
	int deleteService(String quickyn, String userId, String productId);
	
	List<Integer> basketcntService(String userId);
	
	// 중복체크
	String checkService(String userId, String productId,  String quickyn);
	// 이미 장바구니에 있는 경우
	
	// 장바구니에 없는 경우
	int addService(String quickyn, String userId, int productCnt, String productId);
}
