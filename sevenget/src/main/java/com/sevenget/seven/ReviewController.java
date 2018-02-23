package com.sevenget.seven;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sevenget.Rcode.MakingPlot;

import model.member.MemBasicInfoDAO;
import model.member.MemBasicInfoDTO;
import model.member.MemLoginDao;
import model.review.ReviewDaoImpl;

@Controller
public class ReviewController {

	// 기업 상세페이지
	@RequestMapping(value = "/main/detailpage", method = RequestMethod.GET)
		public String DetailP(MemBasicInfoDAO DAO, HttpServletRequest request) {
			
			request.setAttribute("id", DAO.getMemBasicInfo(""));
			return "main/detailpage";
		}
	 
	

	// 기업 상세페이지-리뷰
	@RequestMapping(value = "/main/review", method = RequestMethod.GET)
	/*public String ReviewP(Locale locale, Model model) {*/
	public String ReviewP(ReviewDaoImpl DAO, HttpServletRequest request) {
		//DAO.selectReview();
		
	    request.setAttribute("cid", DAO.selectReview().getCid());
	    request.setAttribute("writer", DAO.selectReview().getWriter());
	    request.setAttribute("reviewdate", DAO.selectReview().getReviewdate());
	    request.setAttribute("content", DAO.selectReview().getContent());

		
		return "main/review";
	}

}
