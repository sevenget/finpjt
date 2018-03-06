package model.companySco;

import java.util.List;

/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;

import com.sevenget.Rcode.Evaluation;

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
			System.out.printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n", dto.getCid(), dto.getDateSco(), dto.getMarrySco(), dto.getBabySco(), dto.getHouseSco(), dto.getRelationSco(), dto.getDreamSco(), dto.getHopeSco());
		}


	}
	
	public void insertCompanyScore(CompanyScoDto dto) {
		System.out.println("기업 점수 삽입 전");
		try {
			mybatis.insert("CompanyScoDAO.insertSCs", dto);
		} catch (Exception e) {
			mybatis.update("CompanyScoDAO.updateSCs", dto);
		}
		System.out.println("기업 점수 삽입 완료");


	}
	
	public CompanyScoDto selectByCid(int cid){
		CompanyScoDto dto = new CompanyScoDto();
		dto = mybatis.selectOne("CompanyScoDAO.getById", cid);

		return dto;
	}
	
	/*public void insertCompanyScore(CompanyScoDto dto) {
		dto.setId("mem");
		dto.setCid(1);
		dto.setDateSco(6.8);
		dto.setMarrySco(6.8);
		dto.setBabySco(6.8);
		dto.setHouseSco(6.8);
		dto.setRelationSco(6.8);
		dto.setDreamSco(6.8);
		dto.setHopeSco(6.8);
		System.out.println("기업 점수 삽입 전");
		
		mybatis.insert("CompanyScoDAO.insertSCs", dto);
		System.out.println("기업 점수 삽입 완료");
		mybatis.commit();

	}*/

	/*public static void main(String[] args) {
		CompanyScoDaoImpl pp = new CompanyScoDaoImpl();
		CompanyScoDto dto = new CompanyScoDto();
		pp.insertCompanyScore();
		pp.selectCompanyScores();
		
	}*/
}
