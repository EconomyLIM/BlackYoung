package com.blackolive.app.service.mypage;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.counselor.PersonalAskVO;
import com.blackolive.app.domain.mypage.DeliveryStatusVO;
import com.blackolive.app.domain.mypage.ProductQnAVO;
import com.blackolive.app.mapper.mypage.MypageMainMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MypageMainServiceImpl implements MypageMainService {
	
	@Autowired
	private MypageMainMapper mapper;
	
	@Override
	public DeliveryStatusVO deliveryStatus(String userid) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.getDeliveryStatus(userid);
	}

	@Override
	public List<ProductQnAVO> productQnAservice(String userid) throws ClassNotFoundException, SQLException {
		log.info(">> productQnA  service");
		return this.mapper.getproductQnA(userid);
	}

	@Override
	public List<ProductQnAVO> productQnAwithDateservice(String userid, String startdate, String enddate)
			throws ClassNotFoundException, SQLException {
		log.info(">> productQnA Date service");
		return this.mapper.getproductQnAwithDate(userid, startdate, enddate);
	}

	@Override
	public List<PersonalAskVO> personalAskListService(String userId) throws ClassNotFoundException, SQLException {
		log.info(">> personalAskListService");
		return this.mapper.getAskList(userId);
	}

	@Override
	public List<ProductQnAVO> productQnAmainservice(String userid) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return this.mapper.getproductQnAmain(userid);
	}

}
