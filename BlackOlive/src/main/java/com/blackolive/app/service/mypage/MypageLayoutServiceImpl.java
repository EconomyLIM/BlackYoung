package com.blackolive.app.service.mypage;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.mypage.MypageHeaderVO;
import com.blackolive.app.mapper.mypage.MypageMainMapper;

@Service
public class MypageLayoutServiceImpl implements MypageLayoutService {
	
	@Autowired
	private MypageMainMapper mapper;

	@Override
	public MypageHeaderVO mypageHeader(String id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.getHeader(id);
		
	}

	@Override
	public int mypageSide(String id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.getSide(id);
		
	}
	
	
	
	
	
	
}
