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
	
	@GetMapping("/*")
	public void allCommunitylist( Criteria cri, Model model) {
		log.info(service);
		model.addAttribute("list", service.allBoardList(cri));
//		model.addAttribute("pageUtil", new PageDTO(cri, service.totalBoardCount(cri)) );
		
	}
}
