package org.adt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/my/*")
public class mypageController {
	
	
	
	@GetMapping("/myMain")
	public void main() {
		log.info("마이페이지");
	}

}