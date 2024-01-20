package com.blackolive.app.mapper.head;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.blackolive.app.mapper.productList.ProductListMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@WebAppConfiguration
public class ProductListServiceTest {

	@Autowired
	ProductListMapper mapper;
	
	@Test
	public void test() {
		System.out.println( mapper.getCategoryLarge(1) );
	}

}
