package com.sevenget.seven;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import model.member.MemBasicInfoDAO;

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
	public String ReviewP(Locale locale, Model model) {

		
		return "main/review";
	}


}
