package model.company;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class CompanyBasicDAO {
	private SqlSession mybatis;
	
	public CompanyBasicDAO(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public List<CompanyBasicDTO> getAllCompanyBasic(){
		return mybatis.selectList("CompanyBasicDAO.getAllCompany");
	}
}
