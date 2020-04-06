package org.adt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	@GetMapping("/loginMain")
	public void loginMain() {
		
	}

	@GetMapping("/signUpList")
	public void signUpList() {
		
	}
}
