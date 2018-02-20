package model.common;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryBean {
	private static SqlSessionFactory sessionFactory = null;

	static {
		try {
			if(sessionFactory == null) {
				System.out.println("session1");
				Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
				System.out.println("session2");
				sessionFactory = new SqlSessionFactoryBuilder().build(reader);
				System.out.println("session3");
			} 
		} catch(Exception e) {
			System.out.println("session Error");
			e.printStackTrace();
		}
		
	}

	public static SqlSession getSqlSessionInstance() {
		System.out.println("session4");
		return sessionFactory.openSession();
	}
}
