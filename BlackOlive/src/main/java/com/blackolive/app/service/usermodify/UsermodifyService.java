package com.blackolive.app.service.usermodify;

import java.sql.SQLException;

import com.blackolive.app.domain.signin.OliveUserDTO;

public interface UsermodifyService {
	// 회원정보반환
	public OliveUserDTO getUser(String userId) throws ClassNotFoundException, SQLException;
	// 비밀번호 변경
	public int pwdModify ( String userPassword, String userId ) throws ClassNotFoundException, SQLException;
	// 회원정보 수정
	public int infoModify ( OliveUserDTO userDto ) throws ClassNotFoundException, SQLException;

}
