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
import org.springframework.web.bind.annotation.ResponseBody;
import com.blackolive.app.domain.basket.BasketDTO;
import com.blackolive.app.domain.mypage.MypageHeaderVO;
import com.blackolive.app.domain.productdetail.ProductDetailDTO;
import com.blackolive.app.service.basket.BasketService;
import com.blackolive.app.service.mypage.MypageLayoutService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor

public class BasketAjaxController {

	
	private BasketService basketService;
	private MypageLayoutService layoutService;
	
	@GetMapping("/basket/update")
	public String basket(@RequestParam(value = "quickyn",defaultValue = "N")String quickyn,
			@RequestParam("productCnt") int productCnt,
            @RequestParam("productId") String productId, Principal principal,
            Model model) throws ClassNotFoundException, SQLException {
		String userId = principal.getName();
		int row = this.basketService.updateService(quickyn, userId, productCnt, productId);
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userId);
		model.addAttribute("headerVO", headerVO);
		List<BasketDTO> list = this.basketService.basketService(quickyn, userId);
		model.addAttribute("list",list);
		return "/basket/basketadd";
	}
	
	@GetMapping("/basket/itemadd")
	@ResponseBody
	public int basket(@RequestParam("productID")String productID, 
			@RequestParam(value = "quickyn",defaultValue = "N")String quickyn,
			@RequestParam(value = "productCnt",defaultValue = "1") int productCnt, Principal principal) {
		String userId = principal.getName();
		return this.basketService.addService(quickyn, userId, productCnt, productID);
	}
	
	@GetMapping("/basketitemadd")
	@ResponseBody
	public ResponseEntity<String> basketitemadd(@RequestParam(value = "quickyn",defaultValue = "N")String quickyn,
			@RequestParam("products")String[] products,
			Principal principal,
            Model model, Authentication authentication) {
		
		if (authentication != null && authentication.isAuthenticated() ) {
			String[] product_id = new String[products.length];
			for (int i = 0; i < products.length; i++) {
				product_id[i] = products[i].split("-")[0];
			}
			
			String row;
			int row2 = 0;
			int cnt;
			String userId = principal.getName();
			for (int i = 0; i < product_id.length; i++) {
				row = this.basketService.checkService(userId, product_id[i], quickyn);
				cnt = Integer.parseInt(products[i].split("-")[1]);
				if (row.equals("Y")) {
					row2 = this.basketService.updateService(quickyn, userId, cnt, product_id[i]);
				}else {
					row2 = this.basketService.addService(quickyn, userId, cnt,product_id[i] );
				}
			}
			
		return ResponseEntity.ok("ok");
	} else {
	
	return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	}
		
		
	}
}
