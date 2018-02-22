package dbtest;

import model.search.KeywordAndSearchDAO;

public class DBTestMain {
	public static void main(String[] args) {


		
		KeywordAndSearchDAO dao = new KeywordAndSearchDAO();
		
		
		dao.insertKeyword("코리아");

	
	}
}
