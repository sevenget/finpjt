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
<<<<<<< HEAD
		public String DetailP(MemBasicInfoDAO DAO, HttpServletRequest request) {
			
			request.setAttribute("id", DAO.getMemBasicInfo(""));
			return "main/detailpage";
		}
	 
	
=======
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
>>>>>>> branch 'master' of https://github.com/sevenget/finpjt.git

	// 기업 상세페이지-리뷰
	@RequestMapping(value = "/main/review", method = RequestMethod.GET)
<<<<<<< HEAD
	/*public String ReviewP(Locale locale, Model model) {*/
	public String ReviewP(ReviewDaoImpl DAO, HttpServletRequest request) {
		//DAO.selectReview();
		
	    request.setAttribute("cid", DAO.selectReview().getCid());
	    request.setAttribute("writer", DAO.selectReview().getWriter());
	    request.setAttribute("reviewdate", DAO.selectReview().getReviewdate());
	    request.setAttribute("content", DAO.selectReview().getContent());
=======
	public String ReviewP(ReviewDaoImpl reviewDao, HttpServletRequest request) {
		// DAO.selectReview();
>>>>>>> branch 'master' of https://github.com/sevenget/finpjt.git

		/*request.setAttribute("cid", DAO.selectReview().getCid());
		request.setAttribute("writer", DAO.selectReview().getWriter());
		request.setAttribute("reviewdate", DAO.selectReview().getReviewdate());
		request.setAttribute("content", DAO.selectReview().getContent());*/
		
		int cid=1;
		System.out.println(reviewDao.selectReview()+"wawawa");
		request.setAttribute("review", reviewDao.selectReview().);
		
		System.out.println("review");

		//request.setAttribute("id", reviewDao.selectReview(id));

		return "main/review";
	}

}
