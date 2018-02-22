package com.sevenget.seven;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



import model.member.MemBasicInfoDTO;
import model.member.MemIdCheckDaoImpl;
import model.member.MemLoginDao;


/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	/*@Autowired
	private MakingPlot mPlot;*/
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// 기본으로 설정되어 있던 예제
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
	
	// 연습용 메인페이지
	@RequestMapping(value = "/main/main", method = RequestMethod.POST)
	public ModelAndView mainPractice(String userId, MemLoginDao dao,MemBasicInfoDTO dto, ModelAndView mav) {
		
		dto = dao.loginCheck(userId);
		
		mav.addObject("userId",dto.getId());
		mav.setViewName("main/main");
		return mav;
	}
	
	
	
	//기업 상세페이지
	@RequestMapping(value = "/main/detailpage", method = RequestMethod.GET)
	public String DetailP(Locale locale, Model model) {
		
		
		return "main/detailpage";
	}
	
	//로그인
	@RequestMapping(value = "/main/login", method = RequestMethod.GET)
	public String Login(HttpSession session, Locale locale, Model model) {
		session.setAttribute("id", "mem");
		String id = (String)session.getAttribute("id");
		
		return "main/login";
	}
	
	//회원가입
	@RequestMapping(value = "/main/register", method = RequestMethod.GET)
	public String Register(Locale locale, Model model) {
		
		
		return "main/register";
	}
	
	//@아이디 중복확인
	@RequestMapping(value="/main/checkID", method = RequestMethod.GET)
	public ModelAndView CheckId(String userId, MemIdCheckDaoImpl dao, ModelAndView mav){
		
		mav.addObject("check", dao.Check(userId));
		mav.addObject("userId", userId);
		
		mav.setViewName("main/member_id_check");
		
		return mav;
	}
	
	//마이페이지1
	@RequestMapping(value = "/main/mypage", method = RequestMethod.GET)
	public String Mypage(Locale locale, Model model) {
		
		
		return "main/mypage";
	}
	
	//마이페이지2
	@RequestMapping(value = "/main/mypage2", method = RequestMethod.GET)
	public String Mypage2(Locale locale, Model model) {
		
		
		return "main/mypage2";
	}
	
	/*	//MakingPlot
	@RequestMapping(value = "/main/mypage2", method = RequestMethod.GET)
	public ModelAndView MPlot(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("a");
		
		return mav;
	}*/
	

	
	//loadContent
	@RequestMapping(value = "/main/loadContent", method = RequestMethod.GET)
	public String LContent(Locale locale, Model model) {
		
		return "main/loadContent";
	}
	
}
