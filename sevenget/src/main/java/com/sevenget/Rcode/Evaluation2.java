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

		if(CSDto.getDateSco()>=4 || CSDto.getDateSco()<7){
			CBDto.setDateGet("N");
		}else if(CSDto.getDateSco()<4){
			CBDto.setDateGet("F");
		}else{
			CBDto.setDateGet("T");
		}
		
		if(CSDto.getMarrySco()>=4 || CSDto.getMarrySco()<7){
			CBDto.setMarryGet("N");
		}else if(CSDto.getMarrySco()<4){
			CBDto.setMarryGet("F");
		}else{
			CBDto.setMarryGet("T");
		}
		
		if(CSDto.getBabySco()>=4 || CSDto.getBabySco()<7){
			CBDto.setBabyGet("N");
		}else if(CSDto.getBabySco()<4){
			CBDto.setBabyGet("F");
		}else{
			CBDto.setBabyGet("T");
		}
		
		if(CSDto.getHouseSco()>=4 || CSDto.getHouseSco()<7){
			CBDto.setHouseGet("N");
		}else if(CSDto.getHouseSco()<4){
			CBDto.setHouseGet("F");
		}else{
			CBDto.setHouseGet("T");
		}
		
		if(CSDto.getRelationSco()>=4 || CSDto.getRelationSco()<7){
			CBDto.setRelationGet("N");
		}else if(CSDto.getRelationSco()<4){
			CBDto.setRelationGet("F");
		}else{
			CBDto.setRelationGet("T");
		}
		
		if(CSDto.getDreamSco()>=4 || CSDto.getDreamSco()<7){
			CBDto.setDreamGet("N");
		}else if(CSDto.getDreamSco()<4){
			CBDto.setDreamGet("F");
		}else{
			CBDto.setDreamGet("T");
		}
		
		if(CSDto.getHopeSco()>=4 || CSDto.getHopeSco()<7){
			CBDto.setHopeGet("N");
		}else if(CSDto.getHopeSco()<4){
			CBDto.setHopeGet("F");
		}else{
			CBDto.setHopeGet("T");
		}
		
		CompanyBasicDAO CBDao = new CompanyBasicDAO();
		CBDao.insertOrUpdate(CBDto);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
