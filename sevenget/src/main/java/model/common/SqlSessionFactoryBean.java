package model.common;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;

public class SqlSessionFactoryBean {
	private static SqlSessionFactory sessionFactory = null;
	private static SqlSessionTemplate sqlSession;

	static {
		try {
			if(sessionFactory == null) {
				//System.out.println("mybatis1");
				Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
				//System.out.println("mybatis2");
				sessionFactory = new SqlSessionFactoryBuilder().build(reader);
				//System.out.println("mybatis3");
				sqlSession = new SqlSessionTemplate(sessionFactory);
				
			} 
		} catch(Exception e) {
			System.out.println("mybatis Error "+e.getMessage());
		}
		
	}

	public static SqlSession getSqlSessionInstance() {
		//System.out.println("mybatis4");
		return sqlSession;
	}
}
