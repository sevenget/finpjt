package model.companySco;

import java.util.List;

/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class CompanyScoDaoImpl implements CompanyScoDao {
	private SqlSession mybatis;

	public CompanyScoDaoImpl() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}

	public void selectCompanyScores() {
		List<CompanyScoDto> list;

		System.out.println("목록을 가져옵니다. 로딩중");
		list = mybatis.selectList("CompanyScoDAO.getAll");
		System.out.println("목록가져오기 완료. 출력.");

		for (CompanyScoDto dto : list) {
			System.out.printf("%s \t  %s \t    %s \t  %s \t    %s \t  %s \t    %s\n", dto.getCid(), dto.getDateSco(), dto.getMarrySco(), dto.getBabySco(), dto.getHouseSco(), dto.getRelationSco(), dto.getDreamSco(), dto.getHopeSco());
		}

		mybatis.commit();
	}
	
	public void insertCompanyScore(/*int id*/) {
		CompanyScoDto dto = new CompanyScoDto();
		
		dto.setCid(1);
		dto.setDateSco(1);
		dto.setMarrySco(1);
		dto.setBabySco(1);
		dto.setHouseSco(1);
		dto.setRelationSco(1);
		dto.setDreamSco(1);
		dto.setHopeSco(1);
			
		mybatis.update("CompanyScoDAO.updatePlts", dto);

		}

	public static void main(String args[]) {
		CompanyScoDaoImpl pp = new CompanyScoDaoImpl();
		CompanyScoDto dto = new CompanyScoDto();
		pp.insertCompanyScore();
		pp.selectCompanyScores();
		
	}
}
