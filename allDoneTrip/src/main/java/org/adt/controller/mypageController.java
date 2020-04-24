package org.adt.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.adt.domain.MemberVO;
import org.adt.service.MypageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/my/*")
public class mypageController {
	
	@Autowired
	private MypageService mypage;
	
	@GetMapping("/myMain")
	public String main(Model model) {
		log.info("마이페이지");
		
		
		model.addAttribute("page","my/myMain.jsp");
		
		return "index";
	}
	
	@GetMapping("/memberInfoModify")
	public ModelAndView memberInfoModify(Model model, MemberVO member, HttpSession session) {
		System.out.println("111111111111111111111111111111111111111111111");
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("email");
		member.setEmail(email);
		List<MemberVO> Info = mypage.memberInfo(member.getEmail());
		mav.addObject("mem", Info);
		
		log.info(Info.get(0).getProfile());
		log.info(Info.get(0).getEmail());

		
		mav.addObject("page","my/memberInfoModify.jsp");
		mav.setViewName("index");
		return mav;
	}
	
	@PostMapping(value="/memberInfoUpdate" ,produces = "text/plain; charset=UTF-8")
	public String memberInfoUpdate(MemberVO member, HttpSession session, Model model) {
		System.out.println("업데이트ㅡㅡㅡ");
		
		log.info(member);
		
		mypage.memberInfoUpdate(member);
		System.out.println("22222222222222222222222222222222222222222");

		String message = "수정이 완료 되었습니다";
		String email = (String)session.getAttribute("email");
		member.setEmail(email);
		List<MemberVO> Info = mypage.memberInfo(member.getEmail());
		model.addAttribute("mem", Info);
		model.addAttribute("page","my/memberInfoModify.jsp");
		model.addAttribute("message",message);
		return "index";
	}
	
}
	
	
	
