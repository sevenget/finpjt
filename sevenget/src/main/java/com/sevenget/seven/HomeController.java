package com.sevenget.seven;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
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
import model.companySco.CompanyScoDto;
import model.member.MemBasicInfoDAO;
import model.member.MemBasicInfoDTO;
import model.member.MemIdCheckDaoImpl;
import model.member.MemLoginDao;
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

	/*
	// 기업 상세페이지
	@RequestMapping(value = "/main/detailpage", method = RequestMethod.GET)
	public String DetailP(Locale locale, Model model) {

		return "main/detailpage";
	}

	// 기업 상세페이지-리뷰
	@RequestMapping(value = "/main/review", method = RequestMethod.GET)
	public String ReviewP(Locale locale, Model model) {

		return "main/review";
	}
	*/
	
	// 로그인
	@RequestMapping(value = "/main/login", method = RequestMethod.GET)

	public String Login(HttpSession session, Locale locale, Model model) {
		
		String id = (String)session.getAttribute("id");
		
		return "main/login";
	}
	
	
	// 로그인 체크
	@RequestMapping(value = "/main/loginCheck", method = RequestMethod.GET)
	public ModelAndView loginCheck(String id,String pw, MemLoginDao dao,MemBasicInfoDTO dto,
			ModelAndView mav, HttpSession session, HttpServletResponse response) {
		
		System.out.println("로그인 ID = "+id+" 입력한 PW = "+pw);
		dto = dao.loginCheck(id,pw);
		
		if(dto == null){
			System.out.println("컨트롤러 - 로그인 실패");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
				return null;
			} catch (IOException e) {
				System.out.println("HomeController -> loginCheck -> PrintWriter 변수 생성 오류");
			}
            return null;
		}else{
			System.out.println("컨트롤러 - 로그인 성공");
			session.setAttribute("id", id);
			mav.setViewName("main/loginCheck");
			return mav;
		}
		
		
	}
	
	@RequestMapping(value = "/main/logOut", method = RequestMethod.GET)
	public ModelAndView loginCheck(MemLoginDao dao, ModelAndView mav, HttpSession session) {
		
		session.invalidate();
		
		mav.setViewName("main/logOut");
		return mav;
	}

	// 회원가입
	@RequestMapping(value = "/main/register", method = RequestMethod.GET)
	public String Register(Locale locale, Model model) {

		return "main/register";
	}
	
	//@아이디 중복확인
	@RequestMapping(value="/main/checkID", method = RequestMethod.GET)
	public ModelAndView CheckId(ModelAndView mav,@RequestParam("id")String id){
		MemIdCheckDaoImpl dao = new MemIdCheckDaoImpl();
		int check = dao.Check(id);
		
		mav.addObject("id",id);
		mav.addObject("check",check);
		mav.setViewName("main/member_id_check");
		return mav;
	}
	
	// 회원가입 하기
	@RequestMapping(value="/main/insertUser", method = RequestMethod.POST)
	public ModelAndView insertMember(ModelAndView mav,@RequestParam("id")String id,
			@RequestParam("password")String password,@RequestParam("name")String name,@RequestParam("birth") String birth,
			@RequestParam("gender")String gender,@RequestParam("address")String address,
			@RequestParam("email")String email,@RequestParam("dream")int dream,
			@RequestParam("marry")int marry,@RequestParam("child")int child,
			@RequestParam("home")int home,@RequestParam("job")int job,
			@RequestParam("love")int love,@RequestParam("human")int human){
		MemBasicInfoDAO dao = new MemBasicInfoDAO();
		MemBasicInfoDTO dto = new MemBasicInfoDTO();
		
		dto.setId(id);
		dto.setPassword(password);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setGender(gender);
		dto.setAddress(address);
		dto.setEmail(email);
		
		dto.setDream(dream);
		dto.setMarry(marry);
		dto.setChild(child);
		dto.setHome(home);
		dto.setJob(job);
		dto.setLove(love);
		dto.setHuman(human);
		
		dao.insertMember(dto);
		
		mav.setViewName("main/login");
		return mav;
	}
	
	//마이페이지1
	@RequestMapping(value = "/main/mypage", method = RequestMethod.GET)
	public String Mypage(MemBasicInfoDAO DAO, InterestedRCDAO CDAO ,HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("id");
		request.setAttribute("member", DAO.getMemBasicInfo(id));
		request.setAttribute("company", CDAO.selectRelatedAll(id));
		System.out.println("mypage");
		return "main/mypage"; 
	}
	
	//마이페이지2s
	@RequestMapping(value = "/main/mypage2", method = RequestMethod.GET)
	public String Mypage2(Locale locale, Model model) {

		return "main/mypage2";
	}

	/*
	 * //MakingPlot
	 * 
	 * @RequestMapping(value = "/main/mypage2", method = RequestMethod.GET)
	 * public ModelAndView MPlot(Locale locale, Model model) { ModelAndView mav
	 * = new ModelAndView();
	 * 
	 * mav.addObject("a");
	 * 
	 * return mav; }
	 */

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
