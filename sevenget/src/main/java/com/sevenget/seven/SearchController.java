package com.sevenget.seven;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.company.CompanyBasicDAO;
import model.company.InterestedRCDAO;
import model.company.InterestedRCDTO;
import model.member.MemBasicInfoDAO;
import model.member.MemBasicInfoDTO;
import model.member.MemConcernDAO;
import model.member.MemConcernDto;
import model.search.FilterDTO;
import model.search.KeywordAndSearchDAO;
import model.search.KeywordDTO;
import model.search.SearchDTO;

@Controller
public class SearchController {
		// 진짜 메인페이지(로그인 후 첫화면)
		@RequestMapping(value = "/main/main", method = RequestMethod.GET)
		public ModelAndView main(MemBasicInfoDAO mbdao, MemConcernDAO mcdao, KeywordAndSearchDAO kdao, InterestedRCDAO idao, HttpSession session, ModelAndView mav) {
			/*session.setAttribute("id", "mem");*/
			String id = (String)session.getAttribute("id");
			System.out.println(id);
			if(id==null) {
				mav.setViewName("redirect:/main/login");
				return mav;
			}
			
			MemConcernDto memCon = mcdao.getMemConcern(id);
			List list = kdao.searchByFilter(getFilterByMemberCon(memCon));
			
			if(list.size()>0&&!id.equals("Guest")){
				mav.addObject("companylist", list);
				session.setAttribute("interestedComList", idao.selectRelatedAll(id));
			}
			
			if(id.equals("Guest")||list.size()==0){
				mav.addObject("companylist", kdao.searchAdvs());		
			}
			
			List memList = (List) mbdao.getMemBasicInfo(id);
			
			if(memList.size()>0){
				mav.addObject("member", memList.get(0));
			}
			mav.setViewName("main/main");
			return mav;
		}
		
		// 로그인 전 검색페이지
			@RequestMapping(value = "/main/search")
			public ModelAndView search(MemBasicInfoDAO mbdao, FilterDTO fdto, SearchDTO sdto, KeywordDTO kdto, KeywordAndSearchDAO kdao, InterestedRCDAO idao, CompanyBasicDAO cdao, ModelAndView mav, HttpSession session) {
				//키워드가 ""이 들어왔을 때 예외 처리
				
				if(!kdto.getKeyword().equals("")){
					kdao.insertKeyword(kdto.getKeyword());
				} else{
					kdao.insertKeyword(".X");
					sdto.setKeyword(".X");
				};
				
				String id = (String)session.getAttribute("id");
				
				if(id==null) {
					mav.setViewName("redirect:/main/login");
					return mav;
				}
				
				List memList = (List) mbdao.getMemBasicInfo(id);
				
				if(memList.size()>0){
					mav.addObject("member", memList.get(0));
				}
				sdto.setSearchMem(id);
				kdao.insertSearch(sdto);
					
	  /*			System.out.println("======== get=====");				
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
				*/
				session.setAttribute("filterMap", fdto.getFilterMap());
				session.setAttribute("interestedComList", idao.selectRelatedAll(id));
				List list = kdao.searchByKeywordAndFilter(kdto.getKeyword(), fdto);
				mav.addObject("companylist", list);
				mav.setViewName("main/search");
				
				if(list.size()==0){
					mav.addObject("nothing", true);
				}

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
			
			
			public FilterDTO getFilterByMemberCon(MemConcernDto memCon){
				
				List<Integer> list = new ArrayList<Integer>();
				
				list.add(memCon.getDateCon());
				list.add(memCon.getMarryCon());
				list.add(memCon.getBabyCon());
				list.add(memCon.getHouseCon());
				list.add(memCon.getRelationCon());
				list.add(memCon.getDreamCon());
				list.add(memCon.getHopeCon());
				
				int max1 = 0;
				int max2 = 0;
				
				for(int e : list){
					if(e>max1){
						max2=max1;
						max1 = e;
					} else if(e>max2){
						max2=e;
					}
				}
				FilterDTO fdto = new FilterDTO();
				if(memCon.getDateCon()>=max2){
					fdto.setDateget("T");
				} else{
					fdto.setDateget("N");
				}
				
				if(memCon.getMarryCon()>=max2){
					fdto.setMarryget("T");
				}else{
					fdto.setMarryget("N");
				}
				
				if(memCon.getBabyCon()>=max2){
					fdto.setBabyget("T");
				}else{
					fdto.setBabyget("N");
				}
				
				if(memCon.getHouseCon()>=max2){
					fdto.setHouseget("T");
				}else{
					fdto.setHouseget("N");
				}
				
				if(memCon.getRelationCon()>=max2){
					fdto.setRelationget("T");
				}else{
					fdto.setRelationget("N");
				}
				
				if(memCon.getDreamCon()>=max2){
					fdto.setDreamget("T");
				}else{
					fdto.setDreamget("N");
				}
				
				if(memCon.getHopeCon()>=max2){
					fdto.setHopeget("T");
				}else{
					fdto.setHopeget("N");
				}
	
				return fdto;
			}
			

}
