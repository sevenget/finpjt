package model.plots;
/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class PlotsDaoImpl implements PlotsDao{
	private SqlSession mybatis;
	
	public PlotsDaoImpl(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public void selectPlots(){
		System.out.println(1);
		mybatis.selectList("PlotsDAO.getAll");
		System.out.println(2);
		mybatis.commit();
	}
	
	public void insertOrUpdatePlots(){
		PlotsDto dto = new PlotsDto();
		if(dto.getPlotpng() == null){
			System.out.println(3);
			dto.setMemid("mem");
			dto.setPlotpng("default.png");
			System.out.println(4);
			mybatis.insert("PlotsDAO.insertPlts", dto);
			System.out.println(5);
			mybatis.commit();
		}else{
			//파라메터로 값 받아오기?
			System.out.println(6);
			dto.setMemid("mem");
			dto.setPlotpng("default2.png");
			
			System.out.println(7);
			mybatis.update("PlotsDAO.updatePlts",dto);
		}
	}
	
	public static void main(String args[]){
		PlotsDaoImpl pp = new PlotsDaoImpl();
		//PlotsDto dto = new PlotsDto();
		//pp.selectPlots();
		//pp.insertOrUpdatePlots();
	}
}
