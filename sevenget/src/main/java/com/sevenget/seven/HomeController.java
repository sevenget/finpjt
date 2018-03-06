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
import org.springframework.web.servlet.ModelAndView;

import com.sevenget.Rcode.Evaluation;
import com.sevenget.Rcode.MakingPlot;

import model.company.InterestedRCDAO;
import model.companySco.CompanyScoDto;
import model.member.MemBasicInfoDAO;
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
	public ModelAndView Loading(PlotsDaoImpl DAO, HttpSession session, HttpServletRequest request){
		String id = (String) session.getAttribute("id");
		int cid = (int) session.getAttribute("cid");
		
		System.out.println("loading을 시작합니다. 빙글빙글");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/loading");

		session.setAttribute("id", id);
		session.setAttribute("cid", cid);

		return mav;
	}
	
	// loading
	@RequestMapping(value = "/main/mplot", method = RequestMethod.GET)
	public ModelAndView MPlot(PlotsDaoImpl DAO, HttpSession session, HttpServletRequest request/*, @RequestParam("id") String id*/) throws REXPMismatchException, REngineException{
		String id = (String) session.getAttribute("id");
		int cid = (int) session.getAttribute("cid");
		
		System.out.println("mplotmplotmplotmplotmplotmplotmplot");
		ModelAndView mav = new ModelAndView();

		System.out.println(cid);
				
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
		plotName = mplot.mPlot(CScoDto, id);
		System.out.println("R종료");
		
		// plot 이름 지정 완료
		System.out.println("저장된 plot이름 : "+plotName);
		
		// plot
		System.out.println("++++++++++++++++++++++++++++++++");
		PlotsDaoImpl plotDao = new PlotsDaoImpl();
		System.out.println("최종 입력 전 아이디 확인"+id);
		PlotsDto plotDto = plotDao.insertOrUpdatePlots(id, plotName, cid);
		System.out.printf("최종 입력 후 전체 데이터 확인",plotDto.getMemid(),plotDto.getCid(),plotDto.getPlotpng(),plotDto.getSavedTime());
		System.out.println("++++++++++++++++++++++++++++++++");
		
		
		/*request.setAttribute("id", plotDto.getMemid());
		request.setAttribute("cid", plotDto.getCid());
		request.setAttribute("plotpng", plotDto.getPlotpng());
*/
		System.out.println("로딩페이지 뜬다!!! id : "+plotDto.getMemid()+" cid : "+plotDto.getCid());
		
		
		mav.addObject("id", plotDto.getMemid());
		mav.addObject("cid",plotDto.getCid());
		mav.addObject("plotpng",plotDto.getPlotpng());
		
		mav.setViewName("main/mplot");
		
		session.setAttribute("id", id);
		session.setAttribute("cid", cid);
		session.setAttribute("plotpng", plotName);
		
		return mav;
	}

	// loadContent
	@RequestMapping(value = "/main/loadContent", method = RequestMethod.GET)
	public String LContent(PlotsDaoImpl DAO, HttpSession session, HttpServletRequest request) {
		String id = (String) session.getAttribute("id");
		int cid = (int) session.getAttribute("cid");
		
		System.out.println("/main/loadContent");
		System.out.println(session.getAttribute("id")+", "+session.getAttribute("cid"));
		System.out.println(session.getAttribute("plotpng"));
		request.setAttribute("plotpng", session.getAttribute("plotpng"));// mem을 어떻게 받아와야....
		
		session.setAttribute("id", id);
		session.setAttribute("cid", cid);

		return "main/loadContent";
	}

}
