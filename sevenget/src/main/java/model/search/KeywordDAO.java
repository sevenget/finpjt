package model.search;

import org.apache.ibatis.session.SqlSession;
import model.common.*;

public class KeywordDAO {
	private SqlSession mybatis;
	
	public KeywordDAO(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	public void insertKeyword(KeywordDTO vo){
		mybatis.insert("KeywordDAO.insertKeyword", vo);
		mybatis.commit();
	}
	

}
