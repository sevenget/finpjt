package model.plots;
/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class PlotsDaoImpl implements PlotsDao{
	private SqlSession session;
	
	public PlotsDaoImpl(){
		session = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	
	public void selectPlots(){
		System.out.println(1);
		session.selectList("PlotsDAO.getAll");
		System.out.println(2);
		session.commit();
	}
	
	public void insertUpdatePlots(PlotsDto dto){
		if(dto.getPlotpng() == null){
			System.out.println(3);
			session.insert("PlotsDAO.insertPlts", dto);
			System.out.println(4);
			session.commit();
		}else{
			//파라메터로 값 받아오기?
			System.out.println(5);
			dto.setPlotpng("NONE");
			System.out.println(6);
			dto.setMemid("mem");

			System.out.println(7);
			session.update("PlotsDAO.updatePlts",dto);
		}
	}
	
	public static void main(String args[]){
		PlotsDaoImpl pp = new PlotsDaoImpl();
		PlotsDto dto = new PlotsDto();
		pp.selectPlots();
		//pp.insertUpdatePlots(dto);
	}
}
