package com.blackolive.app.controller.counselor;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;
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
public class AskMinCategoryAjaxController {

	@Autowired
	private PersonalAskService personalAskService;
	
	@GetMapping("/minCategory")
	public ResponseEntity<List<String>> minorCategory( @Param("askCategoryMajor") String askCategoryMajor
								,  PersonalAskVO askVo) throws ClassNotFoundException, SQLException {
		return new ResponseEntity<>(this.personalAskService.selectminCategory(askCategoryMajor), HttpStatus.OK);
	}
	

}
