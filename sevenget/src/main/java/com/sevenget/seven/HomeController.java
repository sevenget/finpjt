package com.sevenget.seven;

import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sevenget.Rcode.Evaluation;
import com.sevenget.Rcode.MakingPlot;

import model.company.InterestedRCDAO;
import model.companySco.CompanyRawScoDaoImpl;
import model.companySco.CompanyRawScoDto;
import model.companySco.CompanyScoDaoImpl;
import model.companySco.CompanyScoDto;
import model.companySco.PublicRawScoDaoImpl;
import model.companySco.PublicRawScoDto;
import model.member.MemBasicInfoDAO;
import model.member.MemBasicInfoDTO;
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
	public String mainPractice(MemBasicInfoDAO DAO, InterestedRCDAO CDAO, HttpServletRequest request,HttpSession session,Locale locale, Model model) {
		String id = (String)session.getAttribute("id");
		System.out.println("/main/joeh "+id);
		
		return "main/joeh";
	}
	
	// loading
	@RequestMapping(value = "/main/loading", method = RequestMethod.GET)
	public ModelAndView MPlot(PlotsDaoImpl DAO, HttpSession session, HttpServletRequest request, @RequestParam("cid") int cid/*, @RequestParam("id") String id*/) throws REXPMismatchException, REngineException{
		ModelAndView mav = new ModelAndView();

		System.out.println("loading을 시작합니다. 빙글빙글");
		System.out.println(cid);
		String id = (String)session.getAttribute("id"); // 파라메터로 받아오기
		
		if(id==null){
			mav.setViewName("redirect:/main/login");
			return mav;
		}
		//String id = "mem"; // 세션..
		System.out.println("아이디 세션으로 받아와 봄! id : " + id);

		CompanyScoDto CScoDto = new CompanyScoDto(); 

		//DB에서 R로 넘길 정보 받아오기(Raw 점수 받아오고, 가공해서 다시 CompanyScoDto에 저장!)
		System.out.println("************점수 계산 시작***********");
		Evaluation ev = new Evaluation();
		// 기능1
		CScoDto = ev.FinalSco(cid,id); // 반환해서 R로 넘길 준비 완료..
		System.out.println("************점수 계산 완료***********");
		
		MakingPlot mplot = new MakingPlot();
		String plotName=null;
		
		// plot 뽑는 중..
		System.out.println("R시작");
		// 기능2
		plotName = mplot.mPlot(CScoDto);
		System.out.println("R종료");
		
		// plot 이름 지정 완료
		System.out.println("저장된 plot이름 : "+plotName);
		
		// plot
		PlotsDaoImpl plotDao = new PlotsDaoImpl();
		System.out.println("여기요요기요*********************"+id);
		PlotsDto plotDto = plotDao.insertOrUpdatePlots(id, plotName, cid);
		System.out.printf("여기요요기요2***********%s\t%s\t%s\t%s\n",plotDto.getMemid(),plotDto.getCid(),plotDto.getPlotpng(),plotDto.getSavedTime());
		System.out.println("++++++++++++++++++++++++++++++++");
		System.out.println("+++++"+plotDto.getMemid());
		System.out.println("+++++"+plotDto.getCid());
		System.out.println("+++++"+plotDto.getPlotpng());
		System.out.println("++++++++++++++++++++++++++++++++");
		
		
		/*request.setAttribute("id", plotDto.getMemid());
		request.setAttribute("cid", plotDto.getCid());
		request.setAttribute("plotpng", plotDto.getPlotpng());
*/
		System.out.println("로딩페이지 뜬다!!! id : "+plotDto.getMemid()+" cid : "+plotDto.getCid());
		
		
		mav.addObject("id", plotDto.getMemid());
		mav.addObject("cid",plotDto.getCid());
		mav.addObject("plotpng",plotDto.getPlotpng());
		
		mav.setViewName("main/loading");
		
		session.setAttribute("id", id);
		session.setAttribute("cid", cid);
		session.setAttribute("plotpng", plotName);
		
		return mav;
	}

	// loadContent
	@RequestMapping(value = "/main/loadContent", method = RequestMethod.GET)
	public String LContent(PlotsDaoImpl DAO, HttpSession session, HttpServletRequest request) {
		System.out.println("/main/loadContent");
		System.out.println(session.getAttribute("id")+", "+session.getAttribute("cid"));
		request.setAttribute("plotpng", DAO.inquiryId((String)session.getAttribute("id"),(Integer)session.getAttribute("cid")).getPlotpng());// mem을 어떻게 받아와야....
		System.out.println("***********************************"+DAO.inquiryId((String)session.getAttribute("id"),(Integer)session.getAttribute("cid")).getPlotpng());
		
		
		
/*		request.setAttribute("plotpng", DAO.inquiryId("mem").getPlotpng());// mem을 어떻게 받아와야....
		System.out.println("***********************************"+DAO.inquiryId("mem").getPlotpng());
*/
		
		return "main/loadContent";
	}

}
