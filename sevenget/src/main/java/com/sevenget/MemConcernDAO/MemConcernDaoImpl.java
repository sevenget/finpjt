package com.sevenget.MemConcernDAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

public class MemConcernDaoImpl implements MemConcernDao{
	/*	@Repository // 빈객체 자동생성...? 어떤 클래스가 그 역할을 충족시켰거나 레파지토리의 stereotype (또는 데이터 접근계층이나 DAO로 알려진)이라는 표시
	public class MemberDaoImpl implements MemberDao{
		
		@Autowired // 의존성 주입!! @Autowired 어노테이션을 사용하면 get/set 접근 메서드를 만들지 않아도 SpringFramework이 설정 파일을 통해서 알아서 get/set 접근 메서드 대신 일을 해주도록 함.
		private JdbcTemplate jdbcTemplate;
		
		@Override
	    public int getMemberCount() {
	       String sql = "select count(*) from spring_member";
	       int count = jdbcTemplate.queryForObject(sql, new RowMapper<Integer>() {

	          @Override
	          public Integer mapRow(ResultSet arg0, int arg1) throws SQLException {
	             return arg0.getInt("count(*)");

	          }});

	       return count;
	    }
		@Override
		public List<MemberDto> getMemberList(int startRow, int endRow) {
			// TODO Auto-generated method stub
			String sql = "select * from (select a.*, rownum rnum from (select * from spring_member order by reg_date desc) a ) where rnum >= ? and rnum <= ?";
			// 1.  날짜에 따라 정렬 2.  정렬된 표에서 rnum생성해서 불러오기 3. 조건 안에서 전체 불러오기

			List<MemberDto> list = jdbcTemplate.query(sql, new Object[]{startRow,endRow}, new RowMapper<MemberDto>(){

				@Override
				public MemberDto mapRow(ResultSet arg0, int arg1) throws SQLException {
					// TODO Auto-generated method stub
					MemberDto member = new MemberDto();
					member.setId(arg0.getString("id"));
					member.setPasswd(arg0.getString("passwd"));
					member.setName(arg0.getString("name"));
					member.setReg_date(arg0.getDate("reg_date"));
					
					return member; //list에 차곡차곡 쌓아주기..
				}});
			
			return list;
		}

		@Override
		public int insertMember(MemberDto member) {
			// TODO Auto-generated method stub
			String sql = "insert into spring_member values(?, ?, ?, sysdate)";
			return jdbcTemplate.update(sql, 
					new Object[]{member.getId(), 
										  member.getPasswd(),
										  member.getName()});
		}

		@Override
		public MemberDto getDetailMember(String id) {
			// TODO Auto-generated method stub
			String sql = "select * from spring_member where id=?";
			MemberDto memberDto
				= jdbcTemplate.queryForObject(sql, 
												new Object[]{id},
												new RowMapper<MemberDto>(){

							@Override
							public MemberDto mapRow(ResultSet arg0, int arg1) throws SQLException {
								// TODO Auto-generated method stub
								MemberDto member = new MemberDto();
								member.setId(arg0.getString("id"));
								member.setPasswd(arg0.getString("passwd"));
								member.setName(arg0.getString("name"));
								member.setReg_date(arg0.getDate("reg_date"));
								
								System.out.printf("id:%s, passwd:%s, name:%s, data:%s \n",
															 member.getId(), member.getPasswd(),
															 member.getName(), member.getReg_date());
								return member;
							}});
			
			return memberDto;
		}

		@Override
		public int updateMember(MemberDto memberDto) {
			// TODO Auto-generated method stub
			String sql = "update spring_member set passwd=?, name=? where id=?";
			
			return jdbcTemplate.update(sql, 
					new Object[]{memberDto.getPasswd(), 
										  memberDto.getName(),
										  memberDto.getId()});
			
		}

		@Override
		public int deleteMember(String id) {
			// TODO Auto-generated method stub
			String sql = "delete from spring_member where id=?";
			return jdbcTemplate.update(sql, new Object[]{id});
		}
*/
		


}
