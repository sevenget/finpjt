package model.companySco;

import java.util.List;

/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class CompanyRawScoDaoImpl implements CompanyScoDao {
	private SqlSession mybatis;

	public CompanyRawScoDaoImpl() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}

	public void selectCompanyRawScores() {
		CompanyRawScoDto companyRawScoDto = new CompanyRawScoDto();
		List<CompanyRawScoDto> list;

		System.out.println("CompanyRawScoDto목록을 가져옵니다. 로딩중");
		list = mybatis.selectList("CompanyRawScoDAO.getAll");
		System.out.println("CompanyRawScoDto목록가져오기 완료. 출력.");
		
		/*for (CompanyRawScoDto dto : list) {
			System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",
					dto.getCid(), dto.getNoOTEPr(),	dto.getFlexWorkEPr(), dto.getWeekendWorkEPr(),
					dto.getNewcomerSalEPr(),dto.getPaidVacaEPr(),dto.getCompKindergartenEPr(),dto.getEduSupportEPr(),
					dto.getLoanSupportEPr(),dto.getDormiHousingSupportEPr(),dto.getOpClubEPr(),dto.getSupportClubEPr(),
					dto.getClubMemRateEPr(),dto.getSelfDevSupportEPr(),dto.getSeminarInvEPr(),dto.getHorizStrucEPr(),
					dto.getVarWorkExpEPr(),dto.getTelAvailEPr(),dto.getSalIncreRateEPr(),dto.getRetireRateEPr(),
					dto.getBusiGrowthEPr(),dto.getInduGrowthEPr(),dto.getGovSupportEPr());
		}*/

		mybatis.commit();
	}
	
	public CompanyRawScoDto selectbyCid(int cid){
		CompanyRawScoDto dto = new CompanyRawScoDto();
		dto = (CompanyRawScoDto) mybatis.selectOne("CompanyRawScoDAO.getById", cid);
		return dto;
	}

	public void insertCompanyRawScore(/*int id*/) {
		CompanyRawScoDto dto = new CompanyRawScoDto();
		System.out.println("데이터 입력 시작");
		
		dto.setCid(1);
		dto.setNoOTEPr(5);
		dto.setFlexWorkEPr(1);
		dto.setWeekendWorkEPr(1);
		dto.setNewcomerSalEPr(3000);
		dto.setPaidVacaEPr(15);
		dto.setCompKindergartenEPr(1);
		dto.setEduSupportEPr(1);
		dto.setLoanSupportEPr(1);
		dto.setDormiHousingSupportEPr(1);
		dto.setOpClubEPr(1);
		dto.setSupportClubEPr(1);
		dto.setClubMemRateEPr(100);
		dto.setSelfDevSupportEPr(1);
		dto.setSeminarInvEPr(5);
		dto.setHorizStrucEPr(1);
		dto.setVarWorkExpEPr(1);
		dto.setTelAvailEPr(1);
		dto.setSalIncreRateEPr(20);
		dto.setRetireRateEPr(0);
		dto.setBusiGrowthEPr(100);
		dto.setInduGrowthEPr(50);
		dto.setGovSupportEPr(1);
			
		mybatis.update("CompanyRawScoDAO.insertRawScore", dto);
		System.out.println("데이터 입력 완료");
		
		mybatis.commit();

		}

	public static void main(String args[]) {
		CompanyRawScoDaoImpl pp = new CompanyRawScoDaoImpl();
		CompanyScoDto dto = new CompanyScoDto();
		//pp.insertCompanyRawScore();
		pp.selectCompanyRawScores();
		pp.selectbyCid(1);
	}
}
