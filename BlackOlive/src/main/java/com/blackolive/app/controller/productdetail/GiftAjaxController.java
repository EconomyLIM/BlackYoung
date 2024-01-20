package com.blackolive.app.controller.productdetail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.blackolive.app.domain.productdetail.GiftDTO;
import com.blackolive.app.domain.productdetail.QnAListPageDTO;
import com.blackolive.app.service.productdetail.ProductDetailService;

@RestController
public class GiftAjaxController {

	@Autowired
	private ProductDetailService productDetailService;
	
	@GetMapping("giftpopup")
	public ResponseEntity<GiftDTO> giftpopup(@RequestParam(value ="productDisplayId")String productDisplayId) {
		
		GiftDTO giftDTO = this.productDetailService.getGiftService(productDisplayId);
		
		return giftDTO != null ? new ResponseEntity<GiftDTO>(giftDTO, HttpStatus.OK) : new ResponseEntity<GiftDTO>(giftDTO, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
