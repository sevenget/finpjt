package model.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import model.common.SqlSessionFactoryBean;

@Repository
public class MemLoginDao {
	private SqlSession mybatis;
	List<MemBasicInfoDTO> list;
	
	public MemLoginDao(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public MemBasicInfoDTO loginCheck(String id,String pw){
		MemBasicInfoDTO dto = new MemBasicInfoDTO();
		
		list = mybatis.selectList("loginCheck",id);
		
		if(list.size() == 0){
			System.out.printf("입력하신 아이디 %s가 없습니다\n",id);
			return null;
		}
		
		if(!list.get(0).password.equals(pw)){
			System.out.println("비밀번호가 틀렸습니다.");
			return null;
		}else{
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
	
}
