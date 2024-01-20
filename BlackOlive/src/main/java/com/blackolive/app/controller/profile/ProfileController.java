package com.blackolive.app.controller.profile;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blackolive.app.domain.profile.InterestCategoryVO;
import com.blackolive.app.domain.profile.ProfileVO;
import com.blackolive.app.domain.profile.SkinTroubleVO;
import com.blackolive.app.service.profile.ProfileService;

@Controller
@RequestMapping("/profile/*")
public class ProfileController {
		
	@Autowired
	private ProfileService service;
	
	@GetMapping("/myprofile")
	public String getprofilecontroller(
			Principal principal,
			Model model
			) throws ClassNotFoundException, SQLException{
		//회원 id 가져오기
		String userid = principal.getName();
		
		//프로필 정보 
		ProfileVO profile = this.service.getprofileservice(userid);
		model.addAttribute("profile", profile);
		
		//관심카테고리
		List<InterestCategoryVO> categoryVO = this.service.getinterestcategoryservice(userid);
		model.addAttribute("categoryVO", categoryVO);
		
		//피부트러블
		List<SkinTroubleVO> troubleVO = this.service.getskintroubleservice(userid);
		model.addAttribute("troubleVO", troubleVO);
		
		return "profile.myprofile";
	}
	
	//프로필 수정
	@GetMapping("/profileedit")
	public String getprofileeditcontroller(
			Principal principal,
			Model model
			) throws ClassNotFoundException, SQLException{
		
		//회원 id 가져오기
		String userid = principal.getName();
		
		//프로필 정보 
		ProfileVO profile = this.service.getprofileservice(userid);
		model.addAttribute("profile", profile);
		
		//관심카테고리
		List<InterestCategoryVO> categoryVO = this.service.getinterestcategoryservice(userid);
		model.addAttribute("categoryVO", categoryVO);
		
		//피부트러블
		List<SkinTroubleVO> troubleVO = this.service.getskintroubleservice(userid);
		model.addAttribute("troubleVO", troubleVO);
						
		return "profile.profileedit";
	}
	
	@PostMapping("/profileedit")
	public String postprofileeditcontroller() throws ClassNotFoundException, SQLException{
		
		
		
		return "profile.myprofile";
	}
	
}
