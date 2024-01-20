package com.blackolive.app.service.counselor;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.counselor.Criteria;
import com.blackolive.app.domain.counselor.FaqVO;
import com.blackolive.app.domain.counselor.PersonalAskVO;

public interface PersonalAskService {
	//1:1문의 등록
	int insertPersonalAsk(PersonalAskVO askVo, String userId, String askCategoryId, String orderId, String personalAskContent, String personalAskImg) throws ClassNotFoundException, SQLException;
	//1:1문의 리스트
	List<PersonalAskVO> selectPersonalAskList(String userId) throws ClassNotFoundException, SQLException;
	//paging
	int getTotal(Criteria criteria, String userId) throws ClassNotFoundException, SQLException;
	// 문의 카테고리 대분류
	List<String> selectmajCategory() throws ClassNotFoundException, SQLException;
	// 문의 카테고리 소분류
	List<String> selectminCategory(@Param("askCategoryMajor") String askCategoryMajor) throws ClassNotFoundException, SQLException;
	// 문의 키워드
	List<FaqVO> faqKeyword(String faqKeyword) throws ClassNotFoundException, SQLException;
	//주문내역 조회
	List<PersonalAskVO> selectOrderList (@Param("userId") String userId) throws ClassNotFoundException, SQLException;
	//주문내역 기간조회
	List<PersonalAskVO> selectOrderListDate (@Param("userId") String userId, String startdate, String enddate) throws ClassNotFoundException, SQLException;
	//1:1문의내역 기간조회
	List<PersonalAskVO> selectPersonalAskListDate(@Param("userId") String userId, String startdate, String enddate) throws ClassNotFoundException, SQLException;

}
