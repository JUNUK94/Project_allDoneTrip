package org.adt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {
	
	@RequestMapping("/")
	public String home(Model model) {
		log.info("main");
		return "index";
	}
	
	@RequestMapping("/about")
	public void about() {
		
	}
	
	@RequestMapping("/blog")
	public void blog() {
		
	}
	
	@RequestMapping("/contact")
	public void contact() {
		
	}
	@RequestMapping("/elements")
	public void elements() {
		
	}
	@RequestMapping("/packages")
	public void packages() {
		
	}
	@RequestMapping("/single-blog")
	public void single_blog() {
		
	}
	@RequestMapping("/top_place")
	public void top_place() {
		
	}
	@RequestMapping("/tour_details")
	public void tour_details() {
		
	}
	
}
