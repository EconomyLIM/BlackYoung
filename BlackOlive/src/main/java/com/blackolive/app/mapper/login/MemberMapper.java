package com.blackolive.app.mapper.login;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.login.MemberVO;

public interface MemberMapper {
	
	//회원 + 권한정보 가져오기
	public MemberVO login(@Param("userid") String userid);
	
	
}
