package com.sevenget.Rcode;

import model.company.CompanyBasicDAO;
import model.company.CompanyBasicDTO;
import model.companySco.CompanyRawScoDaoImpl;
import model.companySco.CompanyRawScoDto;
import model.companySco.CompanyScoDao;
import model.companySco.CompanyScoDaoImpl;
import model.companySco.CompanyScoDto;

public class Evaluation2 {
	// companyscore에서 점수를 cid로 불러오는 메서드
	public CompanyScoDto selectComSco(int cid) {
		CompanyScoDto CSDto = new CompanyScoDto();
		CompanyScoDaoImpl CSDao = new CompanyScoDaoImpl();

		CSDto = CSDao.selectByCid(cid);

		return CSDto;
	}

	// 불러온 점수를 4점 미만, 4이상 7미만, 7이상으로 범주화 (F,N,T) 하는 메서드-insert or update
	// 범주화된 점수는 companyBasicInfo 테이블에 입력!
	public CompanyBasicDTO Categorization(int cid) {
		CompanyScoDaoImpl CSDao = new CompanyScoDaoImpl();
		CompanyScoDto CSDto = new CompanyScoDto();
		Evaluation2 eval2 = new Evaluation2();
		Evaluation eval = new Evaluation();
		CompanyBasicDTO CBDto = new CompanyBasicDTO();
		
		CSDto = eval.FinalSco(cid, "joeh");
		
		//CSDto = eval2.selectComSco(cid);
		CSDto.setCid(cid);
		
		System.out.println("지금 여기는 Evaluation2");
		System.out.print(CSDto.getDateSco());
		System.out.print(CSDto.getMarrySco());
		System.out.print(CSDto.getBabySco());
		System.out.print(CSDto.getHouseSco());
		System.out.print(CSDto.getRelationSco());
		System.out.print(CSDto.getDreamSco());
		System.out.println(CSDto.getHopeSco());
		// TF조건을 if로 걸어주고 나머지를 N으로 하는 걸로 바꿔주기!
		if (CSDto.getDateSco() >= 7) {
			CBDto.setDateGet("T");
		} else if (CSDto.getDateSco() < 4) {
			CBDto.setDateGet("F");
		} else {
			CBDto.setDateGet("N");
		}

		if (CSDto.getMarrySco() >= 7) {
			CBDto.setMarryGet("T");
		} else if (CSDto.getMarrySco() < 4) {
			CBDto.setMarryGet("F");
		} else {
			CBDto.setMarryGet("N");
		}

		if (CSDto.getBabySco() >= 7) {
			CBDto.setBabyGet("T");
		} else if (CSDto.getBabySco() < 4) {
			CBDto.setBabyGet("F");
		} else {
			CBDto.setBabyGet("N");
		}

		if (CSDto.getHouseSco() >= 7) {
			CBDto.setHouseGet("T");
		} else if (CSDto.getHouseSco() < 4) {
			CBDto.setHouseGet("F");
		} else {
			CBDto.setHouseGet("N");
		}

		if (CSDto.getRelationSco() >= 7) {
			CBDto.setRelationGet("T");
		} else if (CSDto.getRelationSco() < 4) {
			CBDto.setRelationGet("F");
		} else {
			CBDto.setRelationGet("N");
		}

		if (CSDto.getDreamSco() >= 7) {
			CBDto.setDreamGet("T");
		} else if (CSDto.getDreamSco() < 4) {
			CBDto.setDreamGet("F");
		} else {
			CBDto.setDreamGet("N");
		}

		if (CSDto.getHopeSco() >= 7) {
			CBDto.setHopeGet("T");
		} else if (CSDto.getHopeSco() < 4) {
			CBDto.setHopeGet("F");
		} else {
			CBDto.setHopeGet("N");
		}
		System.out.println("cid : "+cid);
		System.out.print(" 연애 " + CBDto.getDateGet());
		System.out.print(" 결혼 " + CBDto.getMarryGet());
		System.out.print(" 아기 " + CBDto.getBabyGet());
		System.out.print(" 내집 " + CBDto.getHouseGet());
		System.out.print(" 관계 " + CBDto.getRelationGet());
		System.out.print(" 꿈 " + CBDto.getDreamGet());
		System.out.println(" 희망 " + CBDto.getHopeGet());
		
		CompanyBasicDAO CBDao = new CompanyBasicDAO();
		//CBDao.insertOrUpdate(cid);// update만 됨!!

		return CBDto;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CompanyRawScoDaoImpl pp = new CompanyRawScoDaoImpl();
		CompanyRawScoDto dto = new CompanyRawScoDto();
		Evaluation2 E2 = new Evaluation2();
		E2.Categorization(1);

		//dto = pp.selectbyCid(1);
		for(int i =1; i<26; i++){
			E2.Categorization(i);
		}
	}

}
