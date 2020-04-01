package org.adt.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.adt.domain.Criteria;
import org.adt.domain.PageDTO;
import org.adt.service.plannerService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/planner/*")
public class PlannerController {
	
	@Autowired
	private plannerService service;
	
	@GetMapping("/write")
	public void write() {
		log.info("write");
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
			
		int total = service.totalCount(cri);
		
		model.addAttribute("list", service.getList(cri));	
		model.addAttribute("pageMaker", new PageDTO(cri, total));	
	}

	
	
	
	//도시정보 가져오기
	@PostMapping("/cityInfo")
	public ResponseEntity<HashMap<String, String>> cityInfo(@RequestParam("img") String img,
											@RequestParam("title") String title,
											@RequestParam("text") String text) {
		
		if(img != ""){
			img = ("<img src='/resources/img/"+img+"'>");
		}
		if(title != ""){
			title = ("<div><h5>"+title+"</h5></div>");
		}
		if(text != ""){
			text = ("<div>"+text+"</div>");
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("img", img);
		map.put("title", title);
		map.put("text", text);
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
}
