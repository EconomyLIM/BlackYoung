package com.blackolive.app.controller.order;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blackolive.app.domain.order.CouponDTO;
import com.blackolive.app.domain.order.DeliveryDTO;
import com.blackolive.app.service.order.OrderService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/store")	
@AllArgsConstructor
public class OrderAjaxController {
	private OrderService orderService;
	
	@GetMapping("/getDelivery")
	public ResponseEntity<DeliveryDTO> getDelivery(String deliveryId) {
		return new ResponseEntity<>(this.orderService.getDelivery(deliveryId), HttpStatus.OK);
	}
	
	@GetMapping("/getHasCoupon")
	public ResponseEntity<List<CouponDTO>> getHasCoupon(Principal principal) {
		return new ResponseEntity<>(this.orderService.getCoupon(principal.getName()), HttpStatus.OK);
	}
	
	@PostMapping("/getOrderDelivery")
	public ResponseEntity<DeliveryDTO> getOrderDelivery(String orderId) {
		return new ResponseEntity<>(this.orderService.getOrderDelivery(orderId), HttpStatus.OK);
	}
}
