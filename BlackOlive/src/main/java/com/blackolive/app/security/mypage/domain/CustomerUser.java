package com.blackolive.app.security.mypage.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.blackolive.app.domain.login.MemberVO;

import lombok.Getter;

@Getter
public class CustomerUser extends User {
	
	public CustomerUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		// TODO Auto-generated constructor stub
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -3943237324301013255L;
	
	private MemberVO member;
	
	
	public CustomerUser(MemberVO vo) {
		super(vo.getUserId(),
				vo.getUserPassword(), 
				 // List<AuthVO>  -> 
	            //                    Collection<? extends GrantedAuthority> authorities
	             vo.getAuthority().stream().map( 
	            		 auth->new SimpleGrantedAuthority( auth.getAuthority() ) ).collect( Collectors.toList() ));
		
		this.member = vo;//로그인할 때의 회원 정보를 담음
			
		
	}

}
