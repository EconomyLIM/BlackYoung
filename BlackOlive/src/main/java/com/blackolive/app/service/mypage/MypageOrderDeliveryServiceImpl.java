package com.blackolive.app.service.mypage;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.mypage.DeliveryVO;
import com.blackolive.app.domain.mypage.OrderVO;
import com.blackolive.app.domain.mypage.PaymentVO;
import com.blackolive.app.mapper.mypage.MypageOrderDeliveryMapper;

@Service
public class MypageOrderDeliveryServiceImpl implements MypageOrderDeliveryService {
	
	@Autowired
	private MypageOrderDeliveryMapper mapper;
	
	@Override
	public List<OrderVO> orderlistservice(String userid) throws ClassNotFoundException, SQLException {

		
		return this.mapper.getOrderList(userid);
	}

	@Override
	public List<OrderVO> orderlistservicewithdate(String userid, String startdate, String enddate)
			throws ClassNotFoundException, SQLException {
		
		return this.mapper.getOrderListwithDate(userid, startdate, enddate);
	}

	@Override
	public List<OrderVO> orderlistservicewithcondition(String userid, String startdate, String enddate,
			String searchType) throws ClassNotFoundException, SQLException {
		
		return this.mapper.getOrderListwithCondition(userid, startdate, enddate, searchType);
	}

	@Override
	public OrderVO detailorderservice(String orderId) throws ClassNotFoundException, SQLException {
		
		return this.mapper.getDetailOrder(orderId);
	}

	@Override
	public DeliveryVO deliveryservice(String orderId) throws ClassNotFoundException, SQLException {
		
		return this.mapper.getDelivery(orderId);
	}

	@Override
	public PaymentVO paymentservice(String orderId) throws ClassNotFoundException, SQLException {
		
		return this.mapper.getPayment(orderId);
	}

}
