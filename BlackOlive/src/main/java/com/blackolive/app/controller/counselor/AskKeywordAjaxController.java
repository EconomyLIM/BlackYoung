package com.blackolive.app.controller.counselor;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blackolive.app.domain.counselor.FaqVO;
import com.blackolive.app.service.counselor.PersonalAskService;

import lombok.extern.log4j.Log4j;

@RestController
@Controller
@Log4j
public class AskKeywordAjaxController {

	@Autowired
	private PersonalAskService personalAskService;
	
	@GetMapping( value="/askKeyword")
	public ResponseEntity<List<FaqVO>> askKeyword( String faqKeyword
																		) throws ClassNotFoundException, SQLException {
		//faqKeyword = URLDecoder.decode(faqKeyword, StandardCharsets.UTF_8); 
		log.info(faqKeyword);

		return new ResponseEntity<>(this.personalAskService.faqKeyword(faqKeyword), HttpStatus.OK);
	}
	

}
