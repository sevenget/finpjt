package com.sevenget.seven;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sevenget.Rcode.MakingPlot;

import model.member.MemBasicInfoDAO;
import model.member.MemBasicInfoDTO;
import model.member.MemLoginDao;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	/*
	 * @Autowired private MakingPlot mPlot;
	 */

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
	@RequestMapping(value = "/main/joeh", method = RequestMethod.GET)
	public String mainPractice(Locale locale, Model model) {

		return "main/joeh";
	}
	
	public ModelAndView mainPractice(HttpSession session, Locale locale, ModelAndView mav) {
		session.setAttribute("id", "mem");
		String id = (String)session.getAttribute("id");
		
		mav.setViewName("main/joeh");
		mav.addObject("id", id);
		return mav;
	}

	/*
	// 기업 상세페이지
	@RequestMapping(value = "/main/detailpage", method = RequestMethod.GET)
	public String DetailP(Locale locale, Model model) {

		return "main/detailpage";
	}

	// 기업 상세페이지-리뷰
	@RequestMapping(value = "/main/review", method = RequestMethod.GET)
	public String ReviewP(Locale locale, Model model) {

		return "main/review";
	}
	*/
	
	// 로그인
	@RequestMapping(value = "/main/login", method = RequestMethod.GET)

	public String Login(HttpSession session, Locale locale, Model model) {
		
		String id = (String)session.getAttribute("id");
		
		return "main/login";
	}
	
	
	// 로그인 체크
	@RequestMapping(value = "/main/loginCheck", method = RequestMethod.GET)
	public ModelAndView loginCheck(String id,String pw, MemLoginDao dao,MemBasicInfoDTO dto,
			ModelAndView mav, HttpSession session, HttpServletResponse response) {
		
		System.out.println("로그인 ID = "+id+" 입력한 PW = "+pw);
		dto = dao.loginCheck(id,pw);
		
		if(dto == null){
			System.out.println("컨트롤러 - 로그인 실패");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
				return null;
			} catch (IOException e) {
				System.out.println("HomeController -> loginCheck -> PrintWriter 변수 생성 오류");
			}
            return null;
		}else{
			System.out.println("컨트롤러 - 로그인 성공");
			session.setAttribute("id", id);
			mav.setViewName("main/loginCheck");
			return mav;
		}
		
		
	}
	
	@RequestMapping(value = "/main/logOut", method = RequestMethod.GET)
	public ModelAndView loginCheck(MemLoginDao dao, ModelAndView mav, HttpSession session) {
		
		session.invalidate();
		
		mav.setViewName("main/logOut");
		return mav;
	}

	// 회원가입
	@RequestMapping(value = "/main/register", method = RequestMethod.GET)
	public String Register(Locale locale, Model model) {

		return "main/register";
	}
	
	//@아이디 중복확인
	@RequestMapping(value="/main/check_id", method = RequestMethod.GET)
	public String CheckId(Locale locale, Model model){
		
		return "main/check_id";
	}
	
	//마이페이지1
	@RequestMapping(value = "/main/mypage", method = RequestMethod.GET)
	public String Mypage(MemBasicInfoDAO DAO, HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("id");
		request.setAttribute("id", DAO.getMemBasicInfo(id));
		System.out.println("mypage");
		return "main/mypage";
	}
	
	//마이페이지2s
	@RequestMapping(value = "/main/mypage2", method = RequestMethod.GET)
	public String Mypage2(Locale locale, Model model) {

		return "main/mypage2";
	}

	/*
	 * //MakingPlot
	 * 
	 * @RequestMapping(value = "/main/mypage2", method = RequestMethod.GET)
	 * public ModelAndView MPlot(Locale locale, Model model) { ModelAndView mav
	 * = new ModelAndView();
	 * 
	 * mav.addObject("a");
	 * 
	 * return mav; }
	 */

	// loading
	@RequestMapping(value = "/main/loading", method = RequestMethod.GET)
	public String MPlot(Locale locale, Model model) {
		MakingPlot mplot = new MakingPlot();
		try {
			System.out.println("R시작");
			mplot.mPlot();
			System.out.println("R종료");
		} catch (REXPMismatchException | REngineException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "main/loading";
	}

	// loadContent
	@RequestMapping(value = "/main/loadContent", method = RequestMethod.GET)
	public String LContent(Locale locale, Model model) {

		return "main/loadContent";
	}

}
