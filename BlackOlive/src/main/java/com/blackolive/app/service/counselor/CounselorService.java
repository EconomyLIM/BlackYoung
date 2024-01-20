package com.blackolive.app.service.counselor;

import java.sql.SQLException;
import java.util.List;

import com.blackolive.app.domain.counselor.Criteria;
import com.blackolive.app.domain.counselor.FaqVO;
import com.blackolive.app.domain.counselor.noticeVO;

public interface CounselorService {

	//faq
	//마이너 카테고리로 불러오기 서비스
	public List<FaqVO> faqlistwithMinorservice(String askCategoryMajor, String askCategoryMinor, Criteria criteria) throws ClassNotFoundException, SQLException;
	
	//메이져 카테고리로 불러오기 서비스
	public List<FaqVO> faqlistwithMajorservice(String askCategoryMajor, Criteria criteria) throws ClassNotFoundException, SQLException;
	
	//검색시 총 페이지 수 불러오기
	public int getTotalservice(Criteria criteria) throws ClassNotFoundException, SQLException;
	
	//키워드로 검색결과 보기
	public List<FaqVO> faqlistsearchwithpagingservice(Criteria criteria) throws ClassNotFoundException, SQLException;
	
	//매이저태그 선택시 총 페이지 수 불러오기
	public int getMajorTagTotalservice(String askCategoryMajor) throws ClassNotFoundException, SQLException;
	
	//마이너태그 선택시 총 페이지 수 불러오기
	public int getMinorTagTotalservice(String askCategoryMajor, String askCategoryMinor) throws ClassNotFoundException, SQLException;

	
	
	
	//공지사항
	//공지사항 목록 가져오기
	public List<noticeVO> getNoticeListservice(Criteria criteria) throws ClassNotFoundException, SQLException;
	
	//공지사항 카테고리별로 가져오기
	public List<noticeVO> getNoticewithcategoryservice(Criteria criteria, String tabs) throws ClassNotFoundException, SQLException;
	
	//공지사항 개수 세기
	public int noticetotal(Criteria criteria) throws ClassNotFoundException, SQLException;
	
	//공지사항 상세보기
	public noticeVO getNoticeDetailservice(String noticeId) throws ClassNotFoundException, SQLException;	
	
}
