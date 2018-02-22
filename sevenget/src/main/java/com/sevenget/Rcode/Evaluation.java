package com.sevenget.Rcode;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngine;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;

// 실행 전 Rserve.R 반드시 실행시키기

public class Evaluation {

	public void mPlot() throws REXPMismatchException, REngineException {

		RConnection connection = null;
		connection = new RConnection();

		// DB에서 받아온 데이터 집어넣기
		connection.eval("noOTEPr <- 5"); // 정시퇴근 가능일 수
		connection.eval("Flexible_Work_SchemeEPr <- 1");// 금요일 조기퇴근(외 탄력근무제 등) 시행 여부
		connection.eval("weekendWorkEPr <- 1");// 주말근무 여부
		connection.eval("newcomerSalaryEPr <- 3000");// 신입연봉
		connection.eval("Paid_vacationEPr <- 15");// 유급휴가 사용 일 수(연 기준)
		connection.eval("Company_kindergartenEPr <- 1");// 사내 어린이집 등 시설 또는 돌보미 서비스 등의 유무
		connection.eval("Educational_supportEPr <- 1");// 교육비 지원 여부
		connection.eval("Loan_supportEPr <- 1");// 대출지원제도 유무
		connection.eval("Dormitory_Companyhousing_SupportEPr <- 1");// 기숙사/사택 제공 여부
		connection.eval("Operate_clubsEPr <- 1");// 사내 동호회 운영 여부
		connection.eval("Support_clubsEPr <- 1");// 사내 동호회 지원 여부
		connection.eval("club_membership_rateEPr <- 100");// 실 동호회 가입 인원 비율
		connection.eval("Self_development_supportEPr <- 1");// 자기계발 지원비 여부
		connection.eval("Seminar_by_inviting_external_lecturersEPr <- 5");// 외부강사 초청 세미나 횟수(한달 기준)
		connection.eval("Horizontal_structureEPr <- 1");// 수평적 구조
		connection.eval("Possibility_of_various_work_experienceEPr <- 1");// 다양한 업무 경험이 가능한지 여부
		connection.eval("Telecommuting_availabilityEPr <- 1");// 재택근무 가능 여부
		connection.eval("Salary_increase_rateEPr <- 20");// 연봉인상률
		connection.eval("Retirement_rateEPr <- 0");// 퇴사율
		connection.eval("Business_growth_rateEPr <- 100");// 기업성장률
		connection.eval("Industry_growth_rateEPr <- 50");// 산업성장률
		connection.eval("Government_supportEPr <- 1");// 정부지원 산업 여부
		
		
		REXP a = connection.eval("dateEPr <- noOTEPr*1 + Flexible_Work_SchemeEPr*2.5 + weekendWorkEPr*2.5");
		REXP b = connection.eval("marriageEPr <- newcomerSalaryEPr/3000 + Paid_vacationEPr/5 + noOTEPr*1 + weekendWorkEPr*1");
		REXP c = connection.eval("babyEPr <- Flexible_Work_SchemeEPr*2.5 + Paid_vacationEPr*2.5/15 + Company_kindergartenEPr*2.5 + Educational_supportEPr*2.5 ");
		REXP d = connection.eval("houseEPr <- Loan_supportEPr*4 + Dormitory_Companyhousing_SupportEPr*6");
		REXP e = connection.eval("relationshipEPr <- Operate_clubsEPr*1.5 +  Support_clubsEPr*1.5 + club_membership_rateEPr/50 + noOTEPr");
		REXP f = connection.eval("dreamEPr <- Self_development_supportEPr*1 + Seminar_by_inviting_external_lecturersEPr/5 + Horizontal_structureEPr*1 + Possibility_of_various_work_experienceEPr*1 + Telecommuting_availabilityEPr*1");
		REXP g = connection.eval("hopeEPr <- Salary_increase_rateEPr/20 + (1-Retirement_rateEPr/50) + Business_growth_rateEPr/100 + Industry_growth_rateEPr/50 + Government_supportEPr*1");

		REXP h = connection.eval("EvaluationPrP <- dateEPr + marriageEPr + babyEPr + houseEPr + relationshipEPr + dreamEPr + hopeEPr");

		
		int dateEPr = a.asInteger();
		int marriageEPr = b.asInteger();
		int babyEPr = c.asInteger();
		int houseEPr = d.asInteger();
		int relationshipEPr = e.asInteger();
		int dreamEPr = f.asInteger();
		int hopeEPr = g.asInteger();
		int EvaluationPrP = h.asInteger();

		System.out.println("연애=" + dateEPr);
		System.out.println("결혼=" + marriageEPr);
		System.out.println("출산및육아=" + babyEPr);
		System.out.println("내집마련=" + houseEPr);
		System.out.println("인간관계=" + relationshipEPr);
		System.out.println("꿈=" + dreamEPr);
		System.out.println("희망=" + hopeEPr);
		System.out.println("기업평가60%=" + EvaluationPrP);
		

		connection.eval("noOTPuP <- 10");
		connection.eval("Flexible_Work_SchemePuP <- 10");
		connection.eval("weekendWorkPuP <- 10");
		connection.eval("walking_on_eggshellsPuP <- 10");
		connection.eval("Financial_supportPuP <- 10");
		connection.eval("Dormitory_Companyhousing_SupportPuP <- 10");
		connection.eval("Loan_supportPuP <- 10");
		connection.eval("Self_development_supportPuP <- 10");
		connection.eval("appropriate_amount_of_work <- 10");
		connection.eval("sufficient_salary <- 10");
		connection.eval("Related_system_after_marriage <- 10");
		connection.eval("childcare_leave <- 10");
		connection.eval("Guaranteed_reinstatement <- 10");
		connection.eval("vacation <- 10");
		connection.eval("mood_environment_improvement <- 10");
		connection.eval("Dining_together <- 10");
		connection.eval("Money_management_coaching <- 10");
		
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

	/*public static void main(String[] args) {

		Evaluation ee = new Evaluation();
		try {
			ee.mPlot();
		} catch (REXPMismatchException | REngineException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}*/
}
