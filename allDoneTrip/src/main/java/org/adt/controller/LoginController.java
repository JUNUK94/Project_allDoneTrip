package org.adt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.adt.domain.MemberVO;
import org.adt.mapper.MemberMapper;
import org.adt.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Autowired
	private MemberService mService;

	@Autowired
	private MemberMapper mMapper;

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
	public void login(String email,Model model) {
		model.addAttribute("email",email);
		
	}

	@GetMapping("/signUpList")
	public void signUpList() {

	}

	@GetMapping("/signUp/allDoneSignUp")
	public void allDoneSignUp() {

	}
	
	
	@RequestMapping(value="/signUp/kakaoSignUp")
	public String login(@RequestParam("code") String code, HttpSession session) {
	    
		String access_Token = mService.getAccessToken(code);
	    HashMap<String, Object> userInfo = mService.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("access_Token", access_Token);
	        
	    }
	    return "login/signUp/kakaoSignUp";
	}


	@GetMapping("/signUp/naverSignUp")
	public void naverSignUp() {

	}

	@PostMapping("/insertMember")
	public String insertMember(MemberVO member) {

		mService.join(member);

		log.info(member);
		return "login/signUp/signUpSuccess";
	}

	// 이메일 중복채크
	@ResponseBody
	@GetMapping(value = "/inputCheck", produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> emailCheck(@RequestParam("email") String email) {

		MemberVO member = new MemberVO();
		member.setEmail(email);
		log.info(member.getEmail());

		boolean status = mService.emailCheck(member.getEmail());
		log.info("status = " + status);
		String message = "";
		if (status) {
			if (member.getEmail().contains("@")) {
				message = "사용하실 수 있는 이메일입니다.";
			} else {
				message = "올바른 이메일형식이아닙니다.";
			}
		} else {
			message = "이미 사용중인 이메일입니다.";
		}

		return new ResponseEntity<>(message, HttpStatus.OK);
	}

	// 닉넴 중복채크
	@ResponseBody
	@GetMapping(value = "/nick_NameCheck", produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> nick_NameCheck(@RequestParam("nick_Name") String nick_Name) {

		MemberVO member = new MemberVO();
		member.setNick_Name(nick_Name);
		log.info(member.getNick_Name());

		boolean status = mService.nick_NameCheck(member.getNick_Name());
		log.info("status = " + status);
		String message = "";
		if (status) {
			if (nick_Name.length() > 1) {
				message = "사용하실 수 있는 닉네임입니다.";
			} else {
				message = "사용할 수 없는 닉네임입니다.";
			}
		} else {
			message = "이미 사용중인 닉네임입니다.";
		}

		return new ResponseEntity<>(message, HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping("/loginCheck")
	public ResponseEntity<String> loginCheck(@RequestParam("email") String email, @RequestParam("pw") String pw,
			MemberVO member) {
		
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8"); 

		member.setEmail(email);
		member.setPw(pw);
		
		boolean status = mService.loginCheck(member);
		log.info(status);
		String msg = "";
		if (status) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		
		log.info(msg);
		return new ResponseEntity<>(msg,responseHeaders, HttpStatus.OK);
	}

	

}
