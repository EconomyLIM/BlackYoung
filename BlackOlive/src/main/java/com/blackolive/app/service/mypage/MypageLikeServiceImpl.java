package com.blackolive.app.service.mypage;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.mypage.BrandLikeVO;
import com.blackolive.app.domain.mypage.ProductLikeVO;
import com.blackolive.app.mapper.mypage.MypageLikeMapper;

@Service
public class MypageLikeServiceImpl implements MypageLikeService {
	
	@Autowired MypageLikeMapper mapper;

	@Override
	public List<ProductLikeVO> productLikeListService(String userid) throws ClassNotFoundException, SQLException {
		
		return this.mapper.getproductlikeList(userid);
	}

	@Override
	public int productLikeDeleteService(String userid, String productDisplayId)
			throws ClassNotFoundException, SQLException {
		
		return this.mapper.deleteproductLike(userid, productDisplayId);
	}

	@Override
	public int productLikeDeleteAllService(String userid) throws ClassNotFoundException, SQLException {
		
		return this.mapper.deleteproductLikeAll(userid);
	}

	@Override
	public List<BrandLikeVO> brandLikeListService(String userid) throws ClassNotFoundException, SQLException {
		
		return this.mapper.getbrandLikeList(userid);
	}

	@Override
	public int brandLikeDeleteService(String userid, String brandId) throws ClassNotFoundException, SQLException {
		
		return this.mapper.deletebrandLike(userid, brandId);
	}

	@Override
	public int brandLikeDeleteAllService(String userid) throws ClassNotFoundException, SQLException {
		
		return this.mapper.deletebrandLikeAll(userid);
	}
	
	
	
}
