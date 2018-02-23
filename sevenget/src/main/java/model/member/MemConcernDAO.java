package model.member;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class MemConcernDAO {
	private SqlSession mybatis;
	
	public MemConcernDAO(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public MemConcernDto getMemConcern(String id){
		return (MemConcernDto) mybatis.selectList("MemConcernDAO.getById",id).get(0);
	} 
}

