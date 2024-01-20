package com.blackolive.app.service.order;

import java.util.List;

import com.blackolive.app.controller.order.OrderHandler;
import com.blackolive.app.domain.order.CouponDTO;
import com.blackolive.app.domain.order.DeliveryDTO;
import com.blackolive.app.domain.order.OrderProductContainer;
import com.blackolive.app.domain.order.PaymentDTO;

public interface OrderService {
	// 나의 배송지 리스트
	List<DeliveryDTO> getUserDelivery(String userId);
	
	// 나의 기본 배송지 얻어오기
	DeliveryDTO getDefaultUserDelivery(String userId);

	// 해당 배송지 얻어오기
	DeliveryDTO getDelivery(String deliveryId);

	// 나의 쿠폰 리스트
	List<CouponDTO> getCoupon(String userId);

	// 주문한 상품 정보 얻어오기
	List<OrderProductContainer> getOrderProducts(String[] orderProducts);

	// 주문 서비스
	String orderService(OrderHandler orderHandler);
	
	// 결제 정보 가져오기
	PaymentDTO getPayment(String orderId);
	
	// 주문한 배송 정보 가져오시
	DeliveryDTO getOrderDelivery(String orderId);
	
}
