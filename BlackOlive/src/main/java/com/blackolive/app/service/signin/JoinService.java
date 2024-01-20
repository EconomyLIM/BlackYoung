package com.blackolive.app.service.signin;

import java.sql.SQLException;

import com.blackolive.app.domain.signin.OliveUserDTO;

public interface JoinService {
	//회원가입 여부 체크
	public OliveUserDTO getJoinCheck(String userTel) throws ClassNotFoundException, SQLException;
	//가입된 회원
	public OliveUserDTO getAlreadyUser (OliveUserDTO userDto) throws ClassNotFoundException, SQLException;
	//회원가입 휴대폰인증 완료 
	public OliveUserDTO getVerifyOk() throws SQLException, ClassNotFoundException;
	//아이디 중복체크
	public int idCheck(String userId) throws ClassNotFoundException, SQLException;
	//회원가입
	public int insertUser(OliveUserDTO userDto) throws ClassNotFoundException, SQLException;
}
