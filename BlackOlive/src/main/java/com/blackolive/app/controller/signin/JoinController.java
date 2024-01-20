package com.blackolive.app.controller.signin;

import java.sql.SQLException;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blackolive.app.domain.signin.OliveUserDTO;
import com.blackolive.app.service.signin.JoinService;

import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/join/*")
public class JoinController {

	@Autowired
	private JoinService joinService;

	// 회원가입여부 체크_GET
	@GetMapping("/joinCheck")
	public String joinCheck() throws ClassNotFoundException, SQLException{
		log.info("joinCheck_GET...");
		return "join.joinCheck";
	}
	
	// 회원가입여부 체크_POST
	@PostMapping("/joinCheck")
	public String joinCheck( @RequestParam("userTel") String userTel
			, @RequestParam("userName") String userName
			, Model model) throws ClassNotFoundException, SQLException {
		log.info("joinCheck_POST...");

		OliveUserDTO userDto = this.joinService.getJoinCheck(userTel);

		if(userDto == null ) {
			return "join.verify";
		}else {
			model.addAttribute("userDto", userDto);
			return "join.join_already";
		}//if
	}		
	
	// 가입된 회원 이동경로_GET
	@GetMapping("/join_already")
	public String alreadyUser (OliveUserDTO userDto) throws ClassNotFoundException, SQLException {
		log.info("alreadyUser_GET...");
		userDto = this.joinService.getAlreadyUser(userDto);
		return "../logon/logOn";
	}

	// 회원가입 휴대폰인증1_GET
	@GetMapping("/verify_phfirst")
	public String verify() throws SQLException, ClassNotFoundException{
		log.info("verify_phfirst_GET...");
		return "join.verify_phfirst.part";
	}

	// 회원가입 휴대폰인증2_GET
	@GetMapping("/verify_phlast")
	public String verify_phlast() throws SQLException, ClassNotFoundException{
		log.info("verify_phlast_GET...");
		return "join.verify_phlast.part";
	}
	// 회원가입 휴대폰인증 완료_POST
	@PostMapping("/agreement")
	public String verifyOk( @RequestParam("userName") String userName
							, @RequestParam("userTel") String userTel
							, @RequestParam("userBirth") String userBirth
							, @RequestParam("userGender") String userGender
							, Model model) throws SQLException, ClassNotFoundException{
		log.info("verifyOk_POST..." + userName + userTel + userBirth+ userGender);

		model.addAttribute("userName", userName);
		model.addAttribute("userTel", userTel);
		model.addAttribute("userBirth", userBirth);
		model.addAttribute("userGender", userGender);
		
		return "join.agreement";
	}
	// 회원가입-약관동의_POST
	@PostMapping("/join")
	public String agreement(@RequestParam("userName") String userName
			, @RequestParam("userTel") String userTel
			, @RequestParam("userBirth") String userBirth
			, @RequestParam("userGender") String userGender
			, Model model ) throws SQLException, ClassNotFoundException{
		log.info("agreement_POST..."+ userName + userTel + userBirth+ userGender);
		model.addAttribute("userName", userName);
		model.addAttribute("userTel", userTel);
		model.addAttribute("userBirth", userBirth);
		model.addAttribute("userGender", userGender);
		return "join.join";
	}
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 회원가입완료_POST
	@PostMapping("/joinOk")
	public String join( @RequestParam("birth_yy") int birthYear
							 , @RequestParam("birth_mm") int birthMonth
							 , @RequestParam("birth_dd") int birthDay
							 , @RequestParam("email_addr1") String email1
			 				 , @RequestParam("email_addr2") String email2
			 				, @RequestParam("userGender") int userGender
			 				 , OliveUserDTO userDto) throws ClassNotFoundException, SQLException {
		log.info("join_POST..." + userDto);
		
		LocalDate userBirth = LocalDate.of(birthYear, birthMonth, birthDay);
	    userDto.setUserBirth(userBirth);

	    if ( userGender == 1 || userGender == 3 ) {
	    	userDto.setUserGender(1);
	    } else if ( userGender == 2 || userGender == 4 ) {
	    	userDto.setUserGender(2);
	    }
		userDto.setUserEmail(email1+"@"+email2);
		
		String userPassword = userDto.getUserPassword();
		userDto.setUserPassword(this.passwordEncoder.encode(userPassword));
		this.joinService.insertUser(userDto);
		return "auth.login";
	}
}
