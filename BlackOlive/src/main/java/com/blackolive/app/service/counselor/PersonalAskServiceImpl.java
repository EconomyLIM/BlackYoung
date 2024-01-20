package com.blackolive.app.service.counselor;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.counselor.Criteria;
import com.blackolive.app.domain.counselor.FaqVO;
import com.blackolive.app.domain.counselor.PersonalAskVO;
import com.blackolive.app.mapper.counselor.CounselorPersonalAskMapper;
@Service
public class PersonalAskServiceImpl implements PersonalAskService {

	@Autowired
	private CounselorPersonalAskMapper personalAskMapper;

	//1:1문의 등록 
	@Override
	public int insertPersonalAsk(PersonalAskVO askVo, String userId, String askCategoryId, String orderId, String personalAskContent, String personalAskImg) throws ClassNotFoundException, SQLException {
		int rowCount = 0;
		try {
			rowCount = this.personalAskMapper.addPersonalAsk(askVo, userId, askCategoryId, orderId, personalAskContent, personalAskImg);
		} catch (Exception e) {
			System.out.println("insertPersonalAsk 오류");
			e.printStackTrace();
		}
		return rowCount;
	}
	
	//1:1문의 리스트
	@Override
	public List<PersonalAskVO> selectPersonalAskList(String userId) throws ClassNotFoundException, SQLException {
		return this.personalAskMapper.getPersonalAskList(userId);
	}
	
	// 문의 카테고리 대분류
	@Override
	public List<String> selectmajCategory() throws ClassNotFoundException, SQLException {
		return this.personalAskMapper.getmajCategory();
	}
	
	// 문의 카테고리 소분류
	@Override
	public List<String> selectminCategory(@Param("askCategoryMajor") String askCategoryMajor) throws ClassNotFoundException, SQLException {
		return this.personalAskMapper.getminCategory(askCategoryMajor);
	}
	
	// faq 키워드 검색
	@Override
	public List<FaqVO> faqKeyword(String faqKeyword) throws ClassNotFoundException, SQLException {
		return this.personalAskMapper.faqKeyword(faqKeyword);
	}
	
	//주문내역 조회
	@Override	
	public List<PersonalAskVO> selectOrderList ( @Param("userId") String userId ) throws ClassNotFoundException, SQLException {
		return this.personalAskMapper.getOrderList(userId);
	}

	@Override
	public int getTotal(Criteria criteria, String userId) throws ClassNotFoundException, SQLException{
		return this.personalAskMapper.getTotalCount(criteria, userId);
	}
	//주문내역 기간조회
	@Override
	public List<PersonalAskVO> selectOrderListDate(String userId, String startdate, String enddate)
			throws ClassNotFoundException, SQLException {
		return this.personalAskMapper.getOrderListWithDate(userId, startdate, enddate);
	}
	//1:1문의내역 기간조회
	@Override
	public List<PersonalAskVO> selectPersonalAskListDate(String userId, String startdate, String enddate)
			throws ClassNotFoundException, SQLException {
		return this.personalAskMapper.getPersonalAskListWithDate(userId, startdate, enddate);
	}

}
