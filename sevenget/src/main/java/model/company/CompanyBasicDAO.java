package model.company;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sevenget.Rcode.Evaluation2;

import model.common.SqlSessionFactoryBean;
import model.companySco.CompanyRawScoDaoImpl;
import model.companySco.CompanyScoDto;

public class CompanyBasicDAO {
	private SqlSession mybatis;

	public CompanyBasicDAO() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}

	public List<CompanyBasicDTO> selectAllCompanyBasic() {
		return mybatis.selectList("CompanyBasicDAO.selectAllCompany");
	}

	public List<CompanyBasicDTO> selectCompany(int cid) {
		List<CompanyBasicDTO> list;
		list = mybatis.selectList("CompanyBasicDAO.selectCompany", cid);
		return list;
	}

	public void insertOrUpdate(int cid) {
		CompanyBasicDAO dao = new CompanyBasicDAO();
		List<CompanyBasicDTO> list = dao.selectAllCompanyBasic();
		System.out.println("확인용 : " + cid);
		Evaluation2 eval2 = new Evaluation2();
		CompanyScoDto CSDto = new CompanyScoDto();
		CompanyBasicDTO CBDto = new CompanyBasicDTO();
		/*CSDto.getDateSco();
		CSDto.getMarrySco();
		CSDto.getBabySco();
		CSDto.getHouseSco();
		CSDto.getRelationSco();
		CSDto.getDreamSco();
		CSDto.getHopeSco();*/
		CompanyBasicDAO CBDao = new CompanyBasicDAO();
		
		CBDto = (CompanyBasicDTO) CBDao.selectCompany(cid).get(0);
		
		System.out.println(eval2.Categorization(cid).getDateGet());
		CBDto.setDateGet(eval2.Categorization(cid).getDateGet());
		CBDto.setMarryGet(eval2.Categorization(cid).getMarryGet());
		CBDto.setBabyGet(eval2.Categorization(cid).getBabyGet());
		CBDto.setHouseGet(eval2.Categorization(cid).getHouseGet());
		CBDto.setRelationGet(eval2.Categorization(cid).getRelationGet());
		CBDto.setDreamGet(eval2.Categorization(cid).getDreamGet());
		CBDto.setHopeGet(eval2.Categorization(cid).getHopeGet());
		
		mybatis.update("CompanyBasicDAO.updateseven", CBDto);

	}

	public static void main(String[] args) {
		CompanyBasicDAO dao = new CompanyBasicDAO();
		for(int i =3; i<26; i++){
			dao.insertOrUpdate(i);
		}
			
		//이건 잘 작동함.
		/*List<CompanyBasicDTO> list = dao.selectAllCompanyBasic();
			try{
				for(int i = 0; i<25; i++){
					System.out.println(list.get(i).getCid());
					System.out.print(list.get(i).getDateGet());
					System.out.print(list.get(i).getMarryGet());
					System.out.print(list.get(i).getBabyGet());
					System.out.print(list.get(i).getHouseGet());
					System.out.print(list.get(i).getRelationGet());
					System.out.print(list.get(i).getDreamGet());
					System.out.println(list.get(i).getHopeGet());
				}
			}catch (Exception e) {
				// TODO: handle exception
			}*/
	}
}
