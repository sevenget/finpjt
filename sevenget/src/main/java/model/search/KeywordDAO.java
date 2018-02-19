package model.search;

import org.apache.ibatis.session.SqlSession;
import model.common.*;

public class KeywordDAO {
	private SqlSession mybatis;
	
	KeywordDAO(){
		mybatis = SqlSessionFatoryBean.getSqlSessionInstance();
	}
	public void insertKeyword(KeywordVO vo){
		mybatis.insert("KeywordDAO.insertKeyword", vo);
		mybatis.commit();
	}
}
