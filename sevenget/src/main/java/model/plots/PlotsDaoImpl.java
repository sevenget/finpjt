package model.plots;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			System.out.printf("%s \t  %s \t    %s\n", dto1.getMemid(), dto1.getCid(), dto1.getPlotpng(),
					dto1.getSavedTime());
		}

		mybatis.commit();
		return dto;
	}

	public PlotsDto inquiryId(String id, int cid) {
		PlotsDto dto = new PlotsDto();

		System.out.println("기존에 있는 아이디인지 확인 중");
		System.out.println(id);
		System.out.println(cid);

		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("memid", id);
		parameters.put("cid", cid);

		dto = (PlotsDto) mybatis.selectOne("PlotsDAO.getById", parameters);

		System.out.printf("+++++++++++PlotsDto inquiryId\n%s\t%s\t%s\t%s\n*******************\n", dto.getMemid(), dto.getCid(), dto.getPlotpng(),dto.getSavedTime());

		mybatis.commit();

		return dto;
	}

	public PlotsDto insertOrUpdatePlots(String id, String plotName, int cid) {
		System.out.println("PlotsDaoImpl");
		// 세션에서 아이디 받아와서 DB에서 해당 아이디 조회
		// 해당 아이디 조회 후 아이디를 찾아서
		// 1. png 파일이 있으면 수정
		// 2. 없으면 생성
		System.out.println(id);

		PlotsDto dto = new PlotsDto();
		System.out.println(
				"insertOrUpdatePlots : " +plotName + " cid : " + cid);

		try {
			System.out.println();
			dto = inquiryId(id, cid);// 세션에서 받아온 아이디 확인. 없는 경우는 controller에서 걸러줌.
			System.out.println("ID: " + id + " 확인되었습니다.");
			System.out.println(dto.getPlotpng()); // 되는 건가..

			dto.setPlotpng(plotName);
			System.out.println(dto.getCid());
			System.out.println(dto.getMemid());
			System.out.println(dto.getPlotpng());

			mybatis.update("PlotsDAO.updatePlts", dto);
			mybatis.commit();

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("해당 아이디의 정보가 존재하지 않습니다. UpdatePlots실패");
			System.out.println("정보의 삽입을 시도합니다.");
			System.out.println("cid : " + cid);
			System.out.println("id : " + id);
			System.out.println("plotname : " + plotName);
			// 정보가 없으니 삽입!
			dto.setCid(cid);
			dto.setMemid(id);
			dto.setPlotpng(plotName);
			mybatis.insert("insertPlts", dto);

			dto = inquiryId(id, cid);// 세션에서 받아온 아이디 확인. 없는 경우는 생각 안해봄... 설마 있겠지...
			System.out.println("***************************" + dto.getCid());

		} finally {
			System.out.println("finally"+dto.getCid()+" "+dto.getMemid());
			return dto;

		}
		/*
		 * if(dto == null){
		 * System.out.println("해당 아이디가 존재하지 않습니다.if(dto== null)"); }else{
		 * System.out.println("ID: "+(String)plotName_cid.get(0)+" 확인되었습니다.");
		 * System.out.println(dto.getPlotpng());
		 * 
		 * dto.setPlotpng((String)plotName_cid.get(0));
		 * System.out.println(dto.getCid());
		 * 
		 * mybatis.update("PlotsDAO.updatePlts", dto); mybatis.commit(); }
		 * return dto;
		 */

	}

	public static void main(String args[]) {
		PlotsDaoImpl pp = new PlotsDaoImpl();
		PlotsDto dto = new PlotsDto();
		pp.selectPlots();
		// pp.insertOrUpdatePlots("mem","default.png");// mem은 세션에서 받아온 게 없어서 그냥
		// 해 둠.
		// pp.selectPlots();
	}
}
