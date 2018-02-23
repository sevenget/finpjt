package model.companySco;

import java.util.List;

/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class PublicRawScoDaoImpl implements PublicRawScoDao {
	private SqlSession mybatis;

	public PublicRawScoDaoImpl() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}

	public void selectPublicRawScores() {
		List<PublicRawScoDto> list;

		System.out.println("목록을 가져옵니다. 로딩중");
		list = mybatis.selectList("PublicRawScoDAO.getAll");
		System.out.println("목록가져오기 완료. 출력.");

		for (PublicRawScoDto dto : list) {
			System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",
					dto.getId(),dto.getCid(),dto.getNoOTPuP(),	dto.getFlexWorkPuP(),
					dto.getWeekendWorkPuP(),dto.getEggshellsPuP(),dto.getFinanSupportPuP(),dto.getDormiHousingSupportPuP(),
					dto.getLoanSupportPuP(),dto.getSelfDevSupportPuP(),dto.getApprAmountWorkPuP(),dto.getSuffSalaryPuP(),
					dto.getRelSysAfterMarriagePuP(),dto.getChildcareLeavePuP(),dto.getGuarantReinstatementPuP(),dto.getVacationPuP(),
					dto.getMoodEnvImprovPuP(),dto.getDiningTogetherPuP(),dto.getMoneyManageCoachPuP());
		}

		mybatis.commit();
	}
	
	/*public CompanyScoDto inquiryId(String id){
		CompanyScoDto dto = new CompanyScoDto();
		
		System.out.println("기존에 있는 아이디인지 확인 중");
		
		dto = (CompanyScoDto) mybatis.selectOne("PlotsDAO.getById", id);
		
		System.out.printf("%s\t %s\t %s\n",dto.getMemid(),dto.getPlotpng(),dto.getSavedTime());
		
		return dto;
	}*/

	public void insertPublicRawScore(/*int id*/) {
		PublicRawScoDto dto = new PublicRawScoDto();
		System.out.println("데이터 입력 시작");
		
		dto.setId("mem");
		dto.setCid(1);
		dto.setNoOTPuP(10);
		dto.setFlexWorkPuP(10);
		dto.setWeekendWorkPuP(10);
		dto.setEggshellsPuP(10);
		dto.setFinanSupportPuP(10);
		dto.setDormiHousingSupportPuP(10);
		dto.setLoanSupportPuP(10);
		dto.setSelfDevSupportPuP(10);
		dto.setApprAmountWorkPuP(10);
		dto.setSuffSalaryPuP(10);
		dto.setRelSysAfterMarriagePuP(10);
		dto.setChildcareLeavePuP(10);
		dto.setGuarantReinstatementPuP(10);
		dto.setVacationPuP(10);
		dto.setMoodEnvImprovPuP(10);
		dto.setDiningTogetherPuP(10);
		dto.setMoneyManageCoachPuP(10);
			
		mybatis.update("PublicRawScoDAO.insertRawScore", dto);
		System.out.println("데이터 입력 완료");
		
		mybatis.commit();

		}

	public static void main(String args[]) {
		PublicRawScoDaoImpl pp = new PublicRawScoDaoImpl();
		pp.insertPublicRawScore();
		pp.selectPublicRawScores();
		/*pp.insertOrUpdatePlots("mem1");// mem은 세션에서 받아온 게 없어서 그냥 해 둠.
		pp.selectPlots();*/
	}
}