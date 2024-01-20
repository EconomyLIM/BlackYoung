package com.blackolive.app.domain.login;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO implements Serializable {
	

	private static final long serialVersionUID = 6565950242299942638L;
	
	private String userId;			//회원 id
	private String userPassword;	//회원 비밀번호
	private String userName; // 회원 이름
	private String gradeName; //회원 등급
	//권한 정보
	private boolean enabled;
	private List<AuthVO> authority;		//회원 권한
	
	
}
