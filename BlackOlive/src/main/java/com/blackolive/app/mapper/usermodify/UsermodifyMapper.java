package com.blackolive.app.mapper.usermodify;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.signin.OliveUserDTO;

public interface UsermodifyMapper {
	//회원정보반환
	public OliveUserDTO getUser( String userId ) throws ClassNotFoundException, SQLException;
	//비밀번호 변경
	public int pwdUpdate( @Param("userPassword") String userPassword, @Param("userId") String userId ) throws ClassNotFoundException, SQLException;
	//회원정보 수정
	public int infoUpdate( OliveUserDTO userDto ) throws ClassNotFoundException, SQLException;
}
