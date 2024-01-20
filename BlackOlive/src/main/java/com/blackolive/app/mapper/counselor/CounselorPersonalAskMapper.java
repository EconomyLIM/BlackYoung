package com.blackolive.app.mapper.counselor;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.counselor.Criteria;
import com.blackolive.app.domain.counselor.FaqVO;
import com.blackolive.app.domain.counselor.PersonalAskVO;

public interface CounselorPersonalAskMapper {
	// 1:1문의 등록
	int addPersonalAsk(PersonalAskVO askVo, @Param("userId") String userId
									, @Param("askCategoryId") String askCategoryId
									, @Param("orderId") String orderId
									, @Param("personalAskContent") String personalAskContent
									, @Param("personalAskImg") String personalAskImg
									) throws ClassNotFoundException, SQLException;
	// 1:1문의 리스트
	List<PersonalAskVO> getPersonalAskList(@Param("userId") String userId) throws ClassNotFoundException, SQLException;
	// paging
	int getTotalCount(@Param("criteria") Criteria criteria, @Param("userId") String userId );
	// 문의 카테고리 major
	List<String> getmajCategory() throws ClassNotFoundException, SQLException;
	// 문의 카테고리 minor
	List<String> getminCategory( @Param("askCategoryMajor") String askCategoryMajor) throws ClassNotFoundException, SQLException;
	// 문의 키워드
	List<FaqVO> faqKeyword(@Param("faqKeyword") String faqKeyword) throws ClassNotFoundException, SQLException;
	// 주문내역 조회
	List<PersonalAskVO> getOrderList ( @Param("userId") String userId ) throws ClassNotFoundException, SQLException;
	// 주문내역 기간조회
	List<PersonalAskVO> getOrderListWithDate (@Param("userId") String userId, @Param("startdate") String startdate,
			@Param("enddate") String enddate) throws ClassNotFoundException, SQLException;
	// 1:1문의내역 기간조회
	List<PersonalAskVO> getPersonalAskListWithDate(@Param("userId") String userId, @Param("startdate") String startdate,
																		@Param("enddate") String enddate) throws ClassNotFoundException, SQLException;
}
