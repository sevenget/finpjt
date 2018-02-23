package model.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class MemBasicInfoDAO {
	private SqlSession mybatis;
	
	public MemBasicInfoDAO(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public List<MemBasicInfoDTO> getMemBasicInfo(String id){
		return mybatis.selectList("MemBasicInfoDAO.getMemBasicInfo",id);
	} 
}

