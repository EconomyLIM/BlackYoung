package com.blackolive.app.controller.signin;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.blackolive.app.service.signin.JoinService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController   
@Log4j
public class IdCheckAjaxController {
	@Setter(onMethod=@__({@Autowired}))
	private JoinService joinService;

	@PostMapping("/selectUserId")
	public String selectUserId( String userId) throws ClassNotFoundException, SQLException{
		log.info("> /selectUserId .. POST-Ajax" + userId);
		String result = "N" ;
		int idCheckResult = this.joinService.idCheck(userId);
		if (idCheckResult == 1) result ="Y";
		return result ;
	}

}
