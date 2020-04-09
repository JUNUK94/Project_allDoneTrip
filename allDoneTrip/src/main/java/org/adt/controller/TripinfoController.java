package org.adt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adt.domain.CityDTOList;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/trip/city")
public class TripinfoController {

	/*
	@RequestMapping(value = "/main") //+4.7 수정 없어도 될듯 이후 수정예정
	public String trip_main(Model model) {
		// System.out.println("11성공!");
		// model.addAttribute("pageNum_Home", 1);
		return "trip/trip_main";
	}
*/
	@RequestMapping(value = "/paris", method = RequestMethod.GET)
	public ModelAndView main(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "Type", required = false) String Type) throws IOException {
		Name_National m = new Name_National();
		String urlMain = "";

		if (Type == null) {
			urlMain = m.paris;
			System.out.println("1성공");
			model.addAttribute("pageNum_Home", 1);
			
		} else if (Type.equals("2")) {
			System.out.println("2성공!");
			urlMain = m.jeju;
			model.addAttribute("pageNum_Home", 2);
			
		} else if (Type.equals("3")) {
			System.out.println("3성공!");
			model.addAttribute("pageNum_Home", 3);
			
		} else if (Type.equals("4")) {
			System.out.println("4성공!");
			urlMain = m.paris;//추천명소
			model.addAttribute("pageNum_Home", 4);
			
		} else if (Type.equals("5")) {
			System.out.println("5!추천플래너페이지");
			model.addAttribute("pageNum_Home", 5);
			
		}

		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		System.out.println("test!"); /// test
		String url = "http://www.tourtips.com/dest/list/" + urlMain; // 크롤링할 url지정
		Document doc = null; // Document에는 페이지의 전체 소스가 저장
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements element = doc.select("div.spot_list");
		System.out.println("test");
		Iterator<Element> ie1 = element.select("strong.title").iterator(); // div.info
		Iterator<Element> ie2 = element.select("p.star").iterator(); // div.txt_trans strong.title
		Iterator<Element> ie3 = element.select("div.category").iterator();
		while (ie1.hasNext()) {
			m.setNameUSA(ie1.next().text());
			m.setNameUSA(ie2.next().text());
			m.setNameUSA(ie3.next().text());
		}
		model.addAttribute("element", element);
		model.addAttribute("Type", Type);
		model.addAttribute("str_list", m.getNameUSA());
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("str_list", m.getNameUSA());
		mav.setViewName("trip/trip_main");
		
		
		//System.out.println("ghkrdls"+m.getNameUSA());

		return mav;
	}


}
