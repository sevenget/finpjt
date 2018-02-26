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
	

	public ReviewDto selectReview() {
		/*List<ReviewDto> list;
		
		list = mybatis.selectOne("");
		
		for(ReviewDto dto : list) {
			System.out.printf("%s \t  %s \t  %s \t  %s \n",dto.getWriter(), dto.getCid(), dto.getContent(), dto.getReviewdate() );
		} */
		
        /*System.out.print(" 입력 : ");*/
        int id = 1;
        
        ReviewDto dto = new ReviewDto();
        dto = (ReviewDto) mybatis.selectOne("ReviewDAO.getReview", id);
        
        if(dto == null){
           System.out.println("리뷰가 등록되어 있지 않습니다.");
        }else{
           System.out.printf("%s\t%s\n",dto.getContent(), dto.getReviewdate());
        }
		return dto;
		
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
		//pp.insertReview();
		pp.selectReview();
	}
}
