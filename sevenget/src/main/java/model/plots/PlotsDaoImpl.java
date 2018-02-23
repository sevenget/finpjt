package model.plots;

import java.util.List;

/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class PlotsDaoImpl implements PlotsDao {
	private SqlSession mybatis;

	public PlotsDaoImpl() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}

	public PlotsDto selectPlots() {
		List<PlotsDto> list;
		PlotsDto dto = new PlotsDto();

		System.out.println("목록을 가져옵니다. 로딩중");
		list = mybatis.selectList("PlotsDAO.getAll");
		System.out.println("목록가져오기 완료. 출력.");

		for (PlotsDto dto1 : list) {
			System.out.printf("%s \t  %s \t    %s\n", dto1.getMemid(),dto1.getCid(), dto1.getPlotpng(), dto1.getSavedTime());
		}

		mybatis.commit();
		return dto;
	}
	
	public PlotsDto inquiryId(String id){
		PlotsDto dto = new PlotsDto();
		
		System.out.println("기존에 있는 아이디인지 확인 중");
		
		dto = (PlotsDto) mybatis.selectOne("PlotsDAO.getById", id);
		
		System.out.printf("%s\t%s\t%s\t%s\n",dto.getMemid(),dto.getCid(),dto.getPlotpng(),dto.getSavedTime());
		
		mybatis.commit();

		return dto;
	}

	public PlotsDto insertOrUpdatePlots(String id, String plotpngname) {
		// 세션에서 아이디 받아와서 DB에서 해당 아이디 조회
		// 해당 아이디 조회 후 아이디를 찾아서
		// 1. png 파일이 있으면 수정
		// 2. 없으면 생성

		PlotsDto dto = new PlotsDto();
		
		dto = inquiryId(id);// 세션에서 받아온 아이디 확인. 없는 경우는 생각 안해봄... 설마 있겠지...
		
		if(dto == null){
			System.out.println("해당 아이디가 존재하지 않습니다.");
		}else{
			System.out.println("ID: "+id+" 확인되었습니다.");
			System.out.println(dto.getPlotpng());
			
			dto.setPlotpng(plotpngname);
			
			mybatis.update("PlotsDAO.updatePlts", dto);
			mybatis.commit();
		}
		return dto;
		
		
		
		
		
		
		
		
/*		if (dto.getMemid() == id && dto.getPlotpng() == null) {
			System.out.println("ID: mem 확인되었습니다.");
			dto.setMemid("mem");
			dto.setPlotpng("default1.png");
			System.out.println(4);
			mybatis.update("PlotsDAO.updatePlts", dto);
			//mybatis.insert("PlotsDAO.insertPlts", dto);
			System.out.println(5);
			mybatis.commit();
		} else {
			// 파라메터로 값 받아오기?
			System.out.println(6);
			dto.setMemid("mem1");
			dto.setPlotpng("default2.png");

			System.out.println(7);
			mybatis.update("PlotsDAO.updatePlts", dto);

		}*/
	}

	public static void main(String args[]) {
		PlotsDaoImpl pp = new PlotsDaoImpl();
		PlotsDto dto = new PlotsDto();
		pp.selectPlots();
		pp.insertOrUpdatePlots("mem","default.png");// mem은 세션에서 받아온 게 없어서 그냥 해 둠.
	//	pp.selectPlots();
	}
}
