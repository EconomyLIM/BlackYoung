package com.blackolive.app.service.usermodify;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.signin.OliveUserDTO;
import com.blackolive.app.mapper.usermodify.UsermodifyMapper;

@Service
public class UsermodifyServiceImpl implements UsermodifyService {
	
	@Autowired
	private UsermodifyMapper usermodifyMapper;
	
	//회원정보 반환
	@Override
	public OliveUserDTO getUser(String userId) throws ClassNotFoundException, SQLException {
		return this.usermodifyMapper.getUser(userId);
	}
	
	// 비밀번호 변경
	@Override
	public int pwdModify( String userPassword, String userId ) throws ClassNotFoundException, SQLException {
		int result = this.usermodifyMapper.pwdUpdate(userPassword, userId);
		return result > 0 ? 1 : 0;
	}
	// 회원정보 수정
	@Override
	public int infoModify(OliveUserDTO userDto) throws ClassNotFoundException, SQLException {
		int result = this.usermodifyMapper.infoUpdate(userDto);
		return result > 0 ? 1 : 0;
	}

}
