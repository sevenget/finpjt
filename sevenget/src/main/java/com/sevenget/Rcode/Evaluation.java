package com.sevenget.Rcode;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;

import model.companySco.CompanyRawScoDto;
import model.companySco.CompanyScoDto;

// 실행 전 Rserve.R 반드시 실행시키기

public class Evaluation {

	public CompanyScoDto EvalCompanyEPR(CompanyRawScoDto CRScoDto)/* throws REXPMismatchException, REngineException */{
		CompanyScoDto CScoDto = new CompanyScoDto();
		
		// DB에서 받아온 데이터 집어넣기
		CRScoDto.getNoOTEPr(); // 정시퇴근 가능일 수
		CRScoDto.getFlexWorkEPr();// 금요일 조기퇴근(외 탄력근무제 등) 시행 여부
		CRScoDto.getWeekendWorkEPr();// 주말근무 여부
		CRScoDto.getNewcomerSalEPr();// 신입연봉
		CRScoDto.getPaidVacaEPr();// 유급휴가 사용 일 수(연 기준)
		CRScoDto.getCompKindergartenEPr();// 사내 어린이집 등 시설 또는 돌보미 서비스 등의 유무
		CRScoDto.getEduSupportEPr();// 교육비 지원 여부
		CRScoDto.getLoanSupportEPr();// 대출지원제도 유무
		CRScoDto.getDormiHousingSupportEPr();// 기숙사/사택 제공 여부
		CRScoDto.getOpClubEPr();// 사내 동호회 운영 여부
		CRScoDto.getSupportClubEPr();// 사내 동호회 지원 여부
		CRScoDto.getClubMemRateEPr();// 실 동호회 가입 인원 비율
		CRScoDto.getSelfDevSupportEPr();// 자기계발 지원비 여부
		CRScoDto.getSeminarInvEPr();// 외부강사 초청 세미나 횟수(한달 기준)
		CRScoDto.getHorizStrucEPr();// 수평적 구조
		CRScoDto.getVarWorkExpEPr();// 다양한 업무 경험이 가능한지 여부
		CRScoDto.getTelAvailEPr();// 재택근무 가능 여부
		CRScoDto.getSalIncreRateEPr();// 연봉인상률
		CRScoDto.getRetireRateEPr();// 퇴사율
		CRScoDto.getBusiGrowthEPr();// 기업성장률
		CRScoDto.getInduGrowthEPr();// 산업성장률
		CRScoDto.getGovSupportEPr();// 정부지원 산업 여부
			
		int dateEPr = (int) (CRScoDto.getNoOTEPr()*1 + CRScoDto.getFlexWorkEPr()*2.5 + CRScoDto.getWeekendWorkEPr()*2.5);
		int marriageEPr =  CRScoDto.getNewcomerSalEPr()/3000 + CRScoDto.getPaidVacaEPr()/5 + CRScoDto.getNoOTEPr()*1 + CRScoDto.getWeekendWorkEPr()*1;
		int babyEPr = (int) (CRScoDto.getFlexWorkEPr()*2.5 + CRScoDto.getPaidVacaEPr()*2.5/15 + CRScoDto.getCompKindergartenEPr()*2.5 + CRScoDto.getEduSupportEPr()*2.5);
		int houseEPr = CRScoDto.getLoanSupportEPr()*4 + CRScoDto.getDormiHousingSupportEPr()*6;
		int relationshipEPr =(int) (CRScoDto.getOpClubEPr()*1.5 +  CRScoDto.getSupportClubEPr()*1.5 + CRScoDto.getClubMemRateEPr()/50 + CRScoDto.getNoOTEPr());
		int dreamEPr = CRScoDto.getSelfDevSupportEPr()*1 + CRScoDto.getSeminarInvEPr()/5 + CRScoDto.getHorizStrucEPr()*1 + CRScoDto.getVarWorkExpEPr()*1 + CRScoDto.getTelAvailEPr()*1;
		int hopeEPr = CRScoDto.getSalIncreRateEPr()/20 + (1-CRScoDto.getRetireRateEPr()/50) + CRScoDto.getBusiGrowthEPr()/100 + CRScoDto.getInduGrowthEPr()/50 + CRScoDto.getGovSupportEPr()*1;
		
		int EvaluationPrP = dateEPr + marriageEPr + babyEPr + houseEPr + relationshipEPr + dreamEPr + hopeEPr;

		System.out.println("연애=" + dateEPr);
		System.out.println("결혼=" + marriageEPr);
		System.out.println("출산및육아=" + babyEPr);
		System.out.println("내집마련=" + houseEPr);
		System.out.println("인간관계=" + relationshipEPr);
		System.out.println("꿈=" + dreamEPr);
		System.out.println("희망=" + hopeEPr);
		System.out.println("기업평가60%=" + EvaluationPrP);
		
		CScoDto.setCid(CRScoDto.getCid());
		CScoDto.setDateSco(dateEPr);
		CScoDto.setMarrySco(marriageEPr);
		CScoDto.setBabySco(babyEPr);
		CScoDto.setHouseSco(houseEPr);
		CScoDto.setRelationSco(relationshipEPr);
		CScoDto.setDreamSco(dreamEPr);
		CScoDto.setHopeSco(dreamEPr);
		
		return CScoDto;
	}
	
	
	
	public void EvalCompanyPUP() throws REXPMismatchException, REngineException {

		RConnection connection = null;
		connection = new RConnection();

		// DB에서 받아온 데이터 집어넣기
		connection.eval("noOTPuP <- 10");
		connection.eval("flexible_Work_SchemePuP <- 10");
		connection.eval("weekendWorkPuP <- 10");
		connection.eval("walking_on_eggshellsPuP <- 10");
		connection.eval("financial_supportPuP <- 10");
		connection.eval("dormitory_Companyhousing_SupportPuP <- 10");
		connection.eval("loan_supportPuP <- 10");
		connection.eval("self_development_supportPuP <- 10");
		connection.eval("appropriate_amount_of_work <- 10");
		connection.eval("sufficient_salary <- 10");
		connection.eval("related_system_after_marriage <- 10");
		connection.eval("childcare_leave <- 10");
		connection.eval("guaranteed_reinstatement <- 10");
		connection.eval("vacation <- 10");
		connection.eval("mood_environment_improvement <- 10");
		connection.eval("dining_together <- 10");
		connection.eval("money_management_coaching <- 10");
		
		REXP i =  connection.eval("datePuP <- (noOTPuP*(46/79) + weekendWorkPuP*15/79 + walking_on_eggshellsPuP*6/79 + Financial_supportPuP*6/79 + appropriate_amount_of_work*6/79)*6.8/10 ");
		REXP j = connection.eval("marriagePuP <- (Related_system_after_marriage*18/62 + sufficient_salary*13/62 + walking_on_eggshellsPuP*11/62 + noOTPuP*11/62 + Financial_supportPuP*9/62)*6.8/10 ");
		REXP k = connection.eval("babyPuP <- (childcare_leave*24/65 + Guaranteed_reinstatement*13/65 + vacation*11/65 + walking_on_eggshellsPuP*9/65 + Financial_supportPuP*8/65)*6.8/10");
		REXP l = connection.eval("housePuP <- (sufficient_salary*29/52 + Loan_supportPuP*13/52 + Dormitory_Companyhousing_SupportPuP*6/52 + Money_management_coaching*4/52)*6.8/10 ");
		REXP m = connection.eval("relationshipPuP <- (noOTPuP*29/58 + mood_environment_improvement*11/58 + weekendWorkPuP*8/58 + Flexible_Work_SchemePuP*5/58 +Dining_together*5/58)*6.8/10 ");
		REXP n = connection.eval("dreamPuP <- (Self_development_supportPuP*30/44 + noOTPuP*14/44)*3/10 ");
		REXP o = connection.eval("hopePuP <- (sufficient_salary*20/36 + mood_environment_improvement*9/36 + noOTPuP*7/36)*3/10");
		
		REXP p = connection.eval("EvaluationPuP <- datePuP + marriagePuP + babyPuP + housePuP + relationshipPuP + dreamPuP + hopePuP");
		
		int datePuP = i.asInteger();
		int marriagePuP = j.asInteger();
		int babyPuP = k.asInteger();
		int housePuP = l.asInteger();
		int relationshipPuP = m.asInteger();
		int dreamPuP = n.asInteger();
		int hopePuP = o.asInteger();
		int EvaluationPuP = p.asInteger();

		System.out.println("연애=" + datePuP);
		System.out.println("결혼=" + marriagePuP);
		System.out.println("출산및육아=" + babyPuP);
		System.out.println("내집마련=" + housePuP);
		System.out.println("인간관계=" + relationshipPuP);
		System.out.println("꿈=" + dreamPuP);
		System.out.println("희망=" + hopePuP);
		System.out.println("기업평가40%=" + EvaluationPuP);
		

	}



}
