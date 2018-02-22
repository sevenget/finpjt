package model.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class MemIdCheckDaoImpl implements MemIdCheckDao{
	private SqlSession mybatis;
	List<MemIdCheckDto> list;
	int check;
	
	public MemIdCheckDaoImpl(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public int Check(String id){
		
		MemIdCheckDto dto = mybatis.selectOne("MemIdCheckDao.getCheck", id);
		
		
		if(dto==null){
			return 0;
		}
		return 1;
	}
}
