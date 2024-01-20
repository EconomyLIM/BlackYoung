package com.blackolive.app.service.order;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blackolive.app.controller.order.OrderHandler;
import com.blackolive.app.domain.order.CouponDTO;
import com.blackolive.app.domain.order.DeliveryDTO;
import com.blackolive.app.domain.order.OrderProductContainer;
import com.blackolive.app.domain.order.PaymentDTO;
import com.blackolive.app.mapper.order.OrderMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	private OrderMapper orderMapper;

	@Override
	public List<DeliveryDTO> getUserDelivery(String userId) {
		return this.orderMapper.selectUserDelivery(userId);
	}

	@Override
	public DeliveryDTO getDefaultUserDelivery(String userId) {
		return this.orderMapper.selectOneUserDelivery(userId);
	}

	@Override
	public DeliveryDTO getDelivery(String deliveryId) {
		return this.orderMapper.selectOneDelivery(deliveryId);
	}

	@Override
	public List<CouponDTO> getCoupon(String userId) {
		return this.orderMapper.selectUserCoupon(userId);
	}

	@Override
	public List<OrderProductContainer> getOrderProducts(String[] orderProducts) {
		return this.orderMapper.selectOrderProducts(orderProducts);
	}

	@Override
	@Transactional
	public String orderService(OrderHandler orderHandler) {
		this.orderMapper.insertOrder(orderHandler);
		this.orderMapper.insertPayment(orderHandler);

		String[] product_id = orderHandler.getProducts();
		String[] temp = null;
		String cat_m_id = null;

		for (int i = 0; i < product_id.length; i++) {
			temp = product_id[i].split("-");
			cat_m_id = this.orderMapper.selectCatMID(temp[0]);
			this.orderMapper.updateProStuck(temp[0], Integer.parseInt(temp[1]));
			if (orderHandler.getClick().equals("장바구니")) {
				this.orderMapper.deleteCart(orderHandler.getUserId(), temp[0]);
			}
			this.orderMapper.insertOrderProduct(temp[0], Integer.parseInt(temp[1]), cat_m_id);
		}

		if (orderHandler.getQuickYN().equals("Y")) {
			this.orderMapper.insertToday(orderHandler);
		}

		/*
		 * if (orderHandler.getPickupYN().equals("Y")) {
		 * this.orderMapper.insertPickup(orderHandler); }
		 */

		String orderId = this.orderMapper.selectCurrOrderID();
		
		return orderId;
	}

	@Override
	public PaymentDTO getPayment(String orderId) {
		return this.orderMapper.selectOnePayment(orderId);
	}

	@Override
	public DeliveryDTO getOrderDelivery(String orderId) {
		return this.orderMapper.selectOrderDelivery(orderId);
	}
	
	

}
