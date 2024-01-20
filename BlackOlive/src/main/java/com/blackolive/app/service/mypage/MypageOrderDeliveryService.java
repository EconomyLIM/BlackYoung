package com.blackolive.app.service.mypage;

import java.sql.SQLException;
import java.util.List;

import com.blackolive.app.domain.mypage.DeliveryVO;
import com.blackolive.app.domain.mypage.OrderVO;
import com.blackolive.app.domain.mypage.PaymentVO;

public interface MypageOrderDeliveryService {
	
	//주문배송 목록 가져오기 서비스
	public List<OrderVO> orderlistservice(String userid) throws ClassNotFoundException, SQLException;
	
	//주문배송 주문기간 조건
	public List<OrderVO> orderlistservicewithdate(String userid, String startdate, String enddate) throws ClassNotFoundException, SQLException;
		
	//주문배송 주문기간 + 주문유형 조건
	public List<OrderVO> orderlistservicewithcondition(String userid, String startdate, String enddate, String searchType) throws ClassNotFoundException, SQLException;
	
	//주문배송 상세보기
	
	//주문배송 상세정보
	public OrderVO detailorderservice(String orderId) throws ClassNotFoundException, SQLException;
	
	//배송지 정보
	public DeliveryVO deliveryservice(String orderId) throws ClassNotFoundException, SQLException;
	
	//결제 정보
	public PaymentVO paymentservice(String orderId) throws ClassNotFoundException, SQLException;
	
}	
