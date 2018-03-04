package model.search;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class KeywordAndSearchDAO {
	private SqlSession mybatis;
	
	public KeywordAndSearchDAO(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public void insertKeyword(String keyword){
		KeywordDTO dto = mybatis.selectOne("KeywordAndSearchDAO.selectOneKeyword", keyword);
		if(dto!=null){
			mybatis.update("KeywordAndSearchDAO.updateKeyword", keyword);
			mybatis.commit();
		} else{
			mybatis.insert("KeywordAndSearchDAO.insertKeyword", keyword);
			mybatis.commit();
		}
	}
	
	public void insertSearch(SearchDTO dto){
		mybatis.insert("KeywordAndSearchDAO.insertSearch", dto);
		mybatis.commit();
	}
	
	public KeywordDTO selectOneKeword(String keyword){
		return mybatis.selectOne("KeywordDAO.getOne", keyword);
	}
	
	public List selectAllKewords(KeywordDTO dto){
		return mybatis.selectList("KeywordAndSearchDAO.selectAllKeywords");
	}
	
	public List searchByKeyword(String keyword){
		return mybatis.selectList("KeywordAndSearchDAO.searchByCname", keyword);
	}
	
	public List searchByKeywordAndFilter(String keyword, FilterDTO dto){
		Map map = dto.getFilterMap();
		map.put("keyword", keyword);
		return mybatis.selectList("KeywordAndSearchDAO.searchByCnameAndFilter", map);
	}
	
	public List searchByFilter(FilterDTO dto){
		return mybatis.selectList("KeywordAndSearchDAO.searchByFilter", dto.getFilterMap());
	}
	
	public List searchAdvs(){
		return mybatis.selectList("KeywordAndSearchDAO.selectAdvs");
	}
	
	public List selectSearchById(String id) {
		return mybatis.selectList("KeywordAndSearchDAO.selectSearchById", id);
	}

}
