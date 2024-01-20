package com.blackolive.app.mapper.profile;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.blackolive.app.domain.profile.InterestCategoryVO;
import com.blackolive.app.domain.profile.ProfileVO;
import com.blackolive.app.domain.profile.SkinTroubleVO;

public interface ProfileMapper {
	
	public ProfileVO getprofile(String userid) throws ClassNotFoundException, SQLException;
	
	public List<InterestCategoryVO> getinterestcategory(String userid) throws ClassNotFoundException, SQLException;
	
	public List<SkinTroubleVO> getskintrouble(String userid) throws ClassNotFoundException, SQLException;
	
	public int updateprofile(@Param("userid") String userid,
			@Param("nickname") String nickname,
			@Param("profileContent") String profileContent,
			@Param("skintoneId") String skintoneId, 
			@Param("skintypeId") String skintypeId,
			@Param("profileImg") String profileImg ) throws ClassNotFoundException, SQLException;
		
	public int deleteinterestcategory(String userid) throws ClassNotFoundException, SQLException;
	
	public int deleteskintrouble(String userid) throws ClassNotFoundException, SQLException;
	
	public int insertprofile(@Param("userid") String userid,
			@Param("nickname") String nickname,
			@Param("profileContent") String profileContent,
			@Param("skintoneId") String skintoneId, 
			@Param("skintypeId") String skintypeId,
			@Param("profileImg") String profileImg ) throws ClassNotFoundException, SQLException;
	
	public int insertinterestcategory(String userid, List<String> userprofileInterestId ) throws ClassNotFoundException, SQLException;
	
	public int insertskintrouble(String userid, List<String> userprofileSkintroubleId ) throws ClassNotFoundException, SQLException;

	

}
