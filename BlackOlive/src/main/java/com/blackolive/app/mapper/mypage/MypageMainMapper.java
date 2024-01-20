package com.blackolive.app.mapper.mypage;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.counselor.PersonalAskVO;
import com.blackolive.app.domain.mypage.DeliveryStatusVO;
import com.blackolive.app.domain.mypage.MypageHeaderVO;
import com.blackolive.app.domain.mypage.ProductQnAVO;



public interface MypageMainMapper {
	
	//마이페이지 해더 정보 가져오기
	public MypageHeaderVO getHeader(String userid) throws ClassNotFoundException, SQLException;
	
	//마이페이지 사이드 정보(리뷰수) 가져오기
	public int getSide(String userid) throws ClassNotFoundException, SQLException;
	
	//마이페이지 주문배송 개수 가져오기
	public DeliveryStatusVO getDeliveryStatus(String userid) throws ClassNotFoundException, SQLException;

	//마이페이지 상품 QnA 목록 가져오기
	public List<ProductQnAVO> getproductQnA(String userid) throws ClassNotFoundException, SQLException;
	
	//마이페이지 상품 QnA 목록 메인 가져오기
	public List<ProductQnAVO> getproductQnAmain(String userid) throws ClassNotFoundException, SQLException;
	
	//마이페이지 상품 QnA 날짜에 따른 목록 가져오기
	public List<ProductQnAVO> getproductQnAwithDate(@Param("userid") String userid,
					@Param("startdate") String startdate,
					@Param("enddate") String enddate) throws ClassNotFoundException, SQLException;
	
	// 마이페이지 1:1문의 목록 가져오기
	public List<PersonalAskVO> getAskList( @Param("userId") String userId ) throws ClassNotFoundException, SQLException;
	
}
