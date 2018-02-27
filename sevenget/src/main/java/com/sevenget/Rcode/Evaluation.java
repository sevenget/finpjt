package com.sevenget.Rcode;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;

import model.companySco.CompanyRawScoDto;
import model.companySco.CompanyScoDto;
import model.companySco.PublicRawScoDto;

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
	
	
	
	public CompanyScoDto EvalCompanyPUP(PublicRawScoDto PRScoDto) throws REXPMismatchException, REngineException {
		CompanyScoDto CScoDto = new CompanyScoDto();

		// DB에서 받아온 데이터 집어넣기
		PRScoDto.setNoOTPuP(10);
		PRScoDto.setFlexWorkPuP(10);
		PRScoDto.setWeekendWorkPuP(10);
		PRScoDto.setEggshellsPuP(10);
		PRScoDto.setFinanSupportPuP(10);
		PRScoDto.setDormiHousingSupportPuP(10);
		PRScoDto.setLoanSupportPuP(10);
		PRScoDto.setSelfDevSupportPuP(10);
		PRScoDto.setApprAmountWorkPuP(10);
		PRScoDto.setSuffSalaryPuP(10);
		PRScoDto.setRelSysAfterMarriagePuP(10);
		PRScoDto.setChildcareLeavePuP(10);
		PRScoDto.setGuarantReinstatementPuP(10);
		PRScoDto.setVacationPuP(10);
		PRScoDto.setMoodEnvImprovPuP(10);
		PRScoDto.setDiningTogetherPuP(10);
		PRScoDto.setMoneyManageCoachPuP(10);
		
		int datePuP = (int) ((int) (PRScoDto.getNoOTPuP()*(46/79) + PRScoDto.getWeekendWorkPuP()*15/79 + PRScoDto.getEggshellsPuP()*6/79 + PRScoDto.getFinanSupportPuP()*6/79 + PRScoDto.getApprAmountWorkPuP()*6/79)*6.8/10);
		int marriagePuP = (int) ((int) (PRScoDto.getRelSysAfterMarriagePuP()*18/62 + PRScoDto.getSuffSalaryPuP()*13/62 + PRScoDto.getEggshellsPuP()*11/62 + PRScoDto.getNoOTPuP()*11/62 + PRScoDto.getFinanSupportPuP()*9/62)*6.8/10);
		int babyPuP = (int) ((int) (PRScoDto.getChildcareLeavePuP()*24/65 + PRScoDto.getGuarantReinstatementPuP()*13/65 + PRScoDto.getVacationPuP()*11/65 + PRScoDto.getEggshellsPuP()*9/65 + PRScoDto.getFinanSupportPuP()*8/65)*6.8/10);
		int housePuP = (int) ((int) (PRScoDto.getSuffSalaryPuP()*29/52 + PRScoDto.getLoanSupportPuP()*13/52 + PRScoDto.getDormiHousingSupportPuP()*6/52 + PRScoDto.getMoneyManageCoachPuP()*4/52)*6.8/10);
		int relationshipPuP = (int) ((int) (PRScoDto.getNoOTPuP()*29/58 + PRScoDto.getMoodEnvImprovPuP()*11/58 + PRScoDto.getWeekendWorkPuP()*8/58 + PRScoDto.getFlexWorkPuP()*5/58 +PRScoDto.getDiningTogetherPuP()*5/58)*6.8/10) ;
		int dreamPuP = (PRScoDto.getSelfDevSupportPuP()*30/44 + PRScoDto.getNoOTPuP()*14/44)*3/10 ;
		int hopePuP = (PRScoDto.getSuffSalaryPuP()*20/36 + PRScoDto.getMoodEnvImprovPuP()*9/36 + PRScoDto.getNoOTPuP()*7/36)*3/10;
		
		int EvaluationPuP = datePuP + marriagePuP + babyPuP + housePuP + relationshipPuP + dreamPuP + hopePuP;
		
		System.out.println("연애=" + datePuP);
		System.out.println("결혼=" + marriagePuP);
		System.out.println("출산및육아=" + babyPuP);
		System.out.println("내집마련=" + housePuP);
		System.out.println("인간관계=" + relationshipPuP);
		System.out.println("꿈=" + dreamPuP);
		System.out.println("희망=" + hopePuP);
		System.out.println("기업평가40%=" + EvaluationPuP);
		
		CScoDto.setCid(PRScoDto.getCid());
		CScoDto.setDateSco(datePuP);
		CScoDto.setMarrySco(marriagePuP);
		CScoDto.setBabySco(babyPuP);
		CScoDto.setHouseSco(housePuP);
		CScoDto.setRelationSco(relationshipPuP);
		CScoDto.setDreamSco(dreamPuP);
		CScoDto.setHopeSco(dreamPuP);
		
		return CScoDto;
	}



}
