package com.blackolive.app.service.mypage;

import java.sql.SQLException;

import com.blackolive.app.domain.mypage.MypageHeaderVO;



public interface MypageLayoutService {

	//해더에 필요한 데이터 가져오기 서비스
	public MypageHeaderVO mypageHeader(String id) throws ClassNotFoundException, SQLException;
	
	//사이드바에 필요한 데이터 가져오기 서비스
	public int mypageSide(String id) throws ClassNotFoundException, SQLException;
	
}	
