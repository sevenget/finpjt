package com.sevenget.seven;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.review.ReviewDaoImpl;
import model.review.ReviewDto;

@Controller
public class ReviewController {

	// 기업 상세페이지
	@RequestMapping(value = "/main/detailpage", method = RequestMethod.GET)
		public String DetailP(MemBasicInfoDAO DAO, HttpServletRequest request) {
			
			request.setAttribute("id", DAO.getMemBasicInfo(""));
			return "main/detailpage";
		}
	 
	
	public String DetailP(ReviewDaoImpl reviewDao, HttpServletRequest request, HttpSession session) {
		
		// 댓글 전체 불러오기
		//ReviewDto reviewDto = new ReviewDto();
		//reviewDto = reviewDao.selectReview();
		int cid=1;
		System.out.println(reviewDao.selectReview()+"wawawa");
		request.setAttribute("review", reviewDao.selectReview());
		
		System.out.println("detailpage");

		request.setAttribute("id", reviewDao.selectReview());//??
		return "main/detailpage";
	}

	// 기업 상세페이지-리뷰
	@RequestMapping(value = "/main/review", method = RequestMethod.GET)
	/*public String ReviewP(Locale locale, Model model) {*/
	public String ReviewP(ReviewDaoImpl DAO, HttpServletRequest request) {
		//DAO.selectReview();
		
		int cid=1;
			request.setAttribute("review", reviewDao.selectReview().);
			
			request.setAttribute("cnt", reviewDao.getListCount()); // 전체 댓글 수
			
			System.out.println("review");
	
			//request.setAttribute("id", reviewDao.selectReview(id));
	
			return "main/review";
		}

}
