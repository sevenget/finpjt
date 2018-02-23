package com.sevenget.seven;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.company.CompanyBasicDAO;
import model.company.InterestedRCDAO;
import model.company.InterestedRCDTO;
import model.search.FilterDTO;
import model.search.KeywordAndSearchDAO;
import model.search.KeywordDTO;
import model.search.SearchDTO;

@Controller
public class SearchController {
		// 진짜 메인페이지(로그인 후 첫화면)
		@RequestMapping(value = "/main/main", method = RequestMethod.GET)
		public ModelAndView main(KeywordAndSearchDAO kdao, InterestedRCDAO idao, HttpSession session, ModelAndView mav) {
			/*session.setAttribute("id", "mem");*/
			String id = (String)session.getAttribute("id");
			
			if(id==null) {
				id="Guest";
			}
			
			mav.addObject("companylist", kdao.searchAdvs());
			session.setAttribute("interestedComList", idao.selectRelatedAll(id));
			
			mav.setViewName("main/main");
			if(id.equals("Guest")){
				mav.setViewName("main/main_guest");
			} 
			return mav;
		}
		
		// 로그인 전 검색페이지
			@RequestMapping(value = "/main/search")
			public ModelAndView search(FilterDTO fdto, SearchDTO sdto, KeywordDTO kdto, KeywordAndSearchDAO kdao, InterestedRCDAO idao, CompanyBasicDAO cdao, ModelAndView mav, HttpSession session) {
				//키워드가 ""이 들어왔을 때 예외 처리
				if(!kdto.getKeyword().equals("")){
					kdao.insertKeyword(kdto.getKeyword());
				} else{
					kdao.insertKeyword(".X");
					sdto.setKeyword(".X");
				};
				
				String id = (String)session.getAttribute("id");
				System.out.println(id+sdto.getKeyword());
				sdto.setSearchMem(id);
				kdao.insertSearch(sdto);
				
				
					
	  			System.out.println("======== get=====");				
				System.out.println(fdto.getDateget());
				System.out.println(fdto.getMarryget());
				System.out.println(fdto.getBabyget());
				System.out.println(fdto.getHouseget());
				System.out.println(fdto.getRelationget());
				System.out.println(fdto.getDreamget());
				System.out.println(fdto.getHopeget());
				System.out.println("======== loss=====");
				System.out.println(fdto.getDateloss());
				System.out.println(fdto.getMarryloss());
				System.out.println(fdto.getBabyloss());
				System.out.println(fdto.getHouseloss());
				System.out.println(fdto.getRelationloss());
				System.out.println(fdto.getDreamloss());
				System.out.println(fdto.getHopeloss());
				System.out.println("====getbyMap===");
				Map map = fdto.getFilterMap();
				for(Object key : map.keySet()){
					System.out.println("key:"+key+", value="+map.get(key));
				}
				
				session.setAttribute("filterMap", fdto.getFilterMap());
				session.setAttribute("interestedComList", idao.selectRelatedAll(id));				
				mav.addObject("companylist", kdao.searchByKeyword(kdto.getKeyword()));


				mav.setViewName("main/search");
				return mav;
			}
			
			@RequestMapping(value = "/main/regInter")
			public String regInter(InterestedRCDAO dao, InterestedRCDTO dto, HttpSession session) {
				dto.setMemid((String)session.getAttribute("id"));
				dao.insertReg(dto);
				return "main/nothing";
			}
			
			@RequestMapping(value = "/main/canInter")
			public String canInter(InterestedRCDAO dao, InterestedRCDTO dto, HttpSession session) {
				dto.setMemid((String)session.getAttribute("id"));
				dao.updateCan(dto);
				return "main/nothing";
			}
}
