package com.blackolive.app.controller.adminpage;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.blackolive.app.domain.adminpage.OrderCheckDTO;
import com.blackolive.app.domain.adminpage.OrderRegisterDTO;
import com.blackolive.app.domain.adminpage.ProductDTO;
import com.blackolive.app.domain.adminpage.ProductDisplayDTO;
import com.blackolive.app.domain.adminpage.ProductDisplayImgDTO;
import com.blackolive.app.domain.adminpage.ProductDisplayInfoDTO;
import com.blackolive.app.domain.adminpage.ProductImgDTO;
import com.blackolive.app.domain.adminpage.QnaListDTO;
import com.blackolive.app.domain.productList.PageDTO;
import com.blackolive.app.service.adminpage.AdminPageIndexService;
import com.blackolive.app.service.adminpage.AdminQnAService;
import com.blackolive.app.service.adminpage.OrderCheckService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/adminpage/*")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminPageIndexService adminPageIndexService;
	
	@Autowired
	private OrderCheckService orderCheckService;
	
	@Autowired
	private AdminQnAService adminQnAService;
	
	@GetMapping("/")
	public String adminPage() {
		
		return "adminpage/index";
	}
	
	@GetMapping("/product/register")
	public String adminProductRegisterPage() {
		
		return "adminpage/productregister";
	}
	
	@GetMapping("/product/view")
	public String adminProductViewPage() {
		
		return "adminpage/productview";
	}
	
	@GetMapping("/chart")
	public String chartpage() {
		
		return "adminpage/chart";
	}
	
	@PostMapping("/product/reg")
	public String productReg(OrderRegisterDTO orderRegisterDTO, Principal principal
			, HttpServletRequest request) throws IllegalStateException, IOException{
		
		int displayIdSeq = this.adminPageIndexService.getproductIdSeqService();
		String productDisplayId = "pd_" + displayIdSeq;
		// String brandId = principal.getName();
		String brandId = "br_00000012";
		String smallCategoryId = orderRegisterDTO.getSmallCategory();
		
		System.err.println(">>> orderRegisterDTO: " + orderRegisterDTO.toString());
		System.err.println(">>> multipartFile: " + orderRegisterDTO.getProducts().toString());
		
		char productDisplayOption = 'N';
		if (orderRegisterDTO.getProducts().size() >= 2) {
			productDisplayOption = 'Y';
		}
		ProductDisplayDTO productDisplayDTO = new ProductDisplayDTO(productDisplayId, brandId, orderRegisterDTO.getProductDisplayName(), productDisplayOption);
		
		// 상품 정보 삽입
		
		
		List<ProductDTO> productDTO = orderRegisterDTO.getProducts();
		List<CommonsMultipartFile> productImgs = new ArrayList<CommonsMultipartFile>();
		for (int i = 0; i < productDTO.size(); i++) {
			int productSeq = this.adminPageIndexService.productSeq();
			productDTO.get(i).setProductDisplayId(productDisplayId);
			productDTO.get(i).setCategorySmallId(smallCategoryId);
			productDTO.get(i).setProductId("pr_"+productSeq);
			productImgs.add(productDTO.get(i).getProductImg());
		}
		
		// 상품 테이블 저장
		//
		int rowCnt = this.adminPageIndexService.insertProductDisplayService(productDisplayDTO, productDTO);
		
		// 사진 저장
		
		// 상품 표시 이미지 저장
		String productDisplayUploadRealPath = request.getServletContext().getRealPath("/resources/images/productDisplay");
		CommonsMultipartFile productDisplayImg = orderRegisterDTO.getFormFileMultiple();
		String productDisplayImgName = productDisplayImg.getOriginalFilename();
		String afterproductDisplayImgName = getFileNameCheck(productDisplayUploadRealPath, productDisplayImgName);
		File productDisplayFile = new File(productDisplayUploadRealPath, afterproductDisplayImgName);
		productDisplayImg.transferTo(productDisplayFile);
		ProductDisplayImgDTO productDisplayImgDTO = new ProductDisplayImgDTO(productDisplayId,"/resources/images/productDisplay/"+afterproductDisplayImgName);
		int pdIrowCnt = this.adminPageIndexService.insertProductDisplayImg(productDisplayImgDTO);
		
		// 상품 표시 설명 이미지 저장
		List<CommonsMultipartFile> productDisplayExplainImgs = orderRegisterDTO.getMultiInfoImgs();
		String productInfosUploadRealPath = request.getServletContext().getRealPath("/resources/images/productExImgs");
		String [] productDisplayExplainImgsName = new String [productDisplayExplainImgs.size()];
		String [] afterProductDisplayExplainImgsName = new String[productDisplayExplainImgs.size()];
		File productInfoFile = null;
		ProductDisplayInfoDTO displayInfoDTO = null;
		List<ProductDisplayInfoDTO> displayInfoDTOs = new ArrayList<>();
		
		for (int i = 0; i < productDisplayExplainImgs.size(); i++) {
			productDisplayExplainImgsName[i] = productDisplayExplainImgs.get(i).getOriginalFilename();
			afterProductDisplayExplainImgsName[i] = getFileNameCheck(productInfosUploadRealPath, productDisplayExplainImgsName[i]);
			productInfoFile = new File(productInfosUploadRealPath, afterProductDisplayExplainImgsName[i]);
			productDisplayExplainImgs.get(i).transferTo(productInfoFile);
			displayInfoDTO = new ProductDisplayInfoDTO(productDisplayId, "/resources/images/productExImgs/"+afterProductDisplayExplainImgsName[i]);
			displayInfoDTOs.add(displayInfoDTO);
		}
		int productInfoRowCnt = this.adminPageIndexService.insertProductDisplayInfoImgs(displayInfoDTOs); // 실제 DB에 경로 저장
		
		// 상품 이미지 저장
		String productUploadRealPath = request.getServletContext().getRealPath("/resources/images/product");
		String productImgsName[] = new String [productImgs.size()];
		String afterproductImgsName[] = new String [productImgs.size()];
		File productFiles = null;
		ProductImgDTO productImgDTO = null;
		List<ProductImgDTO> productImgDTOs = new ArrayList<>();
		for (int i = 0; i < productImgs.size(); i++) {
			productImgsName[i] = productImgs.get(i).getOriginalFilename();
			afterproductImgsName[i] = getFileNameCheck(productUploadRealPath, productImgsName[i]);
			productFiles = new File(productUploadRealPath, afterproductImgsName[i]);
			productImgs.get(i).transferTo(productFiles);
			productImgDTO = new ProductImgDTO(productDTO.get(i).getProductId(),"/resources/images/product/"+afterproductImgsName[i]);
			productImgDTOs.add(productImgDTO);
		}
		int productImgRowCnt = this.adminPageIndexService.insertProductImgs(productImgDTOs);
		
		System.err.println("productUploadRealPath"+productUploadRealPath);
		System.err.println("productDisplayUploadRealPath"+productDisplayUploadRealPath);
		System.err.println("productInfosUploadRealPath"+productInfosUploadRealPath);
		
		// 상품 프로모션 등록
		//int promotionRowCnt = this.adminPageIndexService.insertPromotion(orderRegisterDTO, productDisplayId);
		
		// 상품 구매정보 등록
		
		int buyInfoRowCnt = this.adminPageIndexService.insertBuyInfo(productDisplayId, orderRegisterDTO.getBuyInfos());
		
		
		
		if (orderRegisterDTO.getProducts() == null) {
			return "adminpage/productregister?error";
		}
		return "redirect:/adminpage/product/register?success";
	} // productReg
	
	// upload폴더 안에 a.txt
	private String getFileNameCheck(String uploadRealPath, String originalFilename) {
		int index = 1;      
		while( true ) {         
			File f = new File(uploadRealPath, originalFilename);         
			if( !f.exists() ) return originalFilename;         
			
			String fileName = originalFilename.substring(0, originalFilename.length() - 4 ); 
			String ext =  originalFilename.substring(originalFilename.length() - 4 );  
			
			originalFilename = fileName+"-"+(index)+ext;

			index++;
		} // while 
	}
	
	@GetMapping("/order/check")
	public String orderCheck(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value="optionCheck", defaultValue = "0")int optionCheck,
			Model model
			) {
		
		// 주문 리스트 갖고오는 작업
		List<OrderCheckDTO> orderCheck = this.orderCheckService.getOrderList(currentPage, optionCheck);
		model.addAttribute("orderCheck", orderCheck);
		
		int totalpage = this.orderCheckService.getTotalPage();
		
		model.addAttribute("pageDTO", new PageDTO(currentPage, 10, 10, totalpage));
		
		return "adminpage/ordercheck";
	}
	
	@GetMapping("/response/qna")
	public String qnaList(Model model) {
		
		List<QnaListDTO> qnaList = this.adminQnAService.getQnAList();
		model.addAttribute("qnaList", qnaList);
		
		return "adminpage/qnalist";
	}
	
	@GetMapping("/response/qnaanswer")
	public String qnaAnswer(@RequestParam("qnaId") String qnaId, Model model) {
		
		QnaListDTO qna = this.adminQnAService.getQnaService(qnaId);
		model.addAttribute("qna", qna);
		
		return "adminpage/qnaanswer";
	}
	
	

} //class
