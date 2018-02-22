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
		public ModelAndView main(KeywordAndSearchDAO dao, HttpSession session, ModelAndView mav) {
			session.setAttribute("id", "mem");
			String id = (String)session.getAttribute("id");
			
			mav.addObject("companylist", dao.searchAdvs());
			mav.setViewName("main/main");
			
			if(id.equals("Guest")){
				mav.setViewName("main/main_guest");
			} 
			return mav;
		}
		
		// 로그인 전 검색페이지
			@RequestMapping(value = "/main/search")
			public ModelAndView search(SearchDTO sdto, KeywordDTO kdto, KeywordAndSearchDAO kdao, CompanyBasicDAO cdao, ModelAndView mav, HttpSession session) {
				if(!kdto.getKeyword().equals("")){
					kdao.insertKeyword(kdto.getKeyword());
				} else{
					kdao.insertKeyword(".X");
				};

				sdto.setSearchMem((String)session.getAttribute("id"));
				kdao.insertSearch(sdto);
				
				List<CompanyBasicDTO> companylist = kdao.searchByKeyword(kdto.getKeyword());
				mav.addObject("companylist", companylist);
				mav.setViewName("main/searchmain");
				return mav;
			}
			
}
