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
import org.springframework.web.bind.annotation.ResponseBody;
import org.adt.domain.Criteria;
import org.adt.domain.PageDTO;
import org.adt.domain.PlannerReplyVO;
import org.adt.domain.PlannerVO;
import org.adt.service.plannerReplyService;
import org.adt.service.plannerService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/planner/*")
public class PlannerController {
	
	@Autowired
	private plannerService service;
	
	@Autowired
	private plannerReplyService replyService;
	
	
	// 플래너 작성 페이지로 이동
	@GetMapping("/write")
	public void write(Model model) {
		log.info("write");
		
		model.addAttribute("width", "100%");
	}
		
	
	// 플래너 작성 페이지로 이동
	@GetMapping("/Test")
	public void Test(Model model) {
	}
	
	
	// 플래너 리스트 페이지로 이동
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		// 전체 플래너 수 카운트
		int total = service.totalCount(cri);
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}


	
	// 플래너 조회 페이지로 이동
	@GetMapping("/show")
	public String show(HttpServletResponse response, HttpServletRequest request,
					@RequestParam("plan_No") Long plan_No, PlannerReplyVO rvo, Model model) {

		// 전체 플래너 수 카운트		
		int totalReply = replyService.totalReplyCount(plan_No);
		
		//쿠키여부 체크하여 조회수 추가
		service.checkCookie(response, request, plan_No);
		//플래너 내용 가져와서 추가
		model.addAttribute("content", service.getPlanner(plan_No));
		//댓글 목록 가져와서 추가
		model.addAttribute("reply", replyService.getReplyList(plan_No));
		//댓글 수량 카운트해서 추가
		model.addAttribute("totalReply", totalReply);
		//대댓글(답글) 목록 가져와서 추가
		model.addAttribute("reReply", replyService.getReReplyList(plan_No));
		
		return "planner/show";
	}
	

	
	// 플래너 댓글 등록
	@PostMapping("/replyWrite")
	@ResponseBody
	public ResponseEntity<HashMap<String, PlannerReplyVO>> replyWrite(PlannerReplyVO prvo) {
															
		HashMap<String, PlannerReplyVO> map = new HashMap<String, PlannerReplyVO>();
		
		//날짜, 시간 구분해서 원하는 형식으로 조합
		String date[] = prvo.getRegdate().split("/");
		String sysdate = date[0] + " " + date[1];
		
		//PlannerReplyVO의 regdate 변수에 날짜+시간 set하기
		prvo.setRegdate(sysdate);
		
		//댓글 DB에 입력
		replyService.replyWrite(prvo);
		map.put("list",prvo);
		
		return new ResponseEntity<HashMap<String, PlannerReplyVO>>(map, HttpStatus.OK);
	}
	
	
	// 플래너 대댓글(답글) 등록
	@PostMapping("/reReplyWrite")
	@ResponseBody
	public ResponseEntity<HashMap<String, PlannerReplyVO>> reReplyWrite(PlannerReplyVO prvo) {
															
		HashMap<String, PlannerReplyVO> map = new HashMap<String, PlannerReplyVO>();

		//날짜, 시간 구분해서 원하는 형식으로 조합
		String date[] = prvo.getRegdate().split("/");
		String sysdate = date[0] + " " + date[1];
		
		//PlannerReplyVO의 regdate 변수에 날짜+시간 set하기
		prvo.setRegdate(sysdate);
		
		//댓글 DB에 입력
		replyService.reReplyWrite(prvo);
		map.put("list", prvo);
		
		return new ResponseEntity<HashMap<String, PlannerReplyVO>>(map, HttpStatus.OK);
	}
	
	// 플래너 댓글 삭제
	@PostMapping("/replyDelete")
	@ResponseBody
	public ResponseEntity<HashMap<String, String>> replyDelete(PlannerReplyVO prvo){
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		//댓글 DB에서 삭제 실행 후 성공 or 실패 여부 판단
		boolean result = replyService.replyDelete(prvo);
		String message = "댓글 삭제 실패";
	
		if(result) {
			message = "댓글 삭제 성공";
		}
		
		map.put("message", message);
		map.put("plan_No", ""+prvo.getPlan_No());
		map.put("p_Rno", ""+prvo.getP_Rno());
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	// 좋아요 추가
	@PostMapping("/like")
	@ResponseBody
	public ResponseEntity<HashMap<String, String>> addLike(PlannerVO pvo){
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		//좋아요 추가 기능 실행 후, 성공 or 실패 여부 판단
		boolean result = service.addLike_afterCheck(pvo);
		
		if(result) {
			map.put("message", "감사합니다");
		}else {
			map.put("message", "이미 누르셨습니다.");
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	
	// 도시정보 담아오기	
	@PostMapping("/cityInfo")
	@ResponseBody
	public ResponseEntity<HashMap<String, String>> cityInfo(@RequestParam("img") String img,
											@RequestParam("title") String title,
											@RequestParam("text") String text) {
		
		HashMap<String, String> map = new HashMap<String, String>();

		if(img != ""){
			img = ("<img src='/resources/img/"+img+"'>");
		}
		if(title != ""){
			title = ("<div><h5>"+title+"</h5></div>");
		}
		if(text != ""){
			text = ("<div>"+text+"</div>");
		}
		
		map.put("img", img);
		map.put("title", title);
		map.put("text", text);
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	

	
}