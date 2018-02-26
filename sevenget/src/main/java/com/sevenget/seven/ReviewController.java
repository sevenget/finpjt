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
	public String DetailP(ReviewDaoImpl reviewDao, HttpServletRequest request, HttpSession session) {
		
		// 댓글 전체 불러오기
		//ReviewDto reviewDto = new ReviewDto();
		//reviewDto = reviewDao.selectReview();
		int cid=1;
		request.setAttribute("review", reviewDao.selectReview());
		
		System.out.println("detailpage");

		return "main/detailpage";
	}

	// 기업 상세페이지-리뷰
	@RequestMapping(value = "/main/review", method = RequestMethod.GET)
	public String ReviewP(ReviewDaoImpl reviewDao, HttpServletRequest request) {
		// DAO.selectReview();

		/*request.setAttribute("cid", DAO.selectReview().getCid());
		request.setAttribute("writer", DAO.selectReview().getWriter());
		request.setAttribute("reviewdate", DAO.selectReview().getReviewdate());
		request.setAttribute("content", DAO.selectReview().getContent());*/
		
		int cid=1;
		request.setAttribute("review", reviewDao.selectReview());
		
		request.setAttribute("cnt", reviewDao.getListCount()); // 전체 댓글 수
		
		System.out.println("review");

		//request.setAttribute("id", reviewDao.selectReview(id));

		return "main/review";
	}

}
