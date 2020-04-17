package org.adt.controller;


import org.adt.service.CityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/trip/city")
public class TripinfoController {

	@Autowired
	private CityService cservice;
/*
 * 순서는
1 홈
2 기본정보
3 지도보기
4 명소
5 맛집
6 테마
7 쇼핑
8 추천플래너
10 상세페이지

 */
//	@GetMapping("/paris")
//	public ModelAndView main(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,
//			@RequestParam("Type") String Type) throws IOException {

//		String urlMain = "";
//
//		if (Type == null) {
//			urlMain = m.paris;
//			System.out.println("1성공");
//			model.addAttribute("pageNum_Home", 1);
//			
//		} else if (Type.equals("2")) {
//			System.out.println("2성공!");
//			urlMain = m.jeju;
//			model.addAttribute("pageNum_Home", 2);
//			
//		} else if (Type.equals("3")) {
//			System.out.println("3성공!");
//			model.addAttribute("pageNum_Home", 3);
//			
//		} else if (Type.equals("4")) {
//			System.out.println("4성공!");
//			urlMain = m.paris;//추천명소
//			model.addAttribute("pageNum_Home", 4);
//			
//		} else if (Type.equals("5")) {
//			System.out.println("5!추천플래너페이지");
//			model.addAttribute("pageNum_Home", 5);
//			
//		}
//
//		response.setContentType("text/html; charset=utf-8");
//		PrintWriter writer = response.getWriter();
//		System.out.println("test!"); /// test
//		String url = "http://www.tourtips.com/dest/list/" + urlMain; // 크롤링할 url지정
//		Document doc = null; // Document에는 페이지의 전체 소스가 저장
//		try {
//			doc = Jsoup.connect(url).get();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		Elements element = doc.select("div.spot_list");
//		System.out.println("test");
//		Iterator<Element> ie1 = element.select("strong.title").iterator(); // div.info
//		Iterator<Element> ie2 = element.select("p.star").iterator(); // div.txt_trans strong.title
//		Iterator<Element> ie3 = element.select("div.category").iterator();
//		while (ie1.hasNext()) {
//			m.setNameUSA(ie1.next().text());
//			m.setNameUSA(ie2.next().text());
//			m.setNameUSA(ie3.next().text());
//		}
//		model.addAttribute("element", element);
//		model.addAttribute("Type", Type);
//		model.addAttribute("str_list", m.getNameUSA());
//		
//		ModelAndView mav=new ModelAndView();
//		mav.addObject("str_list", m.getNameUSA());
//		mav.setViewName("trip/trip_main");
//		
//		
//		//System.out.println("ghkrdls"+m.getNameUSA());
//		
////		model.addAttribute("list", cservice.read(spot_No));
////		System.out.println(cservice.getList());
//
//		
//		//model.addAttribute(cservice.read());
//	//	System.out.println(cservice.read());
//	//	System.out.println("abc : "+ cservice);
//		return mav;
//	}

	static final String PARIS_EUFFELTOWER = "1_1";
	static final String PARIS_MONTMARTRE = "1_5";
	

	@GetMapping("/paris")
	public String main(@RequestParam("Type") String Type, Model model) throws Exception {
		log.info("type = " + Type);
		
		if (Type.equals(PARIS_EUFFELTOWER)) {
			System.out.println("10!상세페이지");
			model.addAttribute("pageNum_Home", 11);
		}
		if (Type.equals(PARIS_MONTMARTRE)) {
			System.out.println("10!상세페이지");
			model.addAttribute("pageNum_Home", 15);
		}
////////////////////
		
		if (Type == null) {
			System.out.println("1성공");
			model.addAttribute("pageNum_Home", 1);

		} else if (Type.equals("2")) {
			System.out.println("2성공!");
			model.addAttribute("pageNum_Home", 2);

		} else if (Type.equals("3")) {
			System.out.println("3성공!");
			model.addAttribute("pageNum_Home", 3);

		} else if (Type.equals("4")) {
			System.out.println("str[1] , 명소");
			model.addAttribute("pageNum_Home", 4);

			model.addAttribute("list", cservice.read(1));
			System.out.println(cservice.read(1));//전체출력

		}  else if(Type.equals("5")) {
			System.out.println("5! 맛집");
			model.addAttribute("pageNum_Home", 5);
			//model.addAttribute("list", cservice.read());
		}	else if(Type.equals("6")) {
			System.out.println("6! 테마");
			model.addAttribute("pageNum_Home", 6);
		}	else if(Type.equals("7")) {
			System.out.println("7! 쇼핑");
			model.addAttribute("pageNum_Home", 7);
		}else if (Type.equals("8")) {
			System.out.println("8!추천플래너페이지");
			model.addAttribute("pageNum_Home", 8);

		}else if (Type.equals("10")) {

			System.out.println("10!상세페이지");
			model.addAttribute("pageNum_Home", 10);
		
	}
		return "trip/trip_main";
}}