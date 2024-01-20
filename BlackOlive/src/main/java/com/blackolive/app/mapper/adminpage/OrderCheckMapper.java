package com.blackolive.app.mapper.adminpage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.adminpage.OrderCheckDTO;

public interface OrderCheckMapper {
	
	// 총 페이지 수 구하기
	public int getTotalPages();
	
	// 주문 리스트 갖고오기
	public List<OrderCheckDTO> getOrderList(@Param("begin") int begin, @Param("end") int end, @Param("status") String status);
	
	// 주문접수 > 주문 확인
	public int orderConfirm (@Param("orderId") String[] orderId);

}
