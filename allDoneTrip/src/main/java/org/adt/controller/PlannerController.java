package org.adt.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	// 플래너 작성 페이지로 이동
	@GetMapping("/write")
	public void write() {
		log.info("write");
	}
	
	// 플래너 리스트 페이지로 이동
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		// 전체 플래너 수 카운트
		int total = service.totalCount(cri);
		log.info(cri);

		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	// 플래너 조회 페이지로 이동
	@GetMapping("/show")
	public String show(HttpServletResponse response, HttpServletRequest request,
					@RequestParam("plan_No") Long plan_No , Model model) {
		
		//쿠키여부 체크하여 조회수 추가
		service.checkCookie(response, request, plan_No);
		model.addAttribute("content", service.getPlanner(plan_No));
		
		return "planner/show";
	}
	
	// 플래너 정렬
	@GetMapping("/sort")
	public String sort(Criteria cri, Model model) {

		int total = service.totalCount(cri);
				
		model.addAttribute("list", service.sorting(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "planner/list";
	}

	
	// 도시정보 담아오기	
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
