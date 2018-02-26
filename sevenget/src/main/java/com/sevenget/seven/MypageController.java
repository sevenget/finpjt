package com.sevenget.seven;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.company.InterestedRCDAO;
import model.intercompany.InterCompBean;
import model.intercompany.InterCompDaoImpl;
import model.member.MemBasicInfoDAO;

@Controller
public class MypageController {
	
	/*@RequestMapping(value = "include/interComp", method= RequestMethod.GET)
	public String interComp(Locale locale, Model model){
		System.out.println("1");
		return "include/interComp";
	}*/
	
	
	@RequestMapping(value="/include/interComp", method= RequestMethod.GET)
	public String interComp(MemBasicInfoDAO DAO, HttpServletRequest request){
		
		/*request.setAttribute("id", DAO.getMemBasicInfo(""));*/ 
		return "include/interComp";
	}
	
	//마이페이지1
	@RequestMapping(value = "/main/mypage", method = RequestMethod.GET)
	public String Mypage(MemBasicInfoDAO DAO, InterestedRCDAO CDAO ,HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("id");
		request.setAttribute("member", DAO.getMemBasicInfo(id));
		request.setAttribute("company", CDAO.selectRelatedAll(id));
		System.out.println("mypage");
		return "main/mypage"; 
	}

	//마이페이지2s
	@RequestMapping(value = "/main/mypage2", method = RequestMethod.GET)
	public String Mypage2(Locale locale, Model model) {

		return "main/mypage2";
	}

	
}
