package model.search;

import org.apache.ibatis.session.SqlSession;

import dbtest.SqlSessionFactoryBean;

public class KeywordDAO {
	private SqlSession mybatis;
	
	KeywordDAO(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	public void insertKeyword(KeywordVO vo){
		mybatis.insert("KeywordDAO.insertKeyword", vo);
		mybatis.commit();
	}
}
