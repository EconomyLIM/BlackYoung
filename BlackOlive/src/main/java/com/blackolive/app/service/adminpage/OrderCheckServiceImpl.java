package com.blackolive.app.service.adminpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blackolive.app.domain.adminpage.OrderCheckDTO;
import com.blackolive.app.mapper.adminpage.OrderCheckMapper;

@Service
public class OrderCheckServiceImpl implements OrderCheckService{

	@Autowired
	private OrderCheckMapper orderCheckMapper;
	
	@Override
	public List<OrderCheckDTO> getOrderList(int currentpage, int checkOption) {
		int begin = (currentpage -1) * 10 + 1;
		int end = begin + 10 -1 ;
		
		String status = null;
		
		switch (checkOption) {
		case 1:
			status = "주문접수";
			break;
		case 2:
			status = "주문확인";
			break;
		default:
			break;
		} // switch

		return this.orderCheckMapper.getOrderList(begin, end, status);
	}

	@Override
	public int getTotalPage() {
		
		return this.orderCheckMapper.getTotalPages();
	}

	@Override
	public int orderConfirmService(String[] orderId) {

		return this.orderCheckMapper.orderConfirm(orderId);
	}

}
