package org.adt.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.adt.domain.ScrapVO;
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
	
	
	
	// 플래너 리스트 페이지로 이동
	@GetMapping("/test")
	public void test() {
	}
	
	
	
	
	// 플래너 작성 페이지로 이동
	@GetMapping("/write")
	public String write(PlannerVO pvo, Model model, HttpSession session) {
		log.info("write");
		
		String email = (String)session.getAttribute("email");
		if(email != null) {
			model.addAttribute("list", service.getUsersPlanner(email));
		}
		if(pvo.getPlan_No() != null) {
			pvo = service.getPlanner(pvo.getPlan_No()).get(0);
			log.info(pvo.getTrip_Period());
			String[] day = pvo.getTrip_Period().split("-");
		
			pvo.setStartDay(day[0].replace(".", "-"));
			pvo.setEndDay(day[1].replace(".", "-"));
			log.info(pvo);
			
			model.addAttribute("data", pvo);
		}
		//페이지 include 처리
		model.addAttribute("page", "planner/write.jsp");
		return "index";
	}
	
	
	// 플래너 리스트 페이지로 이동
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		
		// 전체 플래너 수 카운트
		int total = service.totalCount(cri);
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		//페이지 include 처리
		model.addAttribute("page", "planner/list.jsp");
		model.addAttribute("email", "herbing@naver.com");
		return "index";
	}


	
	// 플래너 조회 페이지로 이동
	@GetMapping("/show")
	public String show(HttpServletResponse response, HttpServletRequest request, HttpSession session,
					@RequestParam("plan_No") Long plan_No, PlannerReplyVO rvo, Model model) {

		Criteria cri = new Criteria();
		PlannerVO pvo = new PlannerVO();
		ScrapVO scvo = new ScrapVO();

		String email = (String)session.getAttribute("email");
		if(email == null) {
			email = "";
		}
		
		// 전체 플래너 수 카운트		
		int totalReply = replyService.totalReplyCount(plan_No);
		
		pvo.setEmail(email);
		pvo.setPlan_No(plan_No);
		
		scvo.setEmail(email);
		scvo.setPlan_No(plan_No);
		
		//좋아요 상태 추가
		model.addAttribute("likeStatus", service.check_User(pvo));
		//스크랩 상태 추가
		model.addAttribute("scrapStatus", service.checkScrap(scvo));
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
		//등록일 순으로 플래너 리스트 가져와서 추가
		model.addAttribute("plannerList", service.getList(cri));
		//추천순으로 플래너 리스트 가져와서 추가
		model.addAttribute("popular_PlannerList", service.get_Popular_PlannerList());
		//페이지 include 처리
		model.addAttribute("page", "planner/show.jsp");
		
		return "index";
	}
	
	
	
	// 플래너 저장
	@PostMapping("/save")
	@ResponseBody
	public ResponseEntity<HashMap<String, PlannerVO>> savePlanner(PlannerVO pvo) {
															
		HashMap<String, PlannerVO> map = new HashMap<String, PlannerVO>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		Date date = new Date();
		String sysdate = sdf.format(date);
		
		log.info(pvo);
		
		//플래너 번호가 없으면 DB에 insert
		if(pvo.getPlan_No() == null) {
			service.save(pvo);
		}else {
			service.update(pvo);
		}
		
		pvo.setUpdateDate(sysdate);
		map.put("list", pvo);
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	
	// 플래너 게시
	@PostMapping("/register")
	public  ResponseEntity<HashMap<String, PlannerVO>> registePlanner(PlannerVO pvo) {
				
		HashMap<String, PlannerVO> map = new HashMap<String, PlannerVO>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		Date date = new Date();
		String sysdate = sdf.format(date);
		pvo.setStatus(1);
		log.info(pvo);
		
		//플래너 번호가 없으면 DB에 insert
		if(pvo.getPlan_No() == null) {
			service.save(pvo);
		}else {
			service.update(pvo);
		}
		pvo.setUpdateDate(sysdate);
		map.put("list", pvo);
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	// 플래너 삭제
	@PostMapping("/delete")
	@ResponseBody
	public ResponseEntity<HashMap<String, String>> deletePlanner(@RequestParam("plan_No") Long plan_No){
		
		HashMap<String, String> map = new HashMap<String, String>();
		log.info(plan_No);
		//플래너 DB에서 삭제
		service.delete(plan_No);
		map.put("message", "success");
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	
	// 플래너 정보 가져오기
	@PostMapping("/getPlannerInfo")
	@ResponseBody
	public ResponseEntity<HashMap<String, PlannerVO>> getPlannerInfo(PlannerVO pvo) {
															
		HashMap<String, PlannerVO> map = new HashMap<String, PlannerVO>();
		
		log.info(pvo);
		Long plan_No = pvo.getPlan_No();
		map.put("data", service.getPlanner(plan_No).get(0));
		
		return new ResponseEntity<>(map, HttpStatus.OK);
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
	
	
	
	// 스크랩
	@PostMapping("/scrap")
	@ResponseBody
	public ResponseEntity<HashMap<String, String>> addLike(ScrapVO scvo){
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		if(!scvo.isStatus()) {
			service.insertScrap(scvo);
			map.put("result", "insert");
		}else {
			service.deleteScrap(scvo);
			map.put("result", "delete");
		}
		
		//좋아요 추가 기능 실행 후, 성공 or 실패 여부 판단
		
		
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