package model.plots;
/*만들어진 plot의 저장 및 수정에 대한 내용을 우선적으로 만듦*/
import java.util.List;
import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import model.common.SqlSessionFactoryBean;



public class PlotsDaoImpl implements PlotsDao{
	static private SqlSession session = null;
		
		static {
			try {
				session = SqlSessionFactoryBean.getSqlSessionInstance();//방법2. 오토커밋이 안되는 걸 이렇게 해결!
				System.out.println(4);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		
		public static void main(String[] args) {
			// TODO Auto-generated method stub
			PlotsDaoImpl pplots = new PlotsDaoImpl();
			pplots.start();
			System.out.println("시작");
		}
			private void start() {
				// TODO Auto-generated method stub
				Scanner input = new Scanner(System.in);
				PlotsDto pplots = new PlotsDto();
				String id = null;

				while(true){
					System.out.println("==============================");
					System.out.println("1. 프로그램 종료");
					System.out.println("2. 모두 출력");
					System.out.println("3. 특정 사용자의 plot 출력");
					System.out.println("4. ggradar.png 저장 및 수정");
					System.out.println("==============================");
					System.out.print("메뉴 선택 : ");
					
					int choice = Integer.parseInt(input.nextLine());
					
					switch(choice){
						case 1:
							System.out.println("프로그램이 종료됩니다.");
							System.exit(0);//시스템 종료 명령문.
							break;
						case 2:
							List<PlotsDto> list;
							
							list = session.selectList("PlotsDAO.getAll"); //concern.xml이랑 연결되어 있숑!
							
							for(PlotsDto pplots1 : list){
								System.out.printf("id : %s\t비밀번호 : %s\t이름 : %s \n", pplots.getMemid(),pplots.getPlotpng(),pplots.getSavedTime());
							}
							break;
						case 3:
							System.out.print("검색하고자 하는 아이디 입력 : ");
							id = input.nextLine();
							
							pplots = (PlotsDto) session.selectOne("PlotsDAO.getById", id);
							
							if(pplots == null){
								System.out.println("검색된 아이디가 없습니다.");
							}else{
								System.out.printf("id : %s\tpng : %s\ttime : %s\n",pplots.getMemid(),pplots.getPlotpng(),pplots.getSavedTime());
							}
							break;
						case 4: // ibatis는 오토커밋으로 우리가 저장한 내용을 프로그램 끝낼때 DB에 저장해주지만 MyBatis는 그렇지 않음! autocommit이 아님...
							System.out.println("신규 사용자 추가");
							pplots = new PlotsDto();
							
							System.out.print("새로운 사용자 아이디 입력 :");
							pplots.setMemid(input.nextLine());
							System.out.print("새로운 사용자 plotpng 입력 :");
							pplots.setPlotpng(input.nextLine());
							
							session.insert("PlotsDAO.insertPlts", pplots);
							//session.commit(); // 방법 1. 지금까지 작업한 내용 DB에 반영해줌!!
							break;
						case 5:
							System.out.printf("수정할 사용자 아이디 입력 : ");
							id = input.nextLine();
							
							pplots = (PlotsDto) session.selectOne("PlotsDAO.modifyById", id);
						
						if(pplots == null){
							System.out.println("해당 아이디가 존재하지 않습니다.");
						}else{
							System.out.print("새로운 사용자 plotpng 입력 :");
							pplots.setPlotpng(input.nextLine());
							System.out.print("새로운 사용자 이름 입력 :");
							pplots.setMemid(input.nextLine());
							
							session.update("updateconcern", pplots);
							//session.commit(); // 방법 1. 지금까지 작업한 내용 DB에 반영해줌!!

						}
							break;
					
					}
				}
			}
}
