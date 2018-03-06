package model.plots;

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

		return dto;
	}

	public PlotsDto inquiryId(String id, int cid) {
		PlotsDto dto = new PlotsDto();
		
		try {
			System.out.println("기존에 있는 아이디인지 확인 중");
			System.out.println("id "+id);
			System.out.println("cid "+cid);

			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("memid", id);
			parameters.put("cid", cid);

			dto = (PlotsDto) mybatis.selectOne("PlotsDAO.getById", parameters);

			System.out.printf("+++++++++++PlotsDto inquiryId\n%s\t%s\t%s\t%s\n*******************\n", dto.getMemid(), dto.getCid(), dto.getPlotpng(),dto.getSavedTime());

			return dto;
			
		} catch (Exception e) {
			System.out.println("조회실패 왜 때문에?");
			System.out.println(e);
			return dto;
		}
	}

	public PlotsDto insertOrUpdatePlots(String id, String plotName, int cid) {
		System.out.println("PlotsDaoImpl");
		PlotsDaoImpl dao = new PlotsDaoImpl();
		// 세션에서 아이디 받아와서 DB에서 해당 아이디 조회
		// 해당 아이디 조회 후 아이디를 찾아서
		// 1. png 파일이 있으면 수정
		// 2. 없으면 생성
		System.out.println(id);

		System.out.println("insertOrUpdatePlots : " +plotName + " cid : " + cid);

		try {
			PlotsDto dto = new PlotsDto();
			System.out.println();
			dto = inquiryId(id, cid);// 세션에서 받아온 아이디 확인. 없는 경우는 controller에서 걸러줌.
			System.out.println("ID: " + id + " 확인되었습니다.");
			System.out.println("CID: " + cid + " 확인되었습니다.");
			System.out.println("PLOTNAME: " + plotName + " 확인되었습니다.");
			System.out.println(dto.getPlotpng()); // 되는 건가..
			
			dto.setCid(cid);
			dto.setMemid(id);
			dto.setPlotpng(plotName);
			
			System.out.println(dto.getCid());
			System.out.println(dto.getMemid());
			System.out.println(dto.getPlotpng());

			mybatis.update("PlotsDAO.updatePlts", dto);
			mybatis.commit();
			return dto;

		} catch (Exception e) {
			// TODO: handle exception
			PlotsDto dto3 = new PlotsDto();

			System.out.println("해당 아이디의 정보가 존재하지 않습니다. UpdatePlots실패");
			System.out.println("정보의 삽입을 시도합니다.");
			
			dto3.setCid(cid);
			dto3.setMemid(id);
			dto3.setPlotpng(plotName);

			System.out.println("cid : " + cid);
			System.out.println("id : " + id);
			System.out.println("plotname : " + plotName);

			System.out.println(dto3.getPlotpng());
			mybatis.insert("insertPlts", dto3);
			mybatis.commit();

			dto3 = inquiryId(id, cid);
			System.out.println("***************************" + dto3.getCid());
			return dto3;
		} finally {
			//System.out.println("finally"+dto.getCid()+" "+dto.getMemid()+" "+dto.getPlotpng());
			PlotsDto dto2 = new PlotsDto();

			dto2.setCid(cid);
			dto2.setMemid(id);
			dto2.setPlotpng(plotName);
			mybatis.update("PlotsDAO.updatePlts", dto2);
			System.out.println("=====저장 확인======");
			dao.selectPlots();
			System.out.println("=====저장 확인======");
			return dto2;

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
		System.out.println("insert or update");
		pp.insertOrUpdatePlots("1","1.png",1);
		System.out.println("select");
		pp.selectPlots();
		System.out.println("inquiry");
		pp.inquiryId("1", 1);
		// pp.selectPlots();
	}
}
