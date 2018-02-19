package dbtest;

public class DBTestMain {
	public static void main(String[] args) {
		System.out.println(1);
		TestDAO dao = new TestDAO();
		
		TestVO vo = new TestVO();
		
		vo.setId(1);
		vo.setName("일");
		
		dao.insertTest(vo);
		
		TestVO vo1 = new TestVO();
		vo1.setId(1);
		vo1.setName("");
		vo1 = dao.getOneTest(vo1);
		System.out.println(vo1);
	}
}
