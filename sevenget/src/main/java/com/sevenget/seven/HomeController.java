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

import com.sevenget.Rcode.Evaluation;
import com.sevenget.Rcode.MakingPlot;

import model.companySco.CompanyRawScoDaoImpl;
import model.companySco.CompanyRawScoDto;
import model.companySco.CompanyScoDto;
import model.companySco.PublicRawScoDaoImpl;
import model.companySco.PublicRawScoDto;
import model.plots.PlotsDaoImpl;
import model.plots.PlotsDto;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {

	/*
	 * @Autowired private MakingPlot mPlot;
	 */

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// 기본으로 설정되어 있던 예제
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "home";
	}

	// 연습용 메인페이지
	@RequestMapping(value = "/main/joeh", method = RequestMethod.GET)
	public String mainPractice(Locale locale, Model model) {

		return "main/joeh";
	}
	
	public ModelAndView mainPractice(HttpSession session, Locale locale, ModelAndView mav) {
		session.setAttribute("id", "mem");
		String id = (String)session.getAttribute("id");
		
		mav.setViewName("main/joeh");
		mav.addObject("id", id);
		return mav;
	}

	// loading
	@RequestMapping(value = "/main/loading", method = RequestMethod.GET)
	public String MPlot(PlotsDaoImpl DAO, HttpServletRequest request) throws REXPMismatchException, REngineException{
		//전문 패널 점수
		//점수 환산 과정 1 : raw data
		int cid = 1; // 기업아이디는 파라미터로 받아와야 함!!
		
		CompanyRawScoDaoImpl CRScoDaoImpl = new CompanyRawScoDaoImpl();
		CompanyRawScoDto CRScoDto= CRScoDaoImpl.selectbyCid(cid);
		
		System.out.println("==================================");
		
		System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",
				CRScoDto.getCid(), CRScoDto.getNoOTEPr(),	CRScoDto.getFlexWorkEPr(), CRScoDto.getWeekendWorkEPr(),
				CRScoDto.getNewcomerSalEPr(),CRScoDto.getPaidVacaEPr(),CRScoDto.getCompKindergartenEPr(),CRScoDto.getEduSupportEPr(),
				CRScoDto.getLoanSupportEPr(),CRScoDto.getDormiHousingSupportEPr(),CRScoDto.getOpClubEPr(),CRScoDto.getSupportClubEPr(),
				CRScoDto.getClubMemRateEPr(),CRScoDto.getSelfDevSupportEPr(),CRScoDto.getSeminarInvEPr(),CRScoDto.getHorizStrucEPr(),
				CRScoDto.getVarWorkExpEPr(),CRScoDto.getTelAvailEPr(),CRScoDto.getSalIncreRateEPr(),CRScoDto.getRetireRateEPr(),
				CRScoDto.getBusiGrowthEPr(),CRScoDto.getInduGrowthEPr(),CRScoDto.getGovSupportEPr());
		
		System.out.println(cid+"의 회사 평가를 위해 입력한 Raw Data를 DB에서 받아왔습니다.");
		System.out.println("==================================");

		// 점수 환산 과정 2 : raw data -> 7가지로
		Evaluation evaluation = new Evaluation();
		CompanyScoDto CScoDto = new CompanyScoDto();

		CScoDto = evaluation.EvalCompanyEPR(CRScoDto);
		System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n", CScoDto.getCid(), CScoDto.getDateSco(), CScoDto.getMarrySco(), CScoDto.getBabySco(), CScoDto.getHouseSco(), CScoDto.getRelationSco(), CScoDto.getDreamSco(), CScoDto.getHopeSco());
		
		
		// 일반인 평가
		PublicRawScoDaoImpl PRScoDaoImpl = new PublicRawScoDaoImpl();
		PublicRawScoDto PRScoDto= PRScoDaoImpl.selectbyCid(cid);

		
		
		
		

		//*********************************************
		//PublicRawsco가 없으면 CScoDto의 각 요소에 *10/6 해줘야함!
		//*********************************************
		
		
		
		

		//DB에서 R로 넘길 정보 받아오기(점수)
		
		
		
		String id = "mem";
		
		MakingPlot mplot = new MakingPlot();
		String plotName=null;
		
		// plot 뽑는 중..
		System.out.println("R시작");
		plotName = mplot.mPlot(CScoDto);
		System.out.println("R종료");
		
		// plot 이름 지정 완료
		System.out.println("저장된 plot이름 : "+plotName);
		
		// plot
		PlotsDaoImpl plotDao = new PlotsDaoImpl();
		PlotsDto plotDto = plotDao.insertOrUpdatePlots(id,plotName);
		System.out.printf("%s\t%s\t%s\t%s\t",plotDto.getMemid(),plotDto.getCid(),plotDto.getPlotpng(),plotDto.getSavedTime());

		request.setAttribute("id", DAO.inquiryId(id));

		
		
		
		
		
		
		return "main/loading";
	}

	// loadContent
	@RequestMapping(value = "/main/loadContent", method = RequestMethod.GET)
	public String LContent(PlotsDaoImpl DAO, HttpServletRequest request) {
		
		request.setAttribute("plotpng", DAO.inquiryId("mem").getPlotpng());// mem을 어떻게 받아와야....
		
		return "main/loadContent";
	}

}
