package com.sevenget.seven;

import java.util.Locale;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import model.company.InterCompDaoImpl;
import model.company.InterestedRCDAO;
import model.member.MemBasicInfoDAO;
import model.member.MemBasicInfoDTO;
import model.member.MemConcernDAO;
import model.member.MemConcernDto;
import model.search.KeywordAndSearchDAO;
import model.company.CompanyBasicDTO;

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
	public ModelAndView Mypage(MemBasicInfoDAO mbdao, MemConcernDAO mcdao,InterCompDaoImpl comDao, KeywordAndSearchDAO kdao, MemBasicInfoDAO DAO, InterestedRCDAO CDAO ,HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("id");
		request.setAttribute("member", DAO.getMemBasicInfo(id));
		List<CompanyBasicDTO> list;
		list = comDao.selectInterComp(id);
		request.setAttribute("company", list);
		ModelAndView mav = new ModelAndView();
		MemConcernDto mcdto = mcdao.getMemConcern(id);
		mav.addObject("recommendList", kdao.searchByFilter(SearchController.getFilterByMemberCon(mcdto)));
		mav.addObject("recentKeywords", kdao.selectSearchById(id));
		mav.addObject("mostSearched", kdao.selectMostSearched());
		
		mav.setViewName("main/mypage");
		return mav; 
	}

	//마이페이지2
	@RequestMapping(value = "/main/mypage2", method = RequestMethod.GET)
	public String Mypage2(Locale locale, Model model) {

		return "main/mypage2";
	}
	
	//정보 수정 페이지로 이동
	@RequestMapping(value = "/main/update", method = RequestMethod.GET)
	public String update(MemBasicInfoDAO DAO, InterestedRCDAO CDAO ,HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("id");

		request.setAttribute("member2", DAO.getMemBasicInfo2(id));
		request.setAttribute("member", DAO.getMemBasicInfo(id));
		System.out.println("update");
		return "main/update"; 
	}
	
	//정보 수정후 이동할 페이지
		@RequestMapping(value = "/main/updateUser", method = RequestMethod.POST)
		public String update1(ModelAndView mav,HttpSession session,
				@RequestParam(value="memName", required=false)String name,@RequestParam(value="memBirth", required=false) String birth,
				@RequestParam(value="memAddress", required=false)String address,
				@RequestParam(value="memEmail", required=false)String email,@RequestParam(value="memDateCon", required=false)int dateCon,
				@RequestParam(value="memMarryCon", required=false)int marryCon,@RequestParam(value="memBabyCon", required=false)int babyCon,
				@RequestParam(value="memHouseCon", required=false)int houseCon,@RequestParam(value="memRelationCon", required=false)int relationCon,
				@RequestParam(value="memDreamCon", required=false)int dreamCon,@RequestParam(value="memHopeCon", required=false)int hopeCon) {
			MemBasicInfoDAO dao = new MemBasicInfoDAO();
			MemBasicInfoDTO dto = new MemBasicInfoDTO();
			
			String id =(String) session.getAttribute("id");
			
			dto.setId(id);
			dto.setName(name);
			dto.setBirth(birth);
			dto.setAddress(address);
			dto.setEmail(email);
			dto.setDateCon(dateCon);
			dto.setMarryCon(marryCon);
			dto.setBabyCon(babyCon);
			dto.setHouseCon(houseCon);
			dto.setRelationCon(relationCon);
			dto.setDreamCon(dreamCon);
			dto.setHopeCon(hopeCon);
			
			dao.updateMember(dto);
			
			//mav.setViewName("main/mypage");
			//return mav;
			return "redirect:/main/mypage";
		}
		
		/*@RequestMapping("main/delete.do")
		public String delete(String id, String password, Model model){
			boolean result=memberService.checkPw(id,password);
			if(result){
				memberService.deleteMember(id);
				return "redirect:/main/login";
			}else{
				model.addAllAttributes("message","비밀번호를 확인하세요.");
				model.addAllAttributes("dto",memberservice.viewMember(id));
				return "main/mypage";
			}
		}*/
		

}
