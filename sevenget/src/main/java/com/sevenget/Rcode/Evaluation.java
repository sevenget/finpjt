package com.sevenget.Rcode;

import model.companySco.CompanyRawScoDaoImpl;
import model.companySco.CompanyRawScoDto;
import model.companySco.CompanyScoDaoImpl;
import model.companySco.CompanyScoDto;
import model.companySco.PublicRawScoDaoImpl;
import model.companySco.PublicRawScoDto;
import model.member.MemBasicInfoDTO;
import model.member.MemConcernDAO;
import model.member.MemConcernDto;

// 실행 전 Rserve.R 반드시 실행시키기

public class Evaluation {

	public CompanyScoDto EvalCompanyEPR(CompanyRawScoDto CRScoDto){
		CompanyScoDto CScoDtoEP = new CompanyScoDto();

		double dateEPr = CRScoDto.getNoOTEPr() * 1 + CRScoDto.getFlexWorkEPr() * 2.5
				+ CRScoDto.getWeekendWorkEPr() * 2.5;
		double marriageEPr = CRScoDto.getNewcomerSalEPr() / 3000 + CRScoDto.getPaidVacaEPr() / 5
				+ CRScoDto.getNoOTEPr() * 1 + CRScoDto.getWeekendWorkEPr() * 1;
		double babyEPr = CRScoDto.getFlexWorkEPr() * 2.5 + CRScoDto.getPaidVacaEPr() * 2.5 / 15
				+ CRScoDto.getCompKindergartenEPr() * 2.5 + CRScoDto.getEduSupportEPr() * 2.5;
		double houseEPr = CRScoDto.getLoanSupportEPr() * 4 + CRScoDto.getDormiHousingSupportEPr() * 6;
		double relationshipEPr = CRScoDto.getOpClubEPr() * 1.5 + CRScoDto.getSupportClubEPr() * 1.5
				+ CRScoDto.getClubMemRateEPr() / 50 + CRScoDto.getNoOTEPr();
		double dreamEPr = CRScoDto.getSelfDevSupportEPr() * 1 + CRScoDto.getSeminarInvEPr() / 5
				+ CRScoDto.getHorizStrucEPr() * 1 + CRScoDto.getVarWorkExpEPr() * 1 + CRScoDto.getTelAvailEPr() * 1;
		double hopeEPr = CRScoDto.getSalIncreRateEPr() / 20 + (1 - CRScoDto.getRetireRateEPr()) / 50
				+ CRScoDto.getBusiGrowthEPr() / 100 + CRScoDto.getInduGrowthEPr() / 50
				+ CRScoDto.getGovSupportEPr() * 1;

		double EvaluationPrP = dateEPr + marriageEPr + babyEPr + houseEPr + relationshipEPr + dreamEPr + hopeEPr;

		System.out.println("기업평가PRP :" + EvaluationPrP);

		CScoDtoEP.setCid(CRScoDto.getCid());
		CScoDtoEP.setDateSco(Double.parseDouble(String.format("%.2f", dateEPr)));
		CScoDtoEP.setMarrySco(Double.parseDouble(String.format("%.2f", marriageEPr)));
		CScoDtoEP.setBabySco(Double.parseDouble(String.format("%.2f", babyEPr)));
		CScoDtoEP.setHouseSco(Double.parseDouble(String.format("%.2f", houseEPr)));
		CScoDtoEP.setRelationSco(Double.parseDouble(String.format("%.2f", relationshipEPr)));
		CScoDtoEP.setDreamSco(Double.parseDouble(String.format("%.2f", dreamEPr)));
		CScoDtoEP.setHopeSco(Double.parseDouble(String.format("%.2f", dreamEPr)));
		return CScoDtoEP;
	}

	public CompanyScoDto EvalCompanyPUP(PublicRawScoDto PRScoDto) {
		CompanyScoDto CScoDtoPP = new CompanyScoDto();

		System.out.println("EvalCompanyPUP");
		System.out.println(CScoDtoPP.getCid());
		System.out.println(PRScoDto.getCid());

		double datePuP = (PRScoDto.getNoOTPuP() * 46 + PRScoDto.getWeekendWorkPuP() * 15
				+ PRScoDto.getEggshellsPuP() * 6 + PRScoDto.getFinanSupportPuP() * 6
				+ PRScoDto.getApprAmountWorkPuP() * 6) * 6.8 / 790;
		double marriagePuP = ((PRScoDto.getRelSysAfterMarriagePuP() * 18 + PRScoDto.getSuffSalaryPuP() * 13
				+ PRScoDto.getEggshellsPuP() * 11 + PRScoDto.getNoOTPuP() * 11 + PRScoDto.getFinanSupportPuP() * 9)
				* 6.8 / 620);
		double babyPuP = ((PRScoDto.getChildcareLeavePuP() * 24 + PRScoDto.getGuarantReinstatementPuP() * 13
				+ PRScoDto.getVacationPuP() * 11 + PRScoDto.getEggshellsPuP() * 9 + PRScoDto.getFinanSupportPuP() * 8)
				* 6.8 / 650);
		double housePuP = ((PRScoDto.getSuffSalaryPuP() * 29 + PRScoDto.getLoanSupportPuP() * 13
				+ PRScoDto.getDormiHousingSupportPuP() * 6 + PRScoDto.getMoneyManageCoachPuP() * 4) * 6.8 / 520);
		double relationshipPuP = ((PRScoDto.getNoOTPuP() * 29 + PRScoDto.getMoodEnvImprovPuP() * 11
				+ PRScoDto.getWeekendWorkPuP() * 8 + PRScoDto.getFlexWorkPuP() * 5
				+ PRScoDto.getDiningTogetherPuP() * 5) * 6.8 / 580);
		double dreamPuP = (PRScoDto.getSelfDevSupportPuP() * 30 + PRScoDto.getNoOTPuP() * 14) * 3 / 440;
		double hopePuP = (PRScoDto.getSuffSalaryPuP() * 20 + PRScoDto.getMoodEnvImprovPuP() * 9
				+ PRScoDto.getNoOTPuP() * 7) * 3 / 360;

		double EvaluationPuP = datePuP + marriagePuP + babyPuP + housePuP + relationshipPuP + dreamPuP + hopePuP;
		System.out.println("기업평가PUP :" + EvaluationPuP);

		CScoDtoPP.setCid(PRScoDto.getCid());
		CScoDtoPP.setDateSco(Double.parseDouble(String.format("%.2f", datePuP)));
		CScoDtoPP.setMarrySco(Double.parseDouble(String.format("%.2f", marriagePuP)));
		CScoDtoPP.setBabySco(Double.parseDouble(String.format("%.2f", babyPuP)));
		CScoDtoPP.setHouseSco(Double.parseDouble(String.format("%.2f", housePuP)));
		CScoDtoPP.setRelationSco(Double.parseDouble(String.format("%.2f", relationshipPuP)));
		CScoDtoPP.setDreamSco(Double.parseDouble(String.format("%.2f", dreamPuP)));
		CScoDtoPP.setHopeSco(Double.parseDouble(String.format("%.2f", dreamPuP)));

		return CScoDtoPP;
	}

	public CompanyScoDto FinalSco(int cid, String id) {
		System.out.println("cid : " + cid);
		CompanyScoDaoImpl ComScoDao = new CompanyScoDaoImpl();
		CompanyScoDto CScoDto = new CompanyScoDto();
		CScoDto.setCid(cid);
		System.out.println("*********CScoDto.getCid() : " + CScoDto.getCid());
		// 전문 패널 점수
		CompanyRawScoDaoImpl CRScoDao = new CompanyRawScoDaoImpl();
		CompanyScoDto dtoEP = new CompanyScoDto();
		Evaluation ev = new Evaluation();

		// 일반인 평가
		try { // 세부 점수를 넣어줬으면
			try{
				dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
			}catch (Exception e) {
				System.out.println("기업점수 없어서 강제로 입력!");
				try{
					CRScoDao.insertCompanyRawScore(cid);
					dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
				}catch (Exception e1) {
					CRScoDao.updateCompanyRawScore(cid);
					dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
				}
			}
			System.out.println("+++++++++++++++++++++++++++++++++++++");
			System.out.println(dtoEP.getCid()+" "+dtoEP.getDateSco()+" "+dtoEP.getMarrySco()+" "+dtoEP.getBabySco()+" "+dtoEP.getHouseSco()+" "+dtoEP.getRelationSco()+" "+dtoEP.getDreamSco()+" "+dtoEP.getHopeSco());
			System.out.println("+++++++++++++++++++++++++++++++++++++");
			PublicRawScoDaoImpl PRScoDao = new PublicRawScoDaoImpl();
			CompanyScoDto dtoPP = new CompanyScoDto();
			
			// 일반인 평가가 30개가 넘는지 확인! 안넘으면 null 처리.
			int PRcnt = PRScoDao.selectCntPublicRawScores(cid);
			if(PRcnt <30 ){
				dtoPP = null;
			}else{
				dtoPP = ev.EvalCompanyPUP(PRScoDao.selectbyCid(cid, id));
			}


			//// 점수환산 과정 중 마지막! 다 합쳐주는 것!
			if (dtoPP != null) {
				System.out.println("세부점수 없음 시나리오1");
				try{
					dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
				}catch (Exception e) {
					System.out.println("기업점수 없어서 강제로 입력!");
					try{
						CRScoDao.insertCompanyRawScore(cid);
						dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
					}catch (Exception e2) {
						CRScoDao.updateCompanyRawScore(cid);
						dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
					}
				}
				System.out.println("일반인 평가 있을 때"); // 10 6.8 -> 6 4
				double dateEP = Double.parseDouble(String.format("%.2f", dtoEP.getDateSco() * 0.6));
				double datePP = Double.parseDouble(String.format("%.2f", dtoPP.getDateSco() * 4 / 6.8));

				double marryEP = Double.parseDouble(String.format("%.2f", dtoEP.getMarrySco() * 0.6));
				double marryPP = Double.parseDouble(String.format("%.2f", dtoPP.getMarrySco() * 4 / 6.8));

				double babyEP = Double.parseDouble(String.format("%.2f", dtoEP.getBabySco() * 0.6));
				double babyPP = Double.parseDouble(String.format("%.2f", dtoPP.getBabySco() * 4 / 6.8));

				double houseEP = Double.parseDouble(String.format("%.2f", dtoEP.getHouseSco() * 0.6));
				double housePP = Double.parseDouble(String.format("%.2f", dtoPP.getHouseSco() * 4 / 6.8));

				double relEP = Double.parseDouble(String.format("%.2f", dtoEP.getRelationSco() * 0.6));
				double relPP = Double.parseDouble(String.format("%.2f", dtoPP.getRelationSco() * 4 / 6.8));

				double dreamEP = Double.parseDouble(String.format("%.2f", dtoEP.getDreamSco() * 1.2));
				double dreamPP = Double.parseDouble(String.format("%.2f", dtoPP.getDreamSco() * 4 / 3));

				double hopeEP = Double.parseDouble(String.format("%.2f", dtoEP.getHopeSco() * 1.2));
				double hopePP = Double.parseDouble(String.format("%.2f", dtoPP.getHopeSco() * 4 / 3));

				CScoDto.setDateSco(Double.parseDouble(String.format("%.2f", dateEP + datePP)));
				CScoDto.setMarrySco(Double.parseDouble(String.format("%.2f", marryEP + marryPP)));
				CScoDto.setBabySco(Double.parseDouble(String.format("%.2f", babyEP + babyPP)));
				CScoDto.setHouseSco(Double.parseDouble(String.format("%.2f", houseEP + housePP)));
				CScoDto.setRelationSco(Double.parseDouble(String.format("%.2f", relEP + relPP)));
				CScoDto.setDreamSco(Double.parseDouble(String.format("%.2f", dreamEP + dreamPP)));
				CScoDto.setHopeSco(Double.parseDouble(String.format("%.2f", hopeEP + hopePP)));
				System.out.printf("연애%s\t결혼%s\t아기%s\t내집%s\t인간%s\t꿈%s\t희망%s\n", CScoDto.getDateSco(),
						CScoDto.getMarrySco(), CScoDto.getBabySco(), CScoDto.getHouseSco(), CScoDto.getRelationSco(),
						CScoDto.getDreamSco(), CScoDto.getHopeSco());

				ComScoDao.insertCompanyScore(CScoDto);

				return CScoDto;

			} else {
				System.out.println("세부점수 없음 시나리오2");
				try{
					dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
				}catch (Exception e) {
					System.out.println("기업점수 없어서 강제로 입력!");
					try{
						CRScoDao.insertCompanyRawScore(cid);
						dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
					}catch (Exception e3) {
						CRScoDao.updateCompanyRawScore(cid);
						dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
					}
				}
				System.out.println("일반인 평가 없거나 30개 미만일 때");
				System.out.println("dtoEP에 저장된 cid" + dtoEP.getCid());
				

				CScoDto.setDateSco(Double.parseDouble(String.format("%.2f", dtoEP.getDateSco())));
				CScoDto.setMarrySco(Double.parseDouble(String.format("%.2f", dtoEP.getMarrySco())));
				CScoDto.setBabySco(Double.parseDouble(String.format("%.2f", dtoEP.getBabySco())));
				CScoDto.setHouseSco(Double.parseDouble(String.format("%.2f", dtoEP.getHouseSco())));
				CScoDto.setRelationSco(Double.parseDouble(String.format("%.2f", dtoEP.getRelationSco())));
				CScoDto.setDreamSco(Double.parseDouble(String.format("%.2f", dtoEP.getDreamSco() * 2)));
				CScoDto.setHopeSco(Double.parseDouble(String.format("%.2f", dtoEP.getHopeSco() * 2)));
				System.out.printf("연애%s\t결혼%s\t아기%s\t내집%s\t인간%s\t꿈%s\t희망%s\n", CScoDto.getDateSco(),
						CScoDto.getMarrySco(), CScoDto.getBabySco(), CScoDto.getHouseSco(), CScoDto.getRelationSco(),
						CScoDto.getDreamSco(), CScoDto.getHopeSco());

				ComScoDao.insertCompanyScore(CScoDto);
			}
		} catch (Exception e) {// 세부 점수를 안 넣어줬으면
			System.out.println("세부점수 없음 시나리오");
			try{
				dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
			}catch (Exception ee) {
				System.out.println("기업점수 없어서 강제로 입력!");
				try{
					CRScoDao.insertCompanyRawScore(cid);
					dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
				}catch (Exception e3) {
					CRScoDao.updateCompanyRawScore(cid);
					dtoEP = ev.EvalCompanyEPR(CRScoDao.selectbyCid(cid));// 전문가 평가는 일단 값을 DB에 강제로 넣어둠. 나중에 관리자 페이지랑.. 그런거 생기면 웹에서도 입력할 수 있게 해보자..
				}
			}
			MemConcernDAO MCdao = new MemConcernDAO();
			MemConcernDto MCdto = new MemConcernDto();
			MCdto = MCdao.getMemConcern(id);

			double dateEP = Double.parseDouble(String.format("%.2f", dtoEP.getDateSco() * 0.6));
			double datePP = Double.parseDouble(String.format("%.2f", MCdto.getDateCon() * 0.4));
			double marryEP = Double.parseDouble(String.format("%.2f", dtoEP.getMarrySco() * 0.6));
			double marryPP = Double.parseDouble(String.format("%.2f", MCdto.getMarryCon() * 0.4));
			
			double babyEP = Double.parseDouble(String.format("%.2f", dtoEP.getBabySco() * 0.6));
			double babyPP = Double.parseDouble(String.format("%.2f", MCdto.getBabyCon() * 0.4));
			
			double houseEP = Double.parseDouble(String.format("%.2f", dtoEP.getHouseSco() * 0.6));
			double housePP = Double.parseDouble(String.format("%.2f", MCdto.getHouseCon() * 0.4));
			
			double relEP = Double.parseDouble(String.format("%.2f", dtoEP.getRelationSco() * 0.6));
			double relPP = Double.parseDouble(String.format("%.2f", MCdto.getRelationCon() * 0.4));
			
			double dreamEP = Double.parseDouble(String.format("%.2f", dtoEP.getDreamSco() * 1.2));
			double dreamPP = Double.parseDouble(String.format("%.2f", MCdto.getDreamCon() * 0.4));
			
			double hopeEP = Double.parseDouble(String.format("%.2f", dtoEP.getHopeSco() * 1.2));
			double hopePP = Double.parseDouble(String.format("%.2f", MCdto.getHopeCon() * 0.4));

			CScoDto.setDateSco(Double.parseDouble(String.format("%.2f", dateEP + datePP)));
			CScoDto.setMarrySco(Double.parseDouble(String.format("%.2f", marryEP + marryPP)));
			CScoDto.setBabySco(Double.parseDouble(String.format("%.2f", babyEP + babyPP)));
			CScoDto.setHouseSco(Double.parseDouble(String.format("%.2f", houseEP + housePP)));
			CScoDto.setRelationSco(Double.parseDouble(String.format("%.2f", relEP + relPP)));
			CScoDto.setDreamSco(Double.parseDouble(String.format("%.2f", dreamEP + dreamPP)));
			CScoDto.setHopeSco(Double.parseDouble(String.format("%.2f", hopeEP + hopePP)));
			System.out.printf("연애%s\t결혼%s\t아기%s\t내집%s\t인간%s\t꿈%s\t희망%s\n", CScoDto.getDateSco(), CScoDto.getMarrySco(),
					CScoDto.getBabySco(), CScoDto.getHouseSco(), CScoDto.getRelationSco(), CScoDto.getDreamSco(),
					CScoDto.getHopeSco());

			ComScoDao.insertCompanyScore(CScoDto);

		} finally {
			return CScoDto;
		}

	}
	
	public static void main(String args[]) {
		Evaluation pp = new Evaluation();
		CompanyScoDto dto = new CompanyScoDto();
		try{
				for(int i=3; i<26;i++){
				}
			}catch (Exception e) {
				for(int i=3; i<26;i++){
					pp.FinalSco(i, "joeh");
				}
			}
		/*pp.selectCompanyRawScores();
		for(int i=1; i<26;i++){
			pp.selectbyCid(7);
		}*/
	}

}
