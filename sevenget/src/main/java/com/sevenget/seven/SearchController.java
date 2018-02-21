package com.sevenget.seven;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.company.CompanyBasicDAO;
import model.company.CompanyBasicDTO;
import model.search.KeywordAndSearchDAO;
import model.search.KeywordDTO;
import model.search.SearchDTO;

@Controller
public class SearchController {
		// 진짜 메인페이지(로그인 후 첫화면)
		@RequestMapping(value = "/main/main", method = RequestMethod.GET)
		public String main(HttpSession session) {
			session.setAttribute("id", "mem");
			String id = (String)session.getAttribute("id");
	
			if(id.equals("Guest")){
				return "main/guestmain";
			} 
			return "main/main";
		}
		
		// 로그인 전 검색페이지
			@RequestMapping(value = "/main/search", method = RequestMethod.GET)
			public ModelAndView search(SearchDTO sdto, KeywordDTO kdto, KeywordAndSearchDAO kdao, CompanyBasicDAO cdao, ModelAndView mav) {
				kdao.insertKeyword(kdto.getKeyword());
				kdao.insertSearch(sdto);
				List<CompanyBasicDTO> companylist = kdao.searchByKeyword(kdto.getKeyword());
				mav.addObject("companylist", companylist);
				mav.setViewName("main/main");
				return mav;
			}
			
}
