package com.blackolive.app.controller.basket;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blackolive.app.domain.basket.BasketDTO;
import com.blackolive.app.domain.mypage.MypageHeaderVO;
import com.blackolive.app.service.basket.BasketService;
import com.blackolive.app.service.mypage.MypageLayoutService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class BasketController {

	
	private BasketService basketService;
	private MypageLayoutService layoutService;
	
	@RequestMapping("/basket")
	public String basket(HttpServletRequest request, @RequestParam(value = "quickyn",defaultValue = "N")String quickyn,
			 Model model,
			Principal principal) throws ClassNotFoundException, SQLException {
		String userId = principal.getName();
		List<BasketDTO> list = this.basketService.basketService(quickyn, userId);
		HttpSession session = request.getSession();
		List<Integer> cnt = this.basketService.basketcntService(userId);
		MypageHeaderVO headerVO = this.layoutService.mypageHeader(userId);
		model.addAttribute("headerVO", headerVO);
		session.setAttribute("basketlistcnt", cnt);
		model.addAttribute("list",list);
		return "basket.basket";
	}
	@RequestMapping("/basket/delete")
	public String basketdelete(@RequestParam(value = "quickyn",defaultValue = "N")String quickyn,
            @RequestParam("productId") String productId,Principal principal,
            Model model) {
		String userId = principal.getName();
		int row = this.basketService.deleteService(quickyn, userId, productId);
		List<BasketDTO> list = this.basketService.basketService(quickyn, userId);
		model.addAttribute("list",list);
		return "redirect:/basket";
	}
}
