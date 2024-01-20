package com.blackolive.app.mapper.mypage;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.mypage.DeliveryVO;
import com.blackolive.app.domain.mypage.OrderVO;
import com.blackolive.app.domain.mypage.PaymentVO;

public interface MypageOrderDeliveryMapper {
	
	//주문배송 목록 가져오기
	public List<OrderVO> getOrderList(String userid) throws ClassNotFoundException, SQLException;
	
	//주문 기간을 조건으로 목록 가져오기
	public List<OrderVO> getOrderListwithDate(@Param("userid") String userid,
			@Param("startdate") String startdate,
			@Param("enddate") String enddate
			) throws ClassNotFoundException, SQLException;
	
	//주문 기간 + 구매 유형을 조건으로 목록 가져오기
	public List<OrderVO> getOrderListwithCondition(@Param("userid") String userid,
			@Param("startdate") String startdate,
			@Param("enddate") String enddate,
			@Param("searchType") String searchType
			) throws ClassNotFoundException, SQLException;
	
	
	//주문 상세보기
	public OrderVO getDetailOrder(String orderId) throws ClassNotFoundException, SQLException;
	
	//배송지 정보
	public DeliveryVO getDelivery(String orderId) throws ClassNotFoundException, SQLException;
	
	//결제 정보
	public PaymentVO getPayment(String orderId) throws ClassNotFoundException, SQLException;
	 
	
}
