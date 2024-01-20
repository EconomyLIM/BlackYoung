package com.blackolive.app.mapper.counselor;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.counselor.Criteria;
import com.blackolive.app.domain.counselor.FaqVO;



public interface CounselorFaqMapper {
	
	//카테고리로 불러오기 GET방식
	//마이너 카테고리로 불러오기		//카테고리id
	public List<FaqVO> faqlistwithMinor(@Param("askCategoryMajor") String askCategoryMajor, @Param("askCategoryMinor") String askCategoryMinor,@Param("criteria") Criteria criteria) throws ClassNotFoundException, SQLException;
	
	//메이져 카테고리로 불러오기		//카테고리명
	public List<FaqVO> faqlistwithMajor(@Param("askCategoryMajor")String askCategoryMajor, @Param("criteria") Criteria criteria) throws ClassNotFoundException, SQLException;

	//총 페이지 수 불러오기
	public int getTotal(String keyword) throws ClassNotFoundException, SQLException;
	
	//키워드로 검색결과 보기
	public List<FaqVO> faqlistsearchwithpaging(@Param("criteria") Criteria criteria) throws ClassNotFoundException, SQLException;
	
	public int getMinorTagTotal(@Param("askCategoryMajor") String askCategoryMajor, @Param("askCategoryMinor") String askCategoryMinor) throws ClassNotFoundException, SQLException;

	public int getMajorTagTotal(String askCategoryMajor) throws ClassNotFoundException, SQLException;
	
}
