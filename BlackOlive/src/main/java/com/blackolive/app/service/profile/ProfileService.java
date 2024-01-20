package com.blackolive.app.service.profile;

import java.sql.SQLException;
import java.util.List;


import com.blackolive.app.domain.profile.InterestCategoryVO;
import com.blackolive.app.domain.profile.ProfileVO;
import com.blackolive.app.domain.profile.SkinTroubleVO;

public interface ProfileService {
	
	public ProfileVO getprofileservice(String userid) throws ClassNotFoundException, SQLException;
	
	public List<InterestCategoryVO> getinterestcategoryservice(String userid) throws ClassNotFoundException, SQLException;
	
	public List<SkinTroubleVO> getskintroubleservice(String userid) throws ClassNotFoundException, SQLException;
	
	public int updateprofileservice(String userid,
			String nickname,
			String profileContent,
			 String skintoneId, 
			 String skintypeId,
			 String profileImg ) throws ClassNotFoundException, SQLException;
		
	public int deleteinterestcategoryservice(String userid) throws ClassNotFoundException, SQLException;
	
	public int deleteskintroubleservice(String userid) throws ClassNotFoundException, SQLException;
	
	public int insertprofileservice( String userid,
			String nickname,
			 String profileContent,
			 String skintoneId, 
			 String skintypeId,
			 String profileImg ) throws ClassNotFoundException, SQLException;
	
	public int insertinterestcategoryservice(String userid, List<String> userprofileInterestId ) throws ClassNotFoundException, SQLException;
	
	public int insertskintroubleservice(String userid, List<String> userprofileSkintroubleId ) throws ClassNotFoundException, SQLException;

	
}
