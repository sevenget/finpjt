package dbtest;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFatoryBean;

public class TestDAO {
	private SqlSession mybatis;
	
	public TestDAO() {
		mybatis = SqlSessionFatoryBean.getSqlSessionInstance();
	}
	
	public void insertTest(TestVO vo) {
		mybatis.insert("TestDAO.insertTest", vo);
	}
	
	public TestVO getOneTest(TestVO vo) {
		return mybatis.selectOne("TestDAO.getOneTest", vo);
	}
}
