package model.review;

import java.util.List;

/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;

public class ReviewDaoImpl implements ReviewDao {
	private SqlSession mybatis;

	public ReviewDaoImpl() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}

	/*public void selectPlots() {
		List<ReviewDto> list;

		System.out.println("목록을 가져옵니다. 로딩중");
		//list = mybatis.selectList("ReviewDAO.getAll");
		System.out.println("목록가져오기 완료. 출력.");

		for (ReviewDto dto : list) {
			System.out.printf("%s \t  %s \t    %s\n", dto.getMemid(), dto.getPlotpng(), dto.getSavedTime());
		}

		mybatis.commit();
	}*/
	
	/*public ReviewDto inquiryId(String id){
		ReviewDto dto = new ReviewDto();
		
		System.out.println("기존에 있는 아이디인지 확인 중");
		
		//dto = (ReviewDto) mybatis.selectOne("ReviewDAO.getById", id);
		
		//System.out.printf("%s\t %s\t %s\n",dto.getMemid(),dto.getPlotpng(),dto.getSavedTime());
		
		return dto;
	}*/

	public void insertReview() {
		ReviewDto dto = new ReviewDto();
		
		dto.setWriter("mem");
		dto.setCid(1);
		dto.setContent("sooc");
		
		
		mybatis.insert("ReviewDAO.insertReview", dto);
		mybatis.commit();

		}
		
		
		
		
		
		
		
		
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

		}
	}*/

	public static void main(String args[]) {
		ReviewDaoImpl pp = new ReviewDaoImpl();
		/*ReviewDto dto = new ReviewDto();
		pp.selectPlots();
		pp.insertOrUpdatePlots("mem1");// mem은 세션에서 받아온 게 없어서 그냥 해 둠.
		pp.selectPlots();*/
		pp.insertReview();
	}
}
