package com.blackolive.app.mapper.productList;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.blackolive.app.service.productList.ProductListServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class ProductListTest {

	@Autowired
	ProductListMapper productListMapper;
	
	@Autowired
	ProductListServiceImpl impl;
	
	
	@Test
	public void test() {
		
//		List<String> topids = this.productListMapper.getTopviewProductId("0003");
//		
//		System.out.println( this.productListMapper.getTopviewProduct(topids) );
//		assertNotNull(this.productListMapper.getTopviewProduct(topids));
		
		assertNotNull(impl.getTopviewProductService("0003", "user1"));
	}
	
	
	 	
} // class
