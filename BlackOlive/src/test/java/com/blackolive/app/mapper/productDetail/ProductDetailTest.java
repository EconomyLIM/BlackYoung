package com.blackolive.app.mapper.productDetail;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.blackolive.app.mapper.productdetail.ProductDetailMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class ProductDetailTest {

	@Autowired
	ProductDetailMapper productDetailMapper;
	
	/* 테스트 완료
	@Test
	public void test() {
		System.out.println(this.productDetailMapper.getProductPromotion("pd_00000249"));

	} */
	
	/*
	 * 테스트 완료
	@Test
	public void productDetailImg() {
		System.out.println(this.productDetailMapper.getProductDisplayImg("pd_00000249"));

	} */
	
	/* 테스트 완료
	@Test
	public void productDetailExplainImg() {
		System.out.println(this.productDetailMapper.getProductDisplayExplainImg("pd_00000298"));
		assertNotNull(this.productDetailMapper.getProductDisplayExplainImg("pd_00000298"));
	}
	*/
	@Test
	public void productDetailBrandInfo() {
		assertNotNull(this.productDetailMapper.getProductBrandInfo("pd_00000298"));
		System.out.println(this.productDetailMapper.getProductBrandInfo("pd_00000298"));
	}
	
	 	
} // class
