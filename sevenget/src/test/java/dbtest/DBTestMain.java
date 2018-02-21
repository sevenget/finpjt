package dbtest;

import java.util.List;

import model.member.MemBasicInfoDAO;
import model.member.MemBasicInfoDTO;

public class DBTestMain {
	public static void main(String[] args) {
		MemBasicInfoDAO dao = new MemBasicInfoDAO();
				
		List<MemBasicInfoDTO> list = dao.getMemBasicInfo();
		
		for(MemBasicInfoDTO e : list){
			System.out.println(e.getId());
		}
	}
}
