package com.blackolive.app.service.mypage;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.signin.OliveUserDTO;
import com.blackolive.app.mapper.mypage.MypageListMapper;
@Service
public class MypageListServiceImpl implements MypageListService {

	@Autowired
	private MypageListMapper mypageListMapper;
	
	@Override
	public OliveUserDTO getUser(String userId) throws ClassNotFoundException, SQLException {
		return this.mypageListMapper.getUser(userId);
	}

}
