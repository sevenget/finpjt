package com.sevenget.MemConcernDAO;

import java.util.List;
import java.util.Scanner;

import org.apache.ibatis.session.SqlSession;

import com.sevenget.MemConcernDTO.MemConcernDto;

import model.common.SqlSessionFatoryBean;


public class MemConcernDaoImpl implements MemConcernDao{
	static private SqlSession session = null;
		
		static {
			try {
				session = SqlSessionFatoryBean.getSqlSessionInstance();//방법2. 오토커밋이 안되는 걸 이렇게 해결!
				System.out.println(4);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
		
		public static void main(String[] args) {
			// TODO Auto-generated method stub
			MemConcernDaoImpl concern = new MemConcernDaoImpl();
			concern.start();
			System.out.println("시작");
		}
			private void start() {
				// TODO Auto-generated method stub
				Scanner input = new Scanner(System.in);
				MemConcernDto concern = null;
				String id = null;

				while(true){
					System.out.println("==============================");
					System.out.println("1. 프로그램 종료");
					System.out.println("2. 모든 사용자 출력");
					System.out.println("3. 특정 사용자 출력");
					System.out.println("4. 사용자 추가");
					System.out.println("5. 사용자 정보 변경/수정");
					System.out.println("6. 사용자 정보 삭제");
					System.out.println("7. 사용자 정보 전체 삭제");
					System.out.println("==============================");
					System.out.print("메뉴 선택 : ");
					
					int choice = Integer.parseInt(input.nextLine());
					
					switch(choice){
						case 1:
							System.out.println("프로그램이 종료됩니다.");
							System.exit(0);//시스템 종료 명령문.
							break;
						case 2:
							List<MemConcernDto> list;
							
							list = session.selectList("MemConcernDAO.getAll"); //concern.xml이랑 연결되어 있숑!
							
							for(MemConcernDto concern1 : list){
								System.out.printf("id : %s\t비밀번호 : %s\t이름 : %s \n", concern.getId(),concern.getDateCon(),concern.getMarryCon(),concern.getBabyCon(),concern.getHouseCon(),concern.getRelationCon(),concern.getDreamCon(),concern.getHopeCon());
							}
							break;
						case 3:
							System.out.print("검색하고자 하는 아이디 입력 : ");
							id = input.nextLine();
							
							//UserBean user = null;
							
							concern = (MemConcernDto) session.selectOne("MemConcernDAO.getById", id);
							
							if(concern == null){
								System.out.println("검색된 아이디가 없습니다.");
							}else{
								System.out.printf("id : %s\t연애 : %s\t결혼 : %s\t육아및출산 : %s\t내집마련 : %s\t인간관계 : %s\t꿈 : %s\t희망 : %s\t결혼 : %s\t결혼 : %s\n",concern.getId(),concern.getDateCon(),concern.getMarryCon(),concern.getBabyCon(),concern.getHouseCon(),concern.getRelationCon(),concern.getDreamCon(),concern.getHopeCon());
							}
							break;
/*						case 4: // ibatis는 오토커밋으로 우리가 저장한 내용을 프로그램 끝낼때 DB에 저장해주지만 MyBatis는 그렇지 않음! autocommit이 아님...
							System.out.println("신규 사용자 추가");
							concern = new MemConcernDto();
							
							System.out.print("새로운 사용자 아이디 입력 :");
							concern.setId(input.nextLine());
							System.out.print("새로운 사용자 비밀번호 입력 :");
							concern.setPwd(input.nextLine());
							System.out.print("새로운 사용자 이름 입력 :");
							concern.setName(input.nextLine());
							
							session.insert("insertconcern", concern);
							//session.commit(); // 방법 1. 지금까지 작업한 내용 DB에 반영해줌!!
							break;
						case 5:
							System.out.printf("수정할 사용자 아이디 입력 : ");
							id = input.nextLine();
							
						concern = (MemConcernDto) session.selectOne("selectconcernById", id);
						
						if(concern == null){
							System.out.println("해당 아이디가 존재하지 않습니다.");
						}else{
							System.out.print("새로운 사용자 비밀번호 입력 :");
							concern.setPwd(input.nextLine());
							System.out.print("새로운 사용자 이름 입력 :");
							concern.setName(input.nextLine());
							
							session.update("updateconcern", concern);
							//session.commit(); // 방법 1. 지금까지 작업한 내용 DB에 반영해줌!!

						}
							break;
						case 6:
							System.out.printf("삭제할 사용자 아이디 입력 : ");
							id = input.nextLine();

						concern = (MemConcernDto) session.selectOne("selectconcernById", id);

						if(concern == null){
							System.out.println("해당 아이디가 존재하지 않습니다.");
						}else{
							session.delete("deleteconcernById", concern);
							//session.commit(); // 방법 1. 지금까지 작업한 내용 DB에 반영해줌!!
							System.out.println("삭제 완료");
						}
							break;
						case 7:
							System.out.printf("정말로 삭제하시겠습니까? 1. Yes	2. No");
							int YN = input.nextInt();
							input.nextLine();
							
							if(YN == 1 ){
								session.delete("deleteAllconcern");
								//session.commit(); // 방법 1. 지금까지 작업한 내용 DB에 반영해줌!!

								System.out.println("삭제 완료");
								
							}else if(YN == 2){
								System.out.println("전체 사용자 삭제 취소");
							}else{
								System.out.println("대소문자 관계없이 y 또는 n을 입력해주세요.");
							}
							break;
						default:
							System.out.println("선택 메뉴를 확인하세요.");
							break;*/
					
					}
				}
			}
}
