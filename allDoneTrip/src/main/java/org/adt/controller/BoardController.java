package org.adt.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.print.attribute.standard.Severity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adt.domain.BoardVO;
import org.adt.domain.Criteria;
import org.adt.domain.PageDTO;
import org.adt.domain.ReplyVO;
import org.adt.service.BoardService;
import org.adt.service.ReplyService;
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

	@GetMapping({ "/list", "/" })
	public String list(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		return "/community/list";
	}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("register: " + board);

		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		// Date date = new Date();
		// String sysdate = sdf.format(date);
		//
		// board.setRegdate(sysdate);

		service.Insert(board);

		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/community/list";
	}

	@GetMapping("/write")
	public String write(Criteria cri) {
		log.info("Write");
		return "/community/write";
	}

	@GetMapping({ "/view", "/modify" })
	public String get(HttpServletResponse response, HttpServletRequest request, @RequestParam("bno") Long bno,
			@ModelAttribute("cri") Criteria cri, Model model) {

		log.info(bno);
		service.checkCookie(response, request, bno);

		int totalReply = replyService.totalReplyCnt(bno);

		
		log.info("/view or modify");

		model.addAttribute("board", service.get(bno));

		model.addAttribute("reply", replyService.getReplyList(bno));

		 model.addAttribute("totalReply", totalReply);
		model.addAttribute("reReply", replyService.getReReplyList(bno));

		return "/community/view";
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.update(board)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/list";
	}

	@PostMapping("/delete")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + bno);
		if (service.delete(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

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
