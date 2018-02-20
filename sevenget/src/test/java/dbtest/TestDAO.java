package dbtest;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class TestDAO {
	private SqlSession mybatis;
	
	public TestDAO() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public void insertTest(TestVO vo) {
		mybatis.insert("TestDAO.insertTest", vo);
	}
	
	public TestVO getOneTest(TestVO vo) {
		return mybatis.selectOne("TestDAO.getOneTest", vo);
	}
}
