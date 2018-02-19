package com.sevenget.seven;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.search.KeywordDAO;
import model.search.KeywordVO;

@Controller
public class SearchController {
		// 진짜 메인페이지(로그인 후 첫화면)
		@RequestMapping(value = "/main/main", method = RequestMethod.GET)
		public String main(Locale locale, Model model) {
			
			
			return "main/main";
		}
		
		@RequestMapping(value = "/main/main", method = RequestMethod.POST)
		public String mainSearched(String keyword, KeywordDAO dao) {
			KeywordVO vo = new KeywordVO();
			vo.setKeyword(keyword);
			dao.insertKeyword(vo);
			System.out.println("저장되었습니다");
			return "main/main";
		}
		
		// 로그인 전 검색페이지
			@RequestMapping(value = "/main/search", method = RequestMethod.GET)
			public String search(Locale locale, Model model) {
				
				
				return "main/search";
			}
			
}
