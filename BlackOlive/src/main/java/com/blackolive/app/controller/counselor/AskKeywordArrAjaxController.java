package com.blackolive.app.controller.counselor;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.blackolive.app.domain.counselor.FaqVO;
import com.blackolive.app.service.counselor.PersonalAskService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class AskKeywordArrAjaxController {

	@Autowired
	private PersonalAskService personalAskService;
	
	@GetMapping( value="/askKeywordArr")
	public ResponseEntity<List<FaqVO>> askKeywordArr( @RequestParam("faqKeywordArr") List<String> faqKeywordArr
																		) throws ClassNotFoundException, SQLException {
		log.info("faqKeywordArr_GET_Ajax....");

		for (String keyword : faqKeywordArr) {
			List<FaqVO> serviceResult = this.personalAskService.faqKeyword(keyword);
			if (!serviceResult.isEmpty()) {
				 return new ResponseEntity<>(serviceResult, HttpStatus.OK);
			}
		}

		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	  
	}
	

}
