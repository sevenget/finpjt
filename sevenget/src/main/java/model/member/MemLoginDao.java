package model.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class MemLoginDao {
	private SqlSession mybatis;
	List<MemBasicInfoDTO> list;
	int check;
	
	public MemLoginDao(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public List<MemBasicInfoDTO> Check(String id){
		
		list = mybatis.selectList("MemIdCheckDao.getLoginCheck");
		
		return list;
		
	}
	
}
