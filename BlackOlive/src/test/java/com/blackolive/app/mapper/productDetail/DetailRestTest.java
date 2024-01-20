package com.blackolive.app.mapper.productDetail;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.blackolive.app.domain.productdetail.QnAListDTO;
import com.blackolive.app.service.productdetail.ProductDetailService;
import com.blackolive.app.service.productdetail.QnARestService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DetailRestTest {
	
	@Autowired
	private ProductDetailService productDetailService;
	
	@Autowired
	private QnARestService qnaRestService;

	/* 테스트 완료
	@Test
	public void test() {
		
		String productDisplayId = "pd_00000298";
		int currentPages = 2;
		List<QnAListDTO> qnaList = this.productDetailService.getProductQnaService(productDisplayId, currentPages, 10);
		assertNotNull(qnaList);
	} // test
	*/
	/* 테스트 완료
	@Test
	public void modifyTest() {
		
		String qnaId = "qna_18";
		String qnaQuestion = "modify TEst";
		
		int rowCnt = this.qnaRestService.modifyQnAService(qnaId, qnaQuestion);
		System.out.println(rowCnt);
		
		assertEquals(1, this.qnaRestService.modifyQnAService(qnaId, qnaQuestion));
	}
	*/
	/*테스트 완료
	@Test
	public void deleteTest() {
		String qnaId = "qna_17";
		
		assertEquals(1, this.qnaRestService.deleteQnAService(qnaId));
	}
	*/

}
