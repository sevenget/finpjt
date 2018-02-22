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
	
	public MemBasicInfoDTO loginCheck(String id){
		MemBasicInfoDTO dto = new MemBasicInfoDTO();
		
		list = mybatis.selectList("MemIdCheckDao.loginCheck");
		
		dto.setId(list.get(0).id);
		dto.setPassword(list.get(0).password);
		dto.setName(list.get(0).name);
		dto.setBirth(list.get(0).birth);
		dto.setEmail(list.get(0).email);
		dto.setGender(list.get(0).gender);
		dto.setAddress(list.get(0).address);
		
		return dto;
		
	}
	
}
