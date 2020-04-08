package org.adt.controller;

import org.adt.domain.Criteria;
import org.adt.domain.PageDTO;
import org.adt.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/community/*")
public class BoardController {

	private BoardService service;

//	@GetMapping("/")
//	public String allCommunitylist(Criteria cri, Model model) {
//		System.out.println(service.getList(cri));
//
//		int total = service.boardPaging(cri);
//
//		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, total));
//		return "/community/list";
//	}
	

	@GetMapping("/list")
	public void list(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);

		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

//	@PostMapping("/register")
//	public String register(BoardVO board, RedirectAttributes rttr) {
//
//		log.info("register: " + board);
//
//		service.register(board);
//
//		rttr.addFlashAttribute("result", board.getBno());
//
//		return "redirect:/board/list";
//	}
//
//	// @GetMapping({ "/get", "/modify" })
//	// public void get(@RequestParam("bno") Long bno, Model model) {
//	//
//	// log.info("/get or modify ");
//	// model.addAttribute("board", service.get(bno));
//	// }
//
	@GetMapping({ "/view", "/modify" })
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
	}

	// @PostMapping("/modify")
	// public String modify(BoardVO board, RedirectAttributes rttr) {
	// log.info("modify:" + board);
	//
//	// if (service.modify(board)) {
//	// rttr.addFlashAttribute("result", "success");
//	// }
//	// return "redirect:/board/list";
//	// }
//
//	@PostMapping("/modify")
//	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		log.info("modify:" + board);
//
//		if (service.modify(board)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
//
//		return "redirect:/board/list";
//	}
//
//	// @PostMapping("/remove")
//	// public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr)
//	// {
//	//
//	// log.info("remove..." + bno);
//	// if (service.remove(bno)) {
//	// rttr.addFlashAttribute("result", "success");
//	// }
//	// return "redirect:/board/list";
//	// }
//
//	@PostMapping("/remove")
//	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
//
//		log.info("remove..." + bno);
//		if (service.remove(bno)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
//
//		return "redirect:/board/list";
//	}

}
