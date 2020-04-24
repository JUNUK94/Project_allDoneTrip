package org.adt.controller;


import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.adt.domain.MemberVO;
import org.adt.domain.NaverLoginBO;
import org.adt.mapper.MemberMapper;
import org.adt.service.MemberService;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Autowired
	private MemberService mService;

	@Autowired
	private MemberMapper mMapper;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	@GetMapping("/loginMain")
	public ModelAndView loginMain(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("email");
		if(email != null) {
			mav.setViewName("index");
			mav.addObject("page", "mainBody.jsp");
			return mav;
		}else {
			String kakaoUrl = kakaoController.getAuthorizationUrl(session);
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			/* 생성한 인증 URL을 View로 전달 */
			mav.setViewName("index");
			mav.addObject("page", "login/loginMain.jsp");
			// 네이버 로그인
			mav.addObject("naver_url", naverAuthUrl);
			// 카카오 로그인
			mav.addObject("kakao_url", kakaoUrl);
			log.info("메이이이이인");
			return mav;
		}
	}
	
	@GetMapping("/logout")
	public String loginout(HttpSession session, Model model) {
		
		session.invalidate();
		model.addAttribute("page", "mainBody.jsp");

		return "index"; 
	}
	
	@RequestMapping(value = "/kakaoLogin", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST }) 
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView(); 
		// 결과값을 node에 담아줌 
		JsonNode node = kakaoController.getAccessToken(code); 
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음 
		JsonNode accessToken = node.get("access_token"); 
		// 사용자의 정보
		
		System.out.println(accessToken);
		
		
		JsonNode userInfo = kakaoController.getKakaoUserInfo(accessToken);
		
		// 유저정보 카카오에서 가져오기 Get properties 
		JsonNode properties = userInfo.path("properties"); 
		JsonNode kakao_account = userInfo.path("kakao_account"); 
		String email = kakao_account.path("email").asText(); 
		String nickName = properties.path("nickname").asText(); 
		String image = properties.path("profile_image").asText(); 
		String gender = kakao_account.path("gender").asText(); 
		String birthday = kakao_account.path("birthday").asText(); 
		String age = kakao_account.path("age_range").asText(); 
//		session.setAttribute("name", name); 
//		session.setAttribute("image", image); 
//		session.setAttribute("gender", gender); 
//		session.setAttribute("birthday", birthday); 
//		session.setAttribute("age", age); 
		MemberVO member = new MemberVO();
		member.setEmail(email);
		log.info(member.getEmail());
		boolean status = mService.emailCheck(member.getEmail());
		System.out.println(status);
		if(!status) {
			session.setAttribute("email", email); 
			
//			session.setAttribute("name", name); 
//			session.setAttribute("image", image); 
//			session.setAttribute("gender", gender); 
//			session.setAttribute("birthday", birthday); 
//			session.setAttribute("age", age); 
			mav.setViewName("index");
			mav.addObject("page", "mainBody.jsp");
			return mav; 
		}
		else{
			mav.setViewName("index");
			mav.addObject("page", "login/signUp/kakaoSignUp.jsp");
			mav.addObject("Email", email);
			mav.addObject("nickName", nickName);
			mav.addObject("profile_image", image);
			System.out.println("우아아아아아아아아앙"+mav);
			return mav; 
		}
	}

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		
	this.naverLoginBO = naverLoginBO;
	
	}
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(Model model, HttpSession session) {
	/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
	//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
	System.out.println("네이버:" + naverAuthUrl);
	//네이버
	model.addAttribute("url", naverAuthUrl);
	return "redirect_uri="+naverAuthUrl;
	}
	
	
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/signUp/naverSignUp", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverSignUp(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	log.info("여기는 callback");
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	//response의 nickname값 파싱
	String email = (String)response_obj.get("email");
	String nickname = (String)response_obj.get("nickname");
	String name = (String)response_obj.get("name");
	System.out.println(nickname+"---"+email+"---"+name);
	
	//가입한 이메일이 있는지 확인
	MemberVO member = new MemberVO();
	member.setEmail(email);
	log.info(member.getEmail());
	boolean status = mService.emailCheck(member.getEmail());
	
	System.out.println(status);
	
	if(!status) {
		session.setAttribute("email",email); //세션 생성
		model.addAttribute("result", apiResult);
		model.addAttribute("page", "mainBody.jsp");
		return "index";
	}else {
		model.addAttribute("email",email);
		model.addAttribute("nickName",nickname);
		model.addAttribute("result", apiResult);
		model.addAttribute("page", "login/signUp/naverSignUp.jsp");
		return "index";
	}
	
	
	
	
	}

	
	
	
	
	
	
	
	
	@GetMapping("/search")
	public void search() {
		
	}
	
	@PostMapping("/idSearch")
	public String idSearch(@RequestParam("name") String name, @RequestParam("phone_Num") int phone_Num, Model model) {
		MemberVO member = new MemberVO();
		member.setName(name);
		member.setPhone_Num(phone_Num);
		log.info(member.getName()+member.getPhone_Num());
		
		String searchResult = mService.idSearch(member.getName(), member.getPhone_Num());
		String msg1 = "아이디는 ";
		String msg2 = "입니다. ";
		log.info("searchResult = " + searchResult);
		
		model.addAttribute("searchResult", searchResult);
		model.addAttribute("msg1", msg1);
		model.addAttribute("msg2", msg2);
		model.addAttribute("page", "/login/searchResult.jsp");
		return "index";
	}
	
	@PostMapping("/pwSearch")
	public String pwSearch(@RequestParam("email") String email, @RequestParam("phone_Num") int phone_Num, Model model) {
		MemberVO member = new MemberVO();
		member.setEmail(email);
		member.setPhone_Num(phone_Num);
		log.info(member.getEmail());
		
		String searchResult = mService.pwSearch(member.getEmail(), member.getPhone_Num());
		String msg1 = "비밀번호는 ";
		String msg2 = "입니다. ";
		log.info("searchResult = " + searchResult);
		
		model.addAttribute("searchResult", searchResult);
		model.addAttribute("msg1", msg1);
		model.addAttribute("msg2", msg2);
		model.addAttribute("page", "/login/searchResult.jsp");
		return "index";
	}
	
	@GetMapping("/login")
	public ModelAndView login(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String email = (String)session.getAttribute("email");
		
		if(email != null) {
			mav.setViewName("index");
			mav.addObject("page", "mainBody.jsp");
			return mav;
		}else {
			String kakaoUrl = kakaoController.getAuthorizationUrl(session);
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			/* 생성한 인증 URL을 View로 전달 */
			mav.setViewName("index");
			mav.addObject("page", "login/loginMain.jsp");
			// 네이버 로그인
			mav.addObject("naver_url", naverAuthUrl);
			// 카카오 로그인
			mav.addObject("kakao_url", kakaoUrl);
			return mav;
		}
		
	}


	@GetMapping("/signUp/allDoneSignUp")
	public void allDoneSignUp() {
		
	}
	
	
	@RequestMapping(value = "/signUpList", method = RequestMethod.GET)
	public ModelAndView memberLoginForm(HttpSession session) {
	ModelAndView mav = new ModelAndView();
	/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
	//String naverAuthUrl = naverLoginDTO.getAuthorizationUrl(session);
	String kakaoUrl = kakaoController.getAuthorizationUrl(session);
	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	/* 생성한 인증 URL을 View로 전달 */
	mav.setViewName("index");
	mav.addObject("page", "login/signUpList.jsp");
	// 네이버 로그인
	mav.addObject("naver_url", naverAuthUrl);
	// 카카오 로그인
	mav.addObject("kakao_url", kakaoUrl);
	return mav;
	}// end memberLoginForm()
	
	
	@RequestMapping(value = "/signUp/kakaoSignUp", method = { RequestMethod.GET, RequestMethod.POST }) 
	public void kakaoSignUp(){ 
		
			
		}

		
	@PostMapping(value ="/insertMember",produces = "text/plain; charset=UTF-8")
	public String insertMember(MemberVO member, HttpSession session, Model model) {
		System.out.println("탓당");
		String certSession = (String)session.getAttribute("certOK");
		
			if(certSession.equals("성공") ) {
					model.addAttribute("page", "login/loginMain.jsp");
					
					mService.join(member);
					log.info(member);
					return "index";
				}else {
					model.addAttribute("page","login/signUp/allDoneSignUp.jsp");
					
					return "index";
			}

		
		
	}

	// 이메일 중복채크
	@ResponseBody
	@GetMapping(value = "/inputCheck", produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> emailCheck(@RequestParam("email") String email, HttpSession session) {

		MemberVO member = new MemberVO();
		member.setEmail(email);
		log.info(member.getEmail());

		boolean status = mService.emailCheck(member.getEmail());
		log.info("status = " + status);
		String message = "";
		if (status) {
			if (member.getEmail().contains("@")) {
				message = "사용하실 수 있는 이메일입니다.";
				session.setAttribute("ableEmail", email);
			} else {
				message = "올바른 이메일형식이아닙니다.";
				
			}
		} else {
			message = "이미 사용중인 이메일입니다.";
		}

		return new ResponseEntity<>(message, HttpStatus.OK);
	}

	// 닉넴 중복채크
	@ResponseBody
	@GetMapping(value = "/nick_NameCheck", produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> nick_NameCheck(@RequestParam("nick_Name") String nick_Name, HttpSession session) {

		MemberVO member = new MemberVO();
		member.setNick_Name(nick_Name);
		log.info(member.getNick_Name());

		boolean status = mService.nick_NameCheck(member.getNick_Name());
		log.info("status = " + status);
		String message = "";
		if (status) {
			if (nick_Name.length() > 1) {
				message = "사용하실 수 있는 닉네임입니다.";
				session.setAttribute("ableNick", nick_Name);
			} else {
				message = "사용할 수 없는 닉네임입니다.";
			}
		} else {
			message = "이미 사용중인 닉네임입니다.";
		}

		return new ResponseEntity<>(message, HttpStatus.OK);
	}

	@ResponseBody
	@RequestMapping("/loginCheck")
	public ResponseEntity<String> loginCheck(@RequestParam("email") String email, @RequestParam("pw") String pw,
			MemberVO member, HttpSession session, Model model) {
		
		HttpHeaders responseHeaders = new HttpHeaders(); // 헤더변경 시 사용
		responseHeaders.add("Content-Type", "text/html; charset=utf-8"); 
		
		member.setEmail(email);
		member.setPw(pw);
		String nick_Name = mService.nick(email);
		String profile = mService.profile(email);
		boolean status = mService.loginCheck(member);
		log.info(status);
		String msg = "";
		if (status) {
			msg = "성공";
			session.setAttribute("email", email);
			session.setAttribute("nick_Name", nick_Name);
			session.setAttribute("profile", profile);
			System.out.println(session.getAttribute("nick_Name"));
			model.addAttribute("page", "mainBody.jsp");
		} else {
			msg = "실패";
			model.addAttribute("page", "/login/loginMain.jsp");
		}
		
		log.info(msg);
		return new ResponseEntity<>(msg,responseHeaders, HttpStatus.OK);
	}
	//인증메일 보안문자 만들기
	private int certCharLength = 8;
	private final char[] characterTable = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
											'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
											'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };


	public String excuteGenerate() {
		Random random = new Random(System.currentTimeMillis());
        int tablelength = characterTable.length;
        StringBuffer buf = new StringBuffer();
        
        for(int i = 0; i < certCharLength; i++) {
            buf.append(characterTable[random.nextInt(tablelength)]);
        }
        
        return buf.toString();
    }

	//인증메일 게터
    public int getCertCharLength() {
        return certCharLength;
    }
    //인증메일 세터
    public void setCertCharLength(int certCharLength) {
        this.certCharLength = certCharLength;
    }


	// mailForm
	  @RequestMapping(value = "/signUp/sendMail")
	  public String mailForm() {
		  
	    return "login/signUp/sendMail";
	  }  
	
	// mailSending 코드
	  @RequestMapping(value = "/mailSending")
	  public ResponseEntity<String> mailSending(HttpServletRequest request, @RequestParam("email") String email,HttpSession session, Model model) {
		System.out.println("시자아아아악");
		LoginController ex = new LoginController();
		ex.setCertCharLength(8);
		String setfrom = "alldonetrip.shop@gmail.com";   
		String tomail  = email;     // 받는 사람 이메일
		String title   = "올던트립 인증 번호 입니다";      // 제목
		String content = ex.excuteGenerate();    // 내용
	    
		
	    try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail);     // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content);  // 메일 내용 
			mailSender.send(message);
	    } catch(Exception e){
	    	System.out.println(e);
	    }
	    
	    session.setAttribute("certNum", content);
	    model.addAttribute("page", "login/signUp/allDoneSignUp.jsp");
	    return new ResponseEntity<>("index",HttpStatus.OK);
	  }
	
	  // mailSending 코드
	  @RequestMapping(value = "/mailCheck", produces = "text/plain; charset=UTF-8")
	  public ResponseEntity<String> mailCheck(@RequestParam("certNum") String certNum, HttpSession session){
		  String cert = (String)session.getAttribute("certNum");
		  System.out.println("cert = "+cert);
		  String message="";
		  
		  if(cert.equals(certNum)) {
			  message = "성공";
			  session.setAttribute("certOK", message);
		  }else {
			  message = "실패";
		  }
		  System.out.println("message = "+message);
		  return new ResponseEntity<>(message, HttpStatus.OK);
	  }

}
