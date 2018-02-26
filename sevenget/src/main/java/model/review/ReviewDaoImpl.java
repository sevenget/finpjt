package model.review;

import java.util.List;

import javax.annotation.Resource;

/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.common.SqlSessionFactoryBean;

//@Service("ReviewDao")
public class ReviewDaoImpl implements ReviewDao {
	private SqlSession mybatis;

	//@Resource(name = "ReviewDto")
	//private ReviewDto reviewDto;

	public ReviewDaoImpl() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
		
	//댓글의 개수 구하기
	public int getListCount() {
		int cnt = (int) mybatis.selectOne("ReviewDAO.selectCount",1);
		System.out.println(cnt);
		return cnt;
	}
	
	// 해당 기업에 대한 댓글 전체 불러오기
	public List<ReviewDto> selectReview() {
		 ReviewDto dto = new ReviewDto();
		 List<ReviewDto> list = mybatis.selectList("ReviewDAO.getReview",1); // 1 자리에는 cid가 들어가야 함. 컨트롤러 통해 파라미터로 받아올것!
		 if(dto == null){
				System.out.println("검색된 아이디가 없습니다.");
			}else{
				/*for(ReviewDto dto1 : list){
				System.out.printf("%s\t%s\t%s\n",dto1.getWriter(),dto1.getCid(),dto1.getContent());
				}*/
			}
		 return list;
		}
	
	// 댓글 등록
	public void insertReview() {
		ReviewDto dto = new ReviewDto();

		dto.setWriter("mem");
		dto.setCid(1);
		dto.setContent("sooc");

		mybatis.insert("ReviewDAO.insertReview", dto);
		mybatis.commit();

	}

	public static void main(String args[]) {
		ReviewDaoImpl pp = new ReviewDaoImpl();
		// pp.insertReview();
		pp.selectReview();
		pp.getListCount();
	}
}
