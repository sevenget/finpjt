package model.company;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class CompanyBasicDAO {
	private SqlSession mybatis;
	
	public CompanyBasicDAO(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public List<CompanyBasicDTO> selectAllCompanyBasic(){
		return mybatis.selectList("CompanyBasicDAO.selectAllCompany");
	}
	
	public List<CompanyBasicDTO> selectCompany(int cid){
		List<CompanyBasicDTO> list;
		list = mybatis.selectList("CompanyBasicDAO.selectCompany", cid);
		return list;
	}
	
	public void insertOrUpdate(CompanyBasicDTO dto){//insert 구문을 어떻게 써야 하나 싶어서 일단 update문만 사용.
		//mybatis.insert(statement);
		mybatis.update("CompanyBasicDAO.updateseven", dto);
	}
}
