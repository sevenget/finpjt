package model.companySco;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;
import model.plots.PlotsDto;

public class PublicRawScoDaoImpl implements PublicRawScoDao {
	private SqlSession mybatis;

	public PublicRawScoDaoImpl() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	// 회사별 일반인 평가의 갯수 구하기. 30개가 넘어야 점수 반영하는데 사용할 것.
	public int selectCntPublicRawScores(int cid){
		int cnt = (int) mybatis.selectOne("PublicRawScoDAO.selectCount",cid);
		System.out.println(cnt);
		return cnt;
		
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
	
	public PublicRawScoDto selectbyCid(int cid, String id){
		System.out.println(cid);
		PublicRawScoDto dto = new PublicRawScoDto();
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("id", id);
		parameters.put("cid", cid);

		dto = (PublicRawScoDto) mybatis.selectOne("PublicRawScoDAO.getById", parameters);
		System.out.println(dto.getCid());
		return dto;
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
		dto.setCid(2);
		dto.setNoOTPuP(9);
		dto.setFlexWorkPuP(9);
		dto.setWeekendWorkPuP(8);
		dto.setEggshellsPuP(8);
		dto.setFinanSupportPuP(7);
		dto.setDormiHousingSupportPuP(7);
		dto.setLoanSupportPuP(6);
		dto.setSelfDevSupportPuP(6);
		dto.setApprAmountWorkPuP(5);
		dto.setSuffSalaryPuP(5);
		dto.setRelSysAfterMarriagePuP(4);
		dto.setChildcareLeavePuP(4);
		dto.setGuarantReinstatementPuP(3);
		dto.setVacationPuP(3);
		dto.setMoodEnvImprovPuP(2);
		dto.setDiningTogetherPuP(2);
		dto.setMoneyManageCoachPuP(1);
			
		mybatis.update("PublicRawScoDAO.insertRawScore", dto);
		System.out.println("데이터 입력 완료");
		
		mybatis.commit();

		}

	public static void main(String args[]) {
		PublicRawScoDaoImpl pp = new PublicRawScoDaoImpl();
		/*pp.insertPublicRawScore();
		pp.selectPublicRawScores();
		pp.insertOrUpdatePlots("mem1");// mem은 세션에서 받아온 게 없어서 그냥 해 둠.
		pp.selectPlots();*/
		//pp.insertPublicRawScore();
		//pp.selectbyCid(2);
		//pp.selectbyCid(1);
		
	}
}
