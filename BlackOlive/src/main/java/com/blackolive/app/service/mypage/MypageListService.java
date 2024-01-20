package com.blackolive.app.service.mypage;

import java.sql.SQLException;

import com.blackolive.app.domain.signin.OliveUserDTO;

public interface MypageListService {
	// 회원정보반환
	public OliveUserDTO getUser(String userId) throws ClassNotFoundException, SQLException; 
}
