package com.blackolive.app.service.adminpage;

import java.util.List;

import com.blackolive.app.domain.adminpage.OrderCheckDTO;

public interface OrderCheckService {
	
	// 토탈 페이지수 구하기
	public int getTotalPage();
	
	// 주문 리스트 갖고오기
	public List<OrderCheckDTO> getOrderList(int currentpage, int checkOption);
	
	// 주문접수> 주문확인
	public int orderConfirmService (String[] orderId);

}
