package com.blackolive.app.controller.counselor;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.blackolive.app.domain.counselor.PersonalAskVO;
import com.blackolive.app.service.counselor.PersonalAskService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Controller
@Log4j
public class AskMajCategoryAjaxController {

	@Autowired
	private PersonalAskService personalAskService;
	@GetMapping("/majCategory")
	public ResponseEntity<List<String>> majorCategory(PersonalAskVO askVo) throws ClassNotFoundException, SQLException {
		return new ResponseEntity<>(this.personalAskService.selectmajCategory(), HttpStatus.OK);
	}
	

}
