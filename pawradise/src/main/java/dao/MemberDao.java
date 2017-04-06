package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import bean.Member;

public class MemberDao {
	private JdbcTemplate jdbcTemplate;
	
	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	private RowMapper<Member> memRowMapper = new RowMapper<Member>() {
		@Override
		public Member mapRow(ResultSet rs, int rowNum) 
				throws SQLException {
			Member member = new Member(rs.getString("id"), rs.getString("name"),rs.getString("password"),
					rs.getString("email"), rs.getString("petName"), rs.getString("Phone"), rs.getString("address"),rs.getDate("regdate"));
			member.setUserNum(rs.getInt("userNum"));
			return member;
		}
	};

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public int count2(){
		List<Integer> results = jdbcTemplate.query(
				"select count(*) from member ", 
				new RowMapper<Integer>(){
					@Override
					public Integer mapRow(ResultSet rs, int rowNum) 
							throws SQLException {
						return rs.getInt(1);
					}
				});
		return results.get(0);
	}

	public int count() {
		Integer count = jdbcTemplate.queryForObject(
				"select count(*) from member ", Integer.class);
		return count;
	}

	public Member selectByEmail(String email){
		List<Member> results = jdbcTemplate.query(
				"select * from member where email=? ", 
				memRowMapper, email);
		return results.isEmpty()?null: results.get(0);
	}
	
	public void insert(final Member member) {
		jdbcTemplate.update(new PreparedStatementCreator() {			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) 
					throws SQLException {
			PreparedStatement pstmt = con.prepareStatement(
				"insert into Member (userNum, id, name, password, email, petname, phone, address) " 
						+ "values(member_seq.NEXTVAL,?,?,?,?,?,?,?)");			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword()); 
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPetName());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getAddress());
			return pstmt;
			}
		});

	} 
	
	public void update(Member member){
		jdbcTemplate.update("update member set name=?, "
				+ "password=? where email=?", member.getName(),
				member.getPassword(), member.getEmail());
	}
	
	public List<Member> selectAll() {
		List<Member> results = jdbcTemplate.query(
				"select * from member ", memRowMapper);
		return results;
	}
	public int countPage(Date from, Date to) {
		Integer count = jdbcTemplate.queryForObject(
				"select count(*) from member "
				+ "where REGDATE between ? and ? ", Integer.class,
				from, to);
		return count;
	}
	public List<Member> selectPage(Date from, Date to, int startPage, int limit) {
		List<Member> results = jdbcTemplate.query(
				"select * from member "
				+ "where REGDATE between ? and ? "
				+ "order by regdate desc, id desc "
				+ "limit ?,? ",
				memRowMapper, from, to, startPage, limit);
		return results;
	}
	public void memberDelete(Member member) {
		jdbcTemplate.update(
				"delete from MEMBER where EMAIL = ?", 
				member.getEmail());
	}
	public List<Member> selectByRegdate(Date from, Date to) {
		List<Member> results = jdbcTemplate.query(
			"select * from MEMBER where REGDATE between ? and ? "
			+ "order by REGDATE desc ", 
			memRowMapper, from, to);
		return results;
	}
	public Member selectByUserNum(int userNum) {
		List<Member> results = jdbcTemplate.query("select * from member where usernum=? ", memRowMapper, userNum);
		return results.isEmpty()?null: results.get(0);
	}
}
