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
		mybatis.update("InterestedRCDAO.register_sub", dto);
	}
	
	public void updateCan(InterestedRCDTO dto){
		mybatis.update("InterestedRCDAO.cancel", dto);
		if((int)mybatis.selectOne("InterestedRCDAO.getInterTimes", dto)==0){
			return;
		}
		mybatis.update("InterestedRCDAO.cancel_sub", dto);
	}
	
	public InterestedRCDTO selectRelatedOne(InterestedRCDTO dto){
		List list =mybatis.selectList("InterestedRCDAO.selectRelatedOne", dto);
		if(list.size()>0){
			return (InterestedRCDTO) list.get(0);
		} else{
			return null;
		}
	}
	
	public int getInterTimesByCid(int cid){
		return (int)mybatis.selectOne("InterestedRCDAO.getInterTimes", cid);
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
