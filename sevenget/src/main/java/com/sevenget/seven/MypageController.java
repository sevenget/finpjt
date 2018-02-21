package com.sevenget.seven;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.intercompany.InterCompBean;
import model.intercompany.InterCompDaoImpl;

@Controller
public class MypageController {
	
	/*@RequestMapping(value = "include/interComp", method= RequestMethod.GET)
	public String interComp(Locale locale, Model model){
		System.out.println("1");
		return "include/interComp";
	}*/
	
	
	@RequestMapping(value="/include/interComp")
	public ModelAndView mypage_interComp_select(HttpServletRequest request, HttpServletResponse response, InterCompDaoImpl interService){
		System.out.println("셀렉트");
		List<InterCompBean> bean = null;
		ModelAndView m = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		bean=interService.inter_list();
		m.addObject("list",bean);
		m.setViewName("include/interComp");
		
		return m;
	}
	
}
