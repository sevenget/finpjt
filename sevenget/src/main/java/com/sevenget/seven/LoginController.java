package com.sevenget.seven;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.member.MemBasicInfoDAO;
import model.member.MemBasicInfoDTO;
import model.member.MemIdCheckDaoImpl;
import model.member.MemLoginDao;

/**
 * Handles requests for the application home page.
 */

@Controller
@RequestMapping(value="/main")
public class LoginController {

	// 로그인화면
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String Login(HttpSession session, Locale locale, Model model) {
		
		String id = (String)session.getAttribute("id");
		if(id!=null) {
			return "redirect:/main/main";
		}
		return "main/login";
	}
	
	
	// 로그인 체크
	@RequestMapping(value = "/loginCheck", method = RequestMethod.GET)
	public ModelAndView loginCheck(String id,String pw, MemLoginDao dao,MemBasicInfoDTO dto,
			ModelAndView mav, HttpSession session, HttpServletResponse response) {
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
				System.out.println("LoginController -> loginCheck -> PrintWriter 변수 생성 오류");
			}
            return null;
		}else{
			System.out.printf("컨트롤러 - %s 로그인 성공",id);
			session.setAttribute("id", id);
			mav.setViewName("main/loginCheck");
			return mav;
		}
	}
	
	// 로그아웃
	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public ModelAndView loginCheck(MemLoginDao dao, ModelAndView mav, HttpSession session) {
		session.invalidate();
		mav.setViewName("main/logOut");
		return mav;
	}

	// 회원가입페이지로 이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String Register(Locale locale, Model model) {

		return "main/register";
	}
	
	//@아이디 중복확인
	@RequestMapping(value="/checkID", method = RequestMethod.GET)
	public ModelAndView CheckId(ModelAndView mav,@RequestParam("id")String id){
		MemIdCheckDaoImpl dao = new MemIdCheckDaoImpl();
		int check = dao.Check(id);
		
		mav.addObject("id",id);
		mav.addObject("check",check);
		mav.setViewName("main/member_id_check");
		return mav;
	}
	
	// 회원가입 하기
	@RequestMapping(value="/insertUser", method = RequestMethod.POST)
	public ModelAndView insertMember(ModelAndView mav,@RequestParam("id")String id,
			@RequestParam("password")String password,@RequestParam("name")String name,@RequestParam("birth") String birth,
			@RequestParam("gender")String gender,@RequestParam("address")String address,
			@RequestParam("email")String email,@RequestParam("dateCon")int dateCon,
			@RequestParam("marryCon")int marryCon,@RequestParam("babyCon")int babyCon,
			@RequestParam("houseCon")int houseCon,@RequestParam("relationCon")int relationCon,
			@RequestParam("dreamCon")int dreamCon,@RequestParam("hopeCon")int hopeCon){
		MemBasicInfoDAO dao = new MemBasicInfoDAO();
		MemBasicInfoDTO dto = new MemBasicInfoDTO();
		
		dto.setId(id);
		dto.setPassword(password);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setGender(gender);
		dto.setAddress(address);
		dto.setEmail(email);
		dto.setDateCon(dateCon);
		dto.setMarryCon(marryCon);
		dto.setBabyCon(babyCon);
		dto.setHouseCon(houseCon);
		dto.setRelationCon(relationCon);
		dto.setDreamCon(dreamCon);
		dto.setHopeCon(hopeCon);

		dao.insertMember(dto);
		
		mav.setViewName("main/login");
		return mav;
	}
	
	

}
