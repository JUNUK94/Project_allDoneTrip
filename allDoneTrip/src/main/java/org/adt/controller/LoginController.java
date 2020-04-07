package org.adt.controller;

import java.util.HashMap;

//import org.alldone.domain.LoginVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	@GetMapping("/loginMain")
	public void loginMain() {
		
	}

	@GetMapping("/kakaoLogin")
	public void kakaoLogin() {
		
	}
	
	@GetMapping("/naverLogin")
	public void naverLogin() {
		
	}
	
	@GetMapping("/idSearch")
	public void idSearch() {
		
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@GetMapping("/signUpList")
	public void signUpList() {
		
	}
	
	@GetMapping("/signUp/allDoneSignUp")
	public void allDoneSignUp() {
		
	}
	
	@GetMapping("/signUp/kakaoSignUp")
	public void kakaoSignUp(@RequestParam("code") String code, Model model) {
		
//		String access_Token = service.getAccessToken(code);
//		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
//        log.info("controller access_token : " + access_Token);
//        
//        model.addAttribute("userInfo", userInfo);
		
	}
	
	@GetMapping("/signUp/naverSignUp")
	public void naverSignUp() {
		
	}
	
	@PostMapping("/insertMember")
	public String insertMember(/*LoginVO lvo*/) {
//		service.insertMember(lvo);
//		
//		log.info(lvo);
		return "login/signUp/signUpSuccess";
	}
	
}
