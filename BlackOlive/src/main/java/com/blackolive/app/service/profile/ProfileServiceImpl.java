package com.blackolive.app.service.profile;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.profile.InterestCategoryVO;
import com.blackolive.app.domain.profile.ProfileVO;
import com.blackolive.app.domain.profile.SkinTroubleVO;
import com.blackolive.app.mapper.profile.ProfileMapper;

@Service
public class ProfileServiceImpl implements ProfileService {
	
	@Autowired
	private ProfileMapper mapper;
	
	@Override
	public ProfileVO getprofileservice(String userid) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.getprofile(userid);
	}

	@Override
	public List<InterestCategoryVO> getinterestcategoryservice(String userid)
			throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.getinterestcategory(userid);
	}

	@Override
	public List<SkinTroubleVO> getskintroubleservice(String userid) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.getskintrouble(userid);
	}

	@Override
	public int updateprofileservice(String userid, String nickname, String profileContent, String skintoneId,
			String skintypeId, String profileImg) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.updateprofile(userid, nickname, profileContent, skintoneId, skintypeId, profileImg);
	}

	@Override
	public int deleteinterestcategoryservice(String userid) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.deleteinterestcategory(userid);
	}

	@Override
	public int deleteskintroubleservice(String userid) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.deleteskintrouble(userid);
	}

	@Override
	public int insertprofileservice(String userid, String nickname, String profileContent, String skintoneId,
			String skintypeId, String profileImg) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.insertprofile(userid, nickname, profileContent, skintoneId, skintypeId, profileImg);
	}

	@Override
	public int insertinterestcategoryservice(String userid, List<String> userprofileInterestId)
			throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.insertinterestcategory(userid, userprofileInterestId);
	}

	@Override
	public int insertskintroubleservice(String userid, List<String> userprofileSkintroubleId)
			throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.insertskintrouble(userid, userprofileSkintroubleId);
	}
	
	
	
}	
