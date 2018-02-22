package dbtest;

import java.util.List;

import model.company.CompanyBasicDTO;
import java.util.List;

import model.member.MemBasicInfoDAO;
import model.member.MemBasicInfoDTO;

import model.search.KeywordAndSearchDAO;

public class DBTestMain {
	public static void main(String[] args) {


		
		KeywordAndSearchDAO dao = new KeywordAndSearchDAO();
		
		System.out.println(dao.searchAdvs().get(0) instanceof CompanyBasicDTO);
		CompanyBasicDTO k = (CompanyBasicDTO) dao.searchAdvs().get(0);
		System.out.println(k.getBabyGet()+1);
		System.out.println(k.getLogo());
		for(CompanyBasicDTO e : (List<CompanyBasicDTO>)dao.searchAdvs()){
			e.getCid();
			e.getLogo();
		};

	
	}
}
