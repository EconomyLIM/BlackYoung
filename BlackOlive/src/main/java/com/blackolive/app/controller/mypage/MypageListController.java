package com.blackolive.app.controller.mypage;

import java.security.Principal;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blackolive.app.domain.mypage.MypageHeaderVO;
import com.blackolive.app.domain.signin.OliveUserDTO;
import com.blackolive.app.service.mypage.MypageLayoutService;
import com.blackolive.app.service.mypage.MypageListService;

import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/mypage/*")
public class MypageListController {
	
	// 마이페이지 헤더 
	@Autowired
	private MypageLayoutService mypageLayoutService;
	
	@Autowired
	private MypageListService mypageListService;
	
	//회원정보수정 이동
	@GetMapping("/usermodify")
	public String usermodify( Principal principal, Model model) throws ClassNotFoundException, SQLException {
		log.info("usermodify_GET...");
		// 로그인 한 유저 정보
		String userId = principal.getName();
		MypageHeaderVO headerVO = this.mypageLayoutService.mypageHeader(userId);
		OliveUserDTO userDto = this.mypageListService.getUser(userId);
		model.addAttribute("headerVO", headerVO);
		model.addAttribute("userDto",userDto);
		return "mypage.usermodify";
	}
}
