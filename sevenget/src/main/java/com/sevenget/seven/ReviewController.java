package com.sevenget.seven;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.company.InterestedRCDAO;
import model.member.MemBasicInfoDAO;
import model.review.ReviewDaoImpl;
import model.review.ReviewDto;

@Controller
public class ReviewController {

	// 기업 상세페이지
	@RequestMapping(value = "/main/detailpage", method = RequestMethod.GET)
	public ModelAndView DetailP(ReviewDaoImpl reviewDao, HttpServletRequest request) {
		MemBasicInfoDAO DAO = new MemBasicInfoDAO();
		InterestedRCDAO CDAO = new InterestedRCDAO();
		
		String id = "mem"; // 파라메터로 받아오기
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("review", reviewDao.selectReview());
		mav.addObject("member", DAO.getMemBasicInfo(id));
		mav.addObject("company", CDAO.selectRelatedAll(id));
		
		
		
		mav.setViewName("main/detailpage");
		//request.setAttribute("review", reviewDao.selectReview());
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
	@RequestMapping(value = "/main/review", method = RequestMethod.GET)
	/* public String ReviewP(Locale locale, Model model) { */
	public String ReviewP(ReviewDaoImpl reviewDao, HttpServletRequest request) {
		// DAO.selectReview();

		int cid = 1;
		request.setAttribute("review", reviewDao.selectReview());

		request.setAttribute("cnt", reviewDao.getListCount()); // 전체 댓글 수

		System.out.println("review");

		// request.setAttribute("id", reviewDao.selectReview(id));

		return "main/review";
	}

}
