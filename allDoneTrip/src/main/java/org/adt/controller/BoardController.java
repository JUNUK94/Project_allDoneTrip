package org.adt.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.print.attribute.standard.Severity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;
import org.adt.domain.PageDTO;
import org.adt.domain.PlannerVO;
import org.adt.domain.ReplyVO;
import org.adt.service.BoardService;
import org.adt.service.ReplyService;
import org.adt.service.plannerService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/community/*")
public class BoardController {

	private BoardService service;

	private ReplyService replyService;

	private plannerService plannerService;

	@GetMapping({ "/list", "/" })
	public String list(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("boardlist", service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("page", "community/list.jsp");

		return "index";
	}

	@PostMapping("/register")
	public void register(HttpServletResponse response, Criteria cri, BoardVO board, RedirectAttributes rttr, Model model) {

		log.info("register: " + board);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");
		Date date = new Date();
		String sysdate = sdf.format(date);
		
		board.setRegdate(sysdate);

		service.Insert(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		log.info("test");
		
		try {
			response.sendRedirect("https://alldonetrip.shop/community/list");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@GetMapping("/write")
	public String write(Criteria cri, Model model) {
		log.info("Write");
		
		model.addAttribute("page", "community/write.jsp");
		
		return "index";
	}

	@GetMapping({ "/view", "/modify" })
	public String get(HttpServletResponse response, HttpServletRequest request, @RequestParam("bno") Long bno,
			@ModelAttribute("cri") Criteria cri, Model model) {

		log.info(bno);

		service.checkCookie(response, request, bno);

		int totalReply = replyService.totalReplyCnt(bno);
		
		List<PlannerVO> test = plannerService.getPlanner(84l);
		
		log.info(test.get(0).getCity_Name());
		
		log.info("/view or modify");
		model.addAttribute("board", service.get(bno));
		model.addAttribute("planner", plannerService.getPlanner(84l));
		model.addAttribute("reply", replyService.getReplyList(bno));
		model.addAttribute("totalReply", totalReply);
		model.addAttribute("reReply", replyService.getReReplyList(bno));
		model.addAttribute("page", "community/view.jsp");

		return "index";
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, Model model) {
		log.info("modify:" + board);

		if (service.update(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		model.addAttribute("page", "community/list.jsp");
		
		return "index";
	}

	@PostMapping("/delete")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr, Model model) {

		log.info("remove..." + bno);
		if (service.delete(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		model.addAttribute("page", "community/list");
		
		return "redirect:/board/list";
	}

	// 게시판 댓글 등록
	@PostMapping("/replyWrite")
	@ResponseBody
	public ResponseEntity<HashMap<String, ReplyVO>> replyWrite(ReplyVO rno) {

		HashMap<String, ReplyVO> map = new HashMap<String, ReplyVO>();

		// 날짜, 시간 구분해서 원하는 형식으로 조합
		String date[] = rno.getRegdate().split("/");
		String sysdate = date[0] + " " + date[1];

		// ReplyVO의 regdate 변수에 날짜+시간 set하기
		rno.setRegdate(sysdate);

		log.info("ddd");

		// 댓글 DB에 입력
		replyService.replyWrite(rno);
		map.put("list", rno);

		return new ResponseEntity<HashMap<String, ReplyVO>>(map, HttpStatus.OK);
	}

	// 게시판 대댓글(답글) 등록
	@PostMapping("/reReplyWrite")
	@ResponseBody
	public ResponseEntity<HashMap<String, ReplyVO>> reReplyWrite(ReplyVO rno) {

		HashMap<String, ReplyVO> map = new HashMap<String, ReplyVO>();

		// 날짜, 시간 구분해서 원하는 형식으로 조합
		String date[] = rno.getRegdate().split("/");
		String sysdate = date[0] + " " + date[1];

		// ReplyVO의 regdate 변수에 날짜+시간 set하기
		rno.setRegdate(sysdate);

		// 댓글 DB에 입력
		replyService.reReplyWrite(rno);
		map.put("list", rno);

		return new ResponseEntity<HashMap<String, ReplyVO>>(map, HttpStatus.OK);
	}

	// 게시판 댓글 삭제
	@PostMapping("/replyDelete")
	@ResponseBody
	public ResponseEntity<HashMap<String, String>> replyDelete(ReplyVO rno) {

		HashMap<String, String> map = new HashMap<String, String>();

		// 댓글 DB에서 삭제 실행 후 성공 or 실패 여부 판단
		boolean result = replyService.replyDelete(rno);
		String message = "댓글 삭제 실패";

		if (result) {
			message = "댓글 삭제 성공";
		}

		map.put("message", message);
		map.put("bno", "" + rno.getBno());
		map.put("rno", "" + rno.getRno());

		return new ResponseEntity<>(map, HttpStatus.OK);
	}

}
