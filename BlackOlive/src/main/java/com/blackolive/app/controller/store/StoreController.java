package com.blackolive.app.controller.store;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blackolive.app.domain.store.CityDTO;
import com.blackolive.app.domain.store.StoreDTO;
import com.blackolive.app.service.store.StoreServiceImpl;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/store")
@AllArgsConstructor
public class StoreController {
	private StoreServiceImpl storeService;
	
	@GetMapping("/getStoreMain")
	public String getStoreMain(Model model, Principal principal) {
		String userId = null;
		if(principal != null) userId = principal.getName();
		
		List<StoreDTO> storeList = storeService.getStoreService(userId);
		List<CityDTO> cityList = storeService.getCityService();
		model.addAttribute("storeList", storeList);
		model.addAttribute("cityList", cityList);
		
		return "store.store";
	}
}
