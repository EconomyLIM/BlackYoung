package com.blackolive.app.mapper.basket;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Qualifier;

import com.blackolive.app.domain.basket.BasketDTO;

public interface BasketMapper {
	//장바구니 불러오기
	List<BasketDTO> basket(@Param("quickyn") String quickyn, @Param("userId") String userId);
	//장바구니 수량 변경
	int update(@Param("quickyn") String quickyn, @Param("userId")String userId,@Param("productCnt")int productCnt,@Param("productId")String productId);
	// 장바구니 삭제
	int delete(@Param("quickyn") String quickyn, @Param("userId")String userId,@Param("productId")String productId);
	// 장바구니 수량 체크
	List<Integer> basketCnt(@Param("userId") String userId);
	// 장바구니 아이템 중복 체크
	int check(@Param("userId")String userId, @Param("productId") String productId, @Param("quickyn") String quickyn);
	// 장바구니 추가
	int add(@Param("userId")String userId, @Param("productId") String productId, @Param("quickyn") String quickyn, @Param("productCnt")int productCnt);
}
