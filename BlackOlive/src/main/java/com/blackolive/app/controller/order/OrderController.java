package com.blackolive.app.controller.order;

import java.security.Principal;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blackolive.app.domain.order.DeliveryDTO;
import com.blackolive.app.domain.order.OrderProductContainer;
import com.blackolive.app.domain.order.PaymentDTO;
import com.blackolive.app.domain.signin.OliveUserDTO;
import com.blackolive.app.service.order.OrderService;
import com.blackolive.app.service.usermodify.UsermodifyService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/store")
@AllArgsConstructor
public class OrderController {
	private OrderService orderService;
	private UsermodifyService usermodifyService;
	
	@GetMapping("/getOrderForm")
	public String getOrderForm(Principal principal, Model model, String[] products, String quickYN, String click) throws ClassNotFoundException, SQLException {
		if(principal == null) return "/auth/login";
		
		String userId = principal.getName();
		List<DeliveryDTO> userDeliveryList = this.orderService.getUserDelivery(userId);
		DeliveryDTO deliveryDTO = this.orderService.getDefaultUserDelivery(userId);
		OliveUserDTO userDto = this.usermodifyService.getUser(userId);
		
		// 주문한 상품 ex) products=pr_00000641-1  <- '-' 분리후 id만 추출
		String[] orderProducts = Arrays.stream(products).map(s -> s.split("-")[0]).toArray(String[]::new);
		
		List<OrderProductContainer> productList = this.orderService.getOrderProducts(orderProducts);
		
		// 주문한 상품 수량 맞춰주기
		Iterator<OrderProductContainer> ir = productList.iterator();
		OrderProductContainer container = null;
		while (ir.hasNext()) {
			container = ir.next();
			for (int i = 0; i < products.length; i++) {
				if(products[i].indexOf(container.getProductId()) != -1) {
					container.setOrderProductCnt(Integer.parseInt(products[i].split("-")[1]));
					break;
				}
			}
		}
		
		model.addAttribute("userDeliveryList", userDeliveryList);
		model.addAttribute("productList", productList);
		model.addAttribute("dto", deliveryDTO);
		model.addAttribute("userDto", userDto);
		model.addAttribute("quickYN", quickYN);
		model.addAttribute("click", click);
		
		return "order.orderForm";
	}
	
	@PostMapping("/getOrderForm")
	public String getOrderForm(Principal principal, OrderHandler orderHandler, Model model) {		
		orderHandler.setUserId(principal.getName());
		String orderId = this.orderService.orderService(orderHandler);
		
		PaymentDTO paymentDTO = this.orderService.getPayment(orderId);
		DeliveryDTO deliveryDTO = this.orderService.getOrderDelivery(orderId);

		
		model.addAttribute("orderId", orderId);
		model.addAttribute("paymentDTO", paymentDTO);
		model.addAttribute("deliveryDTO", deliveryDTO);
		
		return "order.orderComplete";
	}
}
