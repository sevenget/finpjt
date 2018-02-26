package model.company;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class InterestedRCDAO {
	private SqlSession mybatis;
	
	public InterestedRCDAO(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public void insertReg(InterestedRCDTO dto){
		mybatis.insert("InterestedRCDAO.register", dto);
		mybatis.commit();
	}
	
	public void updateCan(InterestedRCDTO dto){
		mybatis.update("InterestedRCDAO.cancel", dto);
		mybatis.commit();
	}
	
	public InterestedRCDTO selectRelatedOne(InterestedRCDTO dto){
		return (InterestedRCDTO) mybatis.selectList("InterestedRCDAO.selectRelatedOne", dto).get(0);
	}
	
	public List selectRelatedAll(String id){
		return mybatis.selectList("InterestedRCDAO.selectRelatedAll", id);
	}
	
	public List selectAll(InterestedRCDTO dto){
		return mybatis.selectList("InterestedRCDAO.selectAll", dto);
	}
	
	/*public List selectRelatedAllAndMemBasicInFo(String id){
		return mybatis.selectList("InterestedRCDAO.selectRelatedAllAndMemBasicInFo", id);
	}*/
	
}
