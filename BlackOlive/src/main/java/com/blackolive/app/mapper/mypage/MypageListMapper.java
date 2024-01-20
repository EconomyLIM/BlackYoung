package com.blackolive.app.mapper.mypage;

import java.sql.SQLException;

import com.blackolive.app.domain.signin.OliveUserDTO;

public interface MypageListMapper {
	//회원정보반환
	public OliveUserDTO getUser(String userId) throws ClassNotFoundException, SQLException;
}
