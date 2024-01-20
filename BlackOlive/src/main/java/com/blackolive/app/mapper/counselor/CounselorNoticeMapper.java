package com.blackolive.app.mapper.counselor;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.counselor.Criteria;
import com.blackolive.app.domain.counselor.noticeVO;

public interface CounselorNoticeMapper {
	
	public List<noticeVO> getnoticeList(@Param("criteria") Criteria criteria) throws ClassNotFoundException, SQLException;
	
	public List<noticeVO> getnoticewithcategory(@Param("criteria") Criteria criteria , @Param("tabs") String tabs) throws ClassNotFoundException, SQLException;

	public int getnoticetotal(@Param("criteria") Criteria criteria ) throws ClassNotFoundException, SQLException;
	
	public noticeVO getnoticedetail(String noticeId) throws ClassNotFoundException, SQLException;
}
