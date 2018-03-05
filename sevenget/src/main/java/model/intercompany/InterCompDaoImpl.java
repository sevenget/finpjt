package model.intercompany;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import model.company.CompanyBasicDTO;
import model.common.SqlSessionFactoryBean;

@Repository
public class InterCompDaoImpl {
	
private SqlSession mybatis;
	
	public InterCompDaoImpl(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public List<InterCompBean> inter_list(){
		List<InterCompBean> bean = mybatis.selectList("InterCompDAO.select_list");
		return bean;
	}
	
	public List<CompanyBasicDTO> selectInterComp(String mem){
		List<CompanyBasicDTO> list;
		list = mybatis.selectList("InterCompDAO.selectInterComp",mem);
		return list;
	}
	
}
