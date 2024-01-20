package com.blackolive.app.mapper.adminpage;

import static org.junit.Assert.*;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.blackolive.app.domain.adminpage.ProductDisplayDTO;
import com.blackolive.app.service.adminpage.AdminPageIndexService;
import com.blackolive.app.service.adminpage.OrderCheckService;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class AdminPageIndexTest {

	
	@Autowired
	AdminPageIndexMapper adminPageIndexMapper;
	
	@Autowired
	AdminPageIndexService adminPageIndexService;
	
	@Autowired
	OrderCheckService orderCheckService;
	
	/*
	@Test
	public void getMonthlySales() {
		assertNotNull(this.adminPageIndexMapper.getSalesPerMonth(null));
	}
	*/
	
	@Test
	public void getDaylySales() throws InterruptedException {
		
		// assertNotNull(this.adminPageIndexMapper.getLargeCategory(1)); 성공
		
		// assertNotNull(this.adminPageIndexMapper.getBuyInfo(1));
		
//		int displayIdSeq = this.adminPageIndexService.getproductIdSeqService();
//		String productDisplayId = "pd_" + displayIdSeq;
//		//String brandId = principal.getName();
//		String brandId = "br_00000012";
//		
//		ProductDisplayDTO productDisplayDTO = new ProductDisplayDTO(productDisplayId, brandId, "test1", 'N'); 
//		
//		assertEquals(1, this.adminPageIndexService.insertProductDisplayService(productDisplayDTO));
		
		//(this.orderCheckService.getOrderList(1,));
		
		int threadCount = 100;
		ExecutorService executorService = Executors.newFixedThreadPool(32);
		CountDownLatch latch = new CountDownLatch(100);
		int rowCnt = 0;
		for (int i = 0; i < threadCount; i++) {
			
			String productDisplayId = "1000" + i;
			String brandId = "br_00000012";
			executorService.submit(() -> {
				try {
					ProductDisplayDTO productDisplayDTO = new ProductDisplayDTO(productDisplayId, brandId, "test1", 'N'); 
					
				} finally {
					latch.countDown();
				}
			});
		} // for
		
		latch.await();
		
	}

}
