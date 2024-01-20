package com.blackolive.app.security.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component("loginSuccessHandler")
@Log4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub		
		log.warn("> login Success");
		
		List<String> roleNames = new ArrayList<String>();
		
		authentication.getAuthorities().forEach(
				auth->{
					roleNames.add(auth.getAuthority());
					}
				);
		log.warn("role : " + roleNames);
		
		String uri = "/";
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		
		if (prevPage != null) {
			request.getSession().removeAttribute("prevPage");
		}

		// null이 아니라면 강제 인터셉트 당했다는 것
		if (savedRequest != null) {
			uri = savedRequest.getRedirectUrl();

		// ""가 아니라면 직접 로그인 페이지로 접속한 것
		} else if (prevPage != null && !prevPage.equals("")) {
			uri = prevPage;
		}

		// 세 가지 케이스에 따른 URI 주소로 리다이렉트
		response.sendRedirect(uri);
		
		
	}
	
	
	
}
