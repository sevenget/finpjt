package model.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class MemBasicInfoDAO {
	private SqlSession mybatis;
	
	public MemBasicInfoDAO(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public List<MemBasicInfoDTO> getMemBasicInfo(String member){
		return mybatis.selectList("MemBasicInfoDAO.getMemBasicInfo",member);
	} 
	
	public void insertMember(MemBasicInfoDTO dto){
		
		mybatis.insert("insertMember",dto);
		mybatis.commit();
	}
	
	public void updateMember(MemBasicInfoDTO dto){
		
		mybatis.update("updateMember",dto);
		mybatis.commit();
	}
	
	/*public void deleteMember(String id){
		mybatis.delete("",)
		mybatis.commit();
	}*/
	
}

