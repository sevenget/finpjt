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
		
		for (CompanyRawScoDto dto : list) {
			System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",
					dto.getCid(), dto.getNoOTEPr(),	dto.getFlexWorkEPr(), dto.getWeekendWorkEPr(),
					dto.getNewcomerSalEPr(),dto.getPaidVacaEPr(),dto.getCompKindergartenEPr(),dto.getEduSupportEPr(),
					dto.getLoanSupportEPr(),dto.getDormiHousingSupportEPr(),dto.getOpClubEPr(),dto.getSupportClubEPr(),
					dto.getClubMemRateEPr(),dto.getSelfDevSupportEPr(),dto.getSeminarInvEPr(),dto.getHorizStrucEPr(),
					dto.getVarWorkExpEPr(),dto.getTelAvailEPr(),dto.getSalIncreRateEPr(),dto.getRetireRateEPr(),
					dto.getBusiGrowthEPr(),dto.getInduGrowthEPr(),dto.getGovSupportEPr());
		}

	}
	
	public CompanyRawScoDto selectbyCid(int cid){
		CompanyRawScoDto dto = new CompanyRawScoDto();
		dto = (CompanyRawScoDto) mybatis.selectOne("CompanyRawScoDAO.getById", cid);
		System.out.println("selectbycid"+dto.getCid() +" "+dto.getBusiGrowthEPr());
		return dto;
	}

	public void insertCompanyRawScore(int cid) {
		CompanyRawScoDto dto = new CompanyRawScoDto();
		System.out.println("insert데이터 입력 시작"+cid);
		
		dto.setCid(cid);
		dto.setNoOTEPr(5);
		dto.setFlexWorkEPr(1);
		dto.setWeekendWorkEPr(1);
		dto.setNewcomerSalEPr(3000);
		dto.setPaidVacaEPr(15);
		dto.setCompKindergartenEPr(0);
		dto.setEduSupportEPr(1);
		dto.setLoanSupportEPr(1);
		dto.setDormiHousingSupportEPr(1);
		dto.setOpClubEPr(1);
		dto.setSupportClubEPr(1);
		dto.setClubMemRateEPr(80);
		dto.setSelfDevSupportEPr(1);
		dto.setSeminarInvEPr(0);
		dto.setHorizStrucEPr(1);
		dto.setVarWorkExpEPr(0);
		dto.setTelAvailEPr(1);
		dto.setSalIncreRateEPr(0);
		dto.setRetireRateEPr(1);
		dto.setBusiGrowthEPr(0);
		dto.setInduGrowthEPr(1);
		dto.setGovSupportEPr(0);
			
		mybatis.insert("CompanyRawScoDAO.insertRawScore", dto);
		System.out.println("데이터 입력 완료");
		

		}
	public void updateCompanyRawScore(int cid) {
		CompanyRawScoDto dto = new CompanyRawScoDto();
		System.out.println("update데이터 입력 시작"+cid);
		
		dto.setCid(cid);
		dto.setNoOTEPr(3);
		dto.setFlexWorkEPr(1);
		dto.setWeekendWorkEPr(0);
		dto.setNewcomerSalEPr(2000);
		dto.setPaidVacaEPr(15);
		dto.setCompKindergartenEPr(0);
		dto.setEduSupportEPr(1);
		dto.setLoanSupportEPr(1);
		dto.setDormiHousingSupportEPr(0);
		dto.setOpClubEPr(0);
		dto.setSupportClubEPr(0);
		dto.setClubMemRateEPr(60);
		dto.setSelfDevSupportEPr(0);
		dto.setSeminarInvEPr(0);
		dto.setHorizStrucEPr(0);
		dto.setVarWorkExpEPr(0);
		dto.setTelAvailEPr(0);
		dto.setSalIncreRateEPr(0);
		dto.setRetireRateEPr(0);
		dto.setBusiGrowthEPr(0);
		dto.setInduGrowthEPr(0);
		dto.setGovSupportEPr(0);
			
		mybatis.update("CompanyRawScoDAO.updateRawScore", dto);
		System.out.println("데이터 입력 완료");
		

		}

	public static void main(String args[]) {
		CompanyRawScoDaoImpl pp = new CompanyRawScoDaoImpl();
		CompanyScoDto dto = new CompanyScoDto();
		try{
				for(int i=3; i<26;i++){
				pp.selectbyCid(i);
				pp.insertCompanyRawScore(i);
				}
			}catch (Exception e) {
				for(int i=3; i<26;i++){
				pp.updateCompanyRawScore(i);
				}
			}
		/*pp.selectCompanyRawScores();
		for(int i=1; i<26;i++){
			pp.selectbyCid(7);
		}*/
	}
}
