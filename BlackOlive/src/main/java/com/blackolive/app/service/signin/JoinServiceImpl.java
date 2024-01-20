package com.blackolive.app.service.signin;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blackolive.app.domain.signin.OliveUserDTO;
import com.blackolive.app.mapper.signin.JoinMapper;

@Service
public class JoinServiceImpl implements JoinService{

	@Autowired
	private JoinMapper joinMapper;
	
	@Override
	public OliveUserDTO getJoinCheck(String userTel) throws ClassNotFoundException, SQLException {
		return this.joinMapper.joinCheck(userTel);
	}

	@Override
	public OliveUserDTO getAlreadyUser(OliveUserDTO userDto) throws ClassNotFoundException, SQLException {
		return this.joinMapper.alreadyUser(userDto);
	}

	@Override
	public OliveUserDTO getVerifyOk() throws SQLException, ClassNotFoundException {
		return this.joinMapper.verifyOk();
	}

	@Override
	public int idCheck(String userId) throws ClassNotFoundException, SQLException {
		int result = 0;
		result =  this.joinMapper.idCheck(userId);
		return result;
	}

	@Override
	public int insertUser(OliveUserDTO userDto) throws ClassNotFoundException, SQLException {
		return this.joinMapper.join(userDto);
	}

}
