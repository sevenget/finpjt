package model.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class MemConcernDAO {
	private SqlSession mybatis;
	
	public MemConcernDAO(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public MemConcernDto getMemConcern(String id){
		List list = mybatis.selectList("MemConcernDAO.getById",id);
		if(list.size()>0)
			return (MemConcernDto) mybatis.selectList("MemConcernDAO.getById",id).get(0);
		return null;
	} 
}

