package com.blackolive.app.controller.basket;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.blackolive.app.domain.basket.BasketDTO;
import com.blackolive.app.domain.mypage.MypageHeaderVO;
import com.blackolive.app.domain.productdetail.ProductDetailDTO;
import com.blackolive.app.service.basket.BasketService;
import com.blackolive.app.service.mypage.MypageLayoutService;
import com.blackolive.app.service.productdetail.ProductDetailService;

import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
public class ProductListAjaxController {

	private ProductDetailService productService;
	private BasketService basketService;
	
	@GetMapping("/itemlist")
	public ResponseEntity<List<ProductDetailDTO>> itemList(Authentication authentication, @RequestParam("productDisplayId") String productDisplayId) {
		
		
		// 로그인 됐는지 안됐는지
		if (authentication != null && authentication.isAuthenticated() ) {
				String userId = authentication.getName();
				List<ProductDetailDTO> result = this.productService.getProductService(productDisplayId);
			return ResponseEntity.ok(result);
		} else {
		
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
		}
	}
	
	
}
