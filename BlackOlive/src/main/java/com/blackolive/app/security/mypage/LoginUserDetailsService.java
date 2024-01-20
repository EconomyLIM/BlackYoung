package com.blackolive.app.security.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.blackolive.app.domain.login.MemberVO;
import com.blackolive.app.mapper.login.MemberMapper;
import com.blackolive.app.security.mypage.domain.CustomerUser;

import lombok.extern.log4j.Log4j;

@Component("loginUserDetailsService")
@Log4j
public class LoginUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		log.warn("> Load User By UserName : " + username);
		
		MemberVO vo = this.mapper.login(username);
		log.warn("> Queiried by Membermapper : " + vo);
		return vo == null ? null : new CustomerUser(vo);
	}

}
