package com.sevenget.seven;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
}
