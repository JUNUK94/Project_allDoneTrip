package org.adt.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		return "home";
	}
	
	@RequestMapping("/ex/about")
	public void about() {
		
	}
	
	@RequestMapping("/ex/blog")
	public void blog() {
		
	}
	
	@RequestMapping("/ex/contact")
	public void contact() {
		
	}
	@RequestMapping("/ex/elements")
	public void elements() {
		
	}
	@RequestMapping("/ex/packages")
	public void packages() {
		
	}
	@RequestMapping("/ex/single-blog")
	public void single_blog() {
		
	}
	@RequestMapping("/ex/top_place")
	public void top_place() {
		
	}
	@RequestMapping("/ex/tour_details")
	public void tour_details() {
		
	}
	
}
