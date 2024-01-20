package com.blackolive.app.mapper.mypage;

import java.sql.SQLException;
import java.util.List;

import com.blackolive.app.domain.mypage.ReviewVO;

public interface MypageReviewMapper {
	
	//일반리뷰 목록
	public List<ReviewVO> mypagereviewList(String userid) throws ClassNotFoundException, SQLException;	
	
	//한달사용리뷰 목록
	public List<ReviewVO> mypagereviewmonthList(String userid) throws ClassNotFoundException, SQLException;
	
	//일반리뷰 개수
	public int mypagereviewCount(String userid) throws ClassNotFoundException, SQLException;
	
	//한달사용 개수
	public int mypagereviewmonthCount(String userid) throws ClassNotFoundException, SQLException;
	
	//누적리뷰 작성 개수
	public int mypagereviewWriteCount(String userid) throws ClassNotFoundException, SQLException;
		
	//작성한 리뷰 목록
	public List<ReviewVO> mypagereviewWriteList(String userid) throws ClassNotFoundException, SQLException;
	
	//************************
	//	ajax 처리 mapper
	//*************************	
	
	//리뷰 작성 
	
	//한달사용 리뷰 작성
	
	//리뷰 수정
	
	//리뷰 보기

}
