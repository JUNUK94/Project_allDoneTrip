package org.adt.controller;

import org.adt.domain.Criteria;
import org.adt.domain.PageDTO;
import org.adt.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/community/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/")
	public String allCommunitylist( Criteria cri, Model model) {
		System.out.println(service.getList(cri));
		
		int total = service.boardPaging(cri);

		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		System.out.println(total);
		return "/community/list";
	}
}
