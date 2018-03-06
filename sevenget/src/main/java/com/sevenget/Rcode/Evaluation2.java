package com.sevenget.Rcode;

import model.company.CompanyBasicDAO;
import model.company.CompanyBasicDTO;
import model.companySco.CompanyScoDaoImpl;
import model.companySco.CompanyScoDto;

public class Evaluation2 {
	// companyscore에서 점수를 cid로 불러오는 메서드
	public CompanyScoDto selectComSco(int cid){
		CompanyScoDto CSDto = new CompanyScoDto();
		CompanyScoDaoImpl CSDao = new CompanyScoDaoImpl();
		
		CSDto = CSDao.selectByCid(cid);
		
		return CSDto;
	}
	
	// 불러온 점수를 4점 미만, 4이상 7미만, 7이상으로 범주화 (F,N,T) 하는 메서드-insert or update
	// 범주화된 점수는 companyBasicInfo 테이블에 입력!
	public void Categorization(int cid){
		CompanyScoDto CSDto = new CompanyScoDto();
		Evaluation2 eval2 = new Evaluation2();
		CompanyBasicDTO CBDto = new CompanyBasicDTO();
		
		CSDto = eval2.selectComSco(cid);
		CSDto.setCid(cid);
		
		// TF조건을 if로 걸어주고 나머지를 N으로 하는 걸로 바꿔주기!
		if(CSDto.getDateSco()>=7){
			CBDto.setDateGet("T");
		}else if(CSDto.getDateSco()<4){
			CBDto.setDateGet("F");
		}else{
			CBDto.setDateGet("N");
		}
		
		if(CSDto.getMarrySco()>=7){
			CBDto.setMarryGet("T");
		}else if(CSDto.getMarrySco()<4){
			CBDto.setMarryGet("F");
		}else{
			CBDto.setMarryGet("N");
		}
		
		if(CSDto.getBabySco()>=7){
			CBDto.setBabyGet("T");
		}else if(CSDto.getBabySco()<4){
			CBDto.setBabyGet("F");
		}else{
			CBDto.setBabyGet("N");
		}
		
		if(CSDto.getHouseSco()>=7){
			CBDto.setHouseGet("T");
		}else if(CSDto.getHouseSco()<4){
			CBDto.setHouseGet("F");
		}else{
			CBDto.setHouseGet("N");
		}
		
		if(CSDto.getRelationSco()>=7){
			CBDto.setRelationGet("T");
		}else if(CSDto.getRelationSco()<4){
			CBDto.setRelationGet("F");
		}else{
			CBDto.setRelationGet("N");
		}
		
		if(CSDto.getDreamSco()>=7){
			CBDto.setDreamGet("T");
		}else if(CSDto.getDreamSco()<4){
			CBDto.setDreamGet("F");
		}else{
			CBDto.setDreamGet("N");
		}
		
		if(CSDto.getHopeSco()>=7){
			CBDto.setHopeGet("T");
		}else if(CSDto.getHopeSco()<4){
			CBDto.setHopeGet("F");
		}else{
			CBDto.setHopeGet("N");
		}
		
		CompanyBasicDAO CBDao = new CompanyBasicDAO();
		CBDao.insertOrUpdate(CBDto);//update만 됨!!
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
