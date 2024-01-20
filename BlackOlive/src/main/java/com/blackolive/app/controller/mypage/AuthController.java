package com.blackolive.app.controller.mypage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/auth/*")
public class AuthController {
	
	@GetMapping("/login")
	public String login(HttpServletRequest request) throws Exception{
		log.info("> AuthController /login");
		String uri = request.getHeader("Referer");
		if (!uri.contains("/login") && !uri.contains("/join")) {
			request.getSession().setAttribute("prevPage", request.getHeader("Referer"));
		}
		return "auth.login";
	}
	
	
	
}
