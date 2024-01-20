package com.blackolive.app.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.controller.order.OrderHandler;
import com.blackolive.app.domain.order.CouponDTO;
import com.blackolive.app.domain.order.DeliveryDTO;
import com.blackolive.app.domain.order.OrderProductContainer;
import com.blackolive.app.domain.order.PaymentDTO;

public interface OrderMapper {
	// 나의 배송지 리스트
	List<DeliveryDTO> selectUserDelivery(@Param("userId") String userId);
	
	// 나의 기본 배송지 얻어오기
	DeliveryDTO selectOneUserDelivery(@Param("userId") String userId);

	// 해당 배송지 얻어오기
	DeliveryDTO selectOneDelivery(@Param("deliveryId") String deliveryId);

	// 나의 쿠폰 리스트 얻어오기
	List<CouponDTO> selectUserCoupon(@Param("userId") String userId);

	// 주문한 상품 정보 얻기
	List<OrderProductContainer> selectOrderProducts(@Param("orderProducts") String[] orderProducts);

	// 주문 인서트
	int insertOrder(@Param("orderHandler") OrderHandler orderHandler);
	
	// 결제 인서트
	int insertPayment(@Param("orderHandler") OrderHandler orderHandler);
	
	// 주문 상품 인서트
	int insertOrderProduct(@Param("product_id") String product_id, @Param("product_cnt") int product_cnt, @Param("cat_m_id") String cat_m_id);
	
	// 주문 상품 중분류 아이디 얻어오기
	String selectCatMID(@Param("productId") String productId);
	
	// 오늘 드림 인서트
	int insertToday(@Param("orderHandler") OrderHandler orderHandler);
	
	// 픽업 인서트
	int insertPickup(@Param("orderHandler") OrderHandler orderHandler);
	
	// 현재 주문 id 얻기
	String selectCurrOrderID();
	
	// 선물하기 주문 인서트
	int insertGiftOrder(@Param("orderHandler") OrderHandler orderHandler);
	
	// 선물하기 결제 인서트
	int inserGiftPay(@Param("orderHandler") OrderHandler orderHandler);
	
	// 선물 테이블 인서트
	int insertGift(@Param("orderHandler") OrderHandler orderHandler);
	
	// 재고 업데이트
	int updateProStuck(@Param("pro_id") String pro_id, @Param("cnt") int cnt);
	
	// 장바구니 삭제
	int deleteCart(@Param("user_id") String user_id, @Param("pro_id") String pro_id);
	
	// cj 포인트 사용 내역 인서트
	//int insertCJPoint(Connection conn, String user_id, String p_content, String p_state);
	
	// 재고 확인 여부
	int selectIsProStock(@Param("product_id") String product_id);
	
	// 결제 정보 가지고 오기
	PaymentDTO selectOnePayment(@Param("order_id") String order_id);
	
	// 주문한 배송 정보 가지고 오기
	DeliveryDTO selectOrderDelivery(@Param("orderId") String orderId);
	
	// 유저 포인트 업데이트
	int updateUserPoint(String userㅑd, int point);
}
