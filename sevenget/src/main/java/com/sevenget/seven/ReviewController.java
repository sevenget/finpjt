package com.sevenget.seven;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.company.CompanyBasicDAO;
import model.company.InterestedRCDAO;
import model.company.InterestedRCDTO;
import model.member.MemBasicInfoDAO;
import model.plots.PlotsDaoImpl;
import model.plots.PlotsDto;
import model.review.ReviewDaoImpl;
import model.review.ReviewDto;

@Controller
public class ReviewController {

	// 기업 상세페이지
	@RequestMapping(value = "main/detailpage", method = RequestMethod.GET)
	public ModelAndView DetailP(ReviewDaoImpl reviewDao, InterestedRCDAO idao, MemBasicInfoDAO mdao,CompanyBasicDAO cdao, HttpServletRequest request,HttpSession session, @RequestParam int cid) {
		String id = (String)session.getAttribute("id"); // 세션으로 받아오기
		System.out.println("main/detailpage "+id);
		
		ModelAndView mav = new ModelAndView();
		if(id==null){
			mav.setViewName("redirect:/main/login");
			return mav;
		}
		
		InterestedRCDTO idto = new InterestedRCDTO();
		idto.setMemid(id);
		idto.setCid(cid);
		idto = idao.selectRelatedOne(idto);
		if(idto!=null){
			mav.addObject("isInterested", "T");
		} else{
			mav.addObject("isInterested", "F");
		}
		
		PlotsDaoImpl PlotDao = new PlotsDaoImpl();
		PlotsDto PlotDto = new PlotsDto();
		
		try{
			PlotDto = PlotDao.inquiryId(id, cid);
			//System.out.println("있는 Plot "+PlotDto.getPlotpng());
			if(PlotDto.getPlotpng() != null){
				System.out.println("detailpage 불러올건데 plotpng가 있다! 불러올거다!");
				mav.addObject("plotpng", (String)PlotDto.getPlotpng());
				session.setAttribute("plotpng", (String)PlotDto.getPlotpng());
				System.out.println("세션 전송까지 완료");
			}else{
				mav.addObject("plotpng", null);
				System.out.println("detailpage 불러올건데 plotpng가 아마도 없다");
				mav.addObject("plotpng", null);
				session.setAttribute("plotpng", null);
			}
		}catch (Exception e) {
			mav.addObject("plotpng", null);
			System.out.println("detailpage 불러올건데 plotpng가 아마도 없다");
			mav.addObject("plotpng", null);
			session.setAttribute("plotpng", null);
			}
		
		// detailpage로 넘어가기 전에 득포 계산 해줘야함!
		
		
		
		
		mav.addObject("interTimes", idao.getInterTimesByCid(cid));
		mav.addObject("reviewList", reviewDao.selectReview(cid));
		mav.addObject("member", mdao.getMemBasicInfo(id));
		mav.addObject("company",cdao.selectCompany(cid).get(0));
		mav.addObject("cid", cid);
		
		session.setAttribute("id", id);
		session.setAttribute("cid", cid);
		
		mav.setViewName("main/detailpage");
		return mav;
	}
	
	
	// 리뷰 db등록
		/*@RequestMapping(value = "/main/insert", method = RequestMethod.GET)
		public ModelAndView ReveiwInsert(ReviewDaoImpl reviewDao, @RequestParam String writer, @RequestParam String content, HttpSession session) {
			int cid = 1;
			
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("content", reviewDao.insertReview(writer,cid,content));
			mav.setViewName("main/detailpage");
			//request.setAttribute("review", reviewDao.selectReview());

			return mav;
		}*/

	// 기업 상세페이지-리뷰
	@RequestMapping(value = "/main/review", method = RequestMethod.POST)
	public ModelAndView ReviewP(ReviewDaoImpl reviewDao, @RequestParam int cid, String type, HttpSession session, ModelAndView mav) {		
		System.out.println(type);
		if(type=="add") {
			
		}
		mav.addObject("reviewList", reviewDao.selectReview(cid));
		mav.addObject("cnt", reviewDao.getListCount()); // 전체 댓글 수
		mav.setViewName("review_"+type+"_include");
		return mav;
	}
	
	@RequestMapping(value = "/main/review", method = RequestMethod.GET)
	/* public String ReviewP(Locale locale, Model model) { */
	public String ReviewAdd(ReviewDaoImpl reviewDao, ReviewDto dto, HttpSession session, ModelAndView mav) {

		reviewDao.insertReview((String)session.getAttribute("id"), dto.getCid(), dto.getContent());
		return "redirect:detailpage?cid="+dto.getCid();
	}

}
