package model.review;

import java.util.List;

/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import org.apache.ibatis.session.SqlSession;

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
		//System.out.println(cnt);
		return cnt;
	}
	
	// 해당 기업에 대한 댓글 전체 불러오기
	public List<ReviewDto> selectReview(int cid) {
		 return mybatis.selectList("ReviewDAO.getReview",cid);
	}
	
	// 댓글 등록
	public void insertReview(String writer,int cid, String content) {
		ReviewDto dto = new ReviewDto();

		dto.setWriter(writer);//세션으로 받아오기
		dto.setCid(cid);//세션이든 파리메터든...
		dto.setContent(content);

		mybatis.insert("ReviewDAO.insertReview", dto);
		mybatis.commit();

	}

	public static void main(String args[]) {
		ReviewDaoImpl pp = new ReviewDaoImpl();
		// pp.insertReview();
		pp.selectReview(1);
		pp.getListCount();
	}
}
