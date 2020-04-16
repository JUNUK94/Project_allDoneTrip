package org.adt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;

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


	@GetMapping("/signUp/allDoneSignUp")
	public void allDoneSignUp() {

	}
	
	
	@RequestMapping(value = "/signUpList", method = RequestMethod.GET)
	public ModelAndView memberLoginForm(HttpSession session) {
	ModelAndView mav = new ModelAndView();
	/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
	//String naverAuthUrl = naverLoginDTO.getAuthorizationUrl(session);
	String kakaoUrl = kakaoController.getAuthorizationUrl(session);
	/* 생성한 인증 URL을 View로 전달 */
	mav.setViewName("login/signUpList");
	// 네이버 로그인
	//mav.addObject("naver_url", naverAuthUrl);
	// 카카오 로그인
	mav.addObject("kakao_url", kakaoUrl);
	return mav;
	}// end memberLoginForm()
	
	
	@RequestMapping(value = "/signUp/kakaoSignUp", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST }) 
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception { 
		
		
		ModelAndView mav = new ModelAndView(); 
		// 결과값을 node에 담아줌 
		JsonNode node = kakaoController.getAccessToken(code); 
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음 
		JsonNode accessToken = node.get("access_token"); 
		// 사용자의 정보
		
		
		System.out.println(accessToken);
		
		
		JsonNode userInfo = kakaoController.getKakaoUserInfo(accessToken); 
		
		// 유저정보 카카오에서 가져오기 Get properties 
		JsonNode properties = userInfo.path("properties"); 
		JsonNode kakao_account = userInfo.path("kakao_account"); 
		String email = kakao_account.path("email").asText(); 
		String nickName = properties.path("nickname").asText(); 
		String image = properties.path("profile_image").asText(); 
		String gender = kakao_account.path("gender").asText(); 
		String birthday = kakao_account.path("birthday").asText(); 
		String age = kakao_account.path("age_range").asText(); 
//		session.setAttribute("email", email); 
//		session.setAttribute("name", name); 
//		session.setAttribute("image", image); 
//		session.setAttribute("gender", gender); 
//		session.setAttribute("birthday", birthday); 
//		session.setAttribute("age", age); 
		mav.setViewName("login/signUp/kakaoSignUp"); 
		mav.addObject("email", email);
		mav.addObject("nickName", nickName);
		mav.addObject("profile_image", image);
		System.out.println("우아아아아아아아아앙"+mav);
		return mav; 
	}// end kakaoLogin()
	





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
