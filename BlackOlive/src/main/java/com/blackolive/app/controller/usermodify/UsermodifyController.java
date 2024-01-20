package com.blackolive.app.controller.usermodify;

import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blackolive.app.domain.signin.OliveUserDTO;
import com.blackolive.app.service.usermodify.UsermodifyService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/usermodify/*")
public class UsermodifyController {
	@Autowired
	private UsermodifyService usermodifyService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	//비밀번호 변경_GET
	@GetMapping("/pwd_modification")
	public String pwdModify( Principal principal, Model model) throws ClassNotFoundException, SQLException {
		log.info( "pwdModify_GET..." +principal.getName());
		String userId = principal.getName();
		model.addAttribute("userId", userId);
		return "usermodify.pwd_modification";
	}

	//비밀번호 변경 완료_POST
	@PostMapping("/pwd_modification")
	public String pwdModifyOk(@RequestParam("new_pwd") String newPassword
										, Principal principal) throws ClassNotFoundException, SQLException {
		log.info("pwdModifyOk_POST...");
		// 로그인 유저 정보
		String userId = principal.getName();
        // 새로운 비밀번호 설정
    	this.usermodifyService.pwdModify(passwordEncoder.encode(newPassword), userId);
		return "usermodify.pwd_modification_ok";
	}
	
	//회원정보수정-비밀번호체크_GET
	@GetMapping("/pwdCheck")
	public String pwdCheck( Principal principal, Model model) throws ClassNotFoundException, SQLException {
		log.info( "pwdCheck_GET..." +principal.getName());
		String userId = principal.getName();
		OliveUserDTO userDto = this.usermodifyService.getUser(userId);
		model.addAttribute("userDto", userDto);
		//passwordEncoder.matches(userDto.getUserPassword(), );
		return "usermodify.pwdCheck";
	}
	
	//회원정보수정-비밀번호체크완료_POST
	@PostMapping("/pwdCheck")
	public String pwdCheckOk( Principal principal, Model model) throws ClassNotFoundException, SQLException {
		log.info( ">>>>>pwdCheckOk_POST..." +principal.getName());
		String userId = principal.getName();
		OliveUserDTO userDto = this.usermodifyService.getUser(userId);
		model.addAttribute("userDto", userDto);
		return "usermodify.info_modification";
	}
	
	// 회원정보수정-이름/전화번호 변경 이동_GET
	@GetMapping("/name_update")
	public String newInfo( Principal principal, Model model) throws ClassNotFoundException, SQLException {
		log.info( "newInfo_GET..." +principal.getName());
		String userId = principal.getName();
		model.addAttribute("userId", userId);
		return "usermodify.name_update";
	}
	
	// 회원정보수정 휴대폰인증1_GET (팝업창 이동)
	@GetMapping("/modify_phfirst")
	public String modify_phfirst() throws SQLException, ClassNotFoundException{
		log.info("modify_phfirst_GET...");
		return "usermodify.modify_phfirst.part";
	}
	
	// 회원정보수정 휴대폰인증2_GET (팝업창 이동)
	@GetMapping("/modify_phlast")
	public String modify_phlast() throws SQLException, ClassNotFoundException{
		log.info("modify_phlast_GET...");
		return "usermodify.modify_phlast.part";
	}
	
	// 회원정보수정 휴대폰인증 완료_POST (팝업>부모창 이동)
	@PostMapping("/info_modification")
	public String newInfoOk( Principal principal, Model model
									, @RequestParam ("userName") String newName
									, @RequestParam ("userTel") String inputTel
									) throws SQLException, ClassNotFoundException{
		log.info("newInfoOk_POST..." + newName + inputTel );
		String userId = principal.getName();
		OliveUserDTO userDto = this.usermodifyService.getUser(userId);
    
		String newTel = inputTel.substring(0, 3)+"-"+inputTel.substring(3,7)+"-"+inputTel.substring(7);
		
		model.addAttribute("userDto", userDto);
		model.addAttribute("newName", newName);
		model.addAttribute("newTel", newTel);
		log.info("인증완료"+newName+"/"+newTel);

		return "usermodify.info_modification";
	}

	// 회원정보수정 완료_POST
	@PostMapping("/info_modification_ok")
	public String infoModifyOk( Principal principal, OliveUserDTO userDto
			 , @RequestParam("email_addr1") String email1
			 , @RequestParam("email_addr2") String email2
			 , @RequestParam("userName") String userName
			 , @RequestParam("userTel") String userTel
			 , @RequestParam("userPassword") String newPassword
						) throws SQLException, ClassNotFoundException{
		log.info("infoModifyOk_POST...");
		log.info("수정완료"+ userDto );
		// 로그인 회원 정보
		String userId = principal.getName();
		OliveUserDTO currentUser  = this.usermodifyService.getUser(userId);
		String inputEmail = email1+"@"+email2;
		// 사용자정보 업데이트
		currentUser.setUserEmail(inputEmail);
		currentUser.setUserName(userName);
		currentUser.setUserTel(userTel);
		currentUser.setUserPassword(passwordEncoder.encode(newPassword));

		this.usermodifyService.infoModify(currentUser);
		 
		return "usermodify.info_modification_ok";
	}


}
