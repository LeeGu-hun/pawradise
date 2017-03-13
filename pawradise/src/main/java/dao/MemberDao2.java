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

public class MemberDao2 {
	private JdbcTemplate jdbcTemplate;
	
	public MemberDao2(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

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
				new RowMapper<Member>(){
					@Override
					public Member mapRow(ResultSet rs, int rowNum) 
							throws SQLException {
						Member member = new Member(rs.getString("Email"),
								rs.getString("password"),
								rs.getString("name"),
								rs.getTimestamp("regdate"));
						member.setId(rs.getLong("ID"));
						return member;
					}
				}, email);
		return results.isEmpty()?null: results.get(0);
	}
	
	public void insert(final Member member) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) 
					throws SQLException {
			PreparedStatement pstmt = con.prepareStatement(
				"insert into Member (email, password, name, regdate) " 
						+ "values(?,?,?,?)", new String[] { "ID" });
			pstmt.setString(1, member.getEmail()); 
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4, 
					new Timestamp(member.getRegisterDate().getTime()));
			return pstmt;
			}
		}, keyHolder);
		Number keyValue = keyHolder.getKey();
		member.setId(keyValue.longValue());
	}
	
	public void update(Member member){
		jdbcTemplate.update("update member set name=?, "
				+ "password=? where email=?", member.getName(),
				member.getPassword(), member.getEmail());
	}
	
	public List<Member> selectAll() {
		List<Member> results = jdbcTemplate.query(
				"select * from member ", 
				new RowMapper<Member>(){
					@Override
					public Member mapRow(ResultSet rs, int rowNum) 
							throws SQLException {
						Member member = new Member(rs.getString("Email"),
								rs.getString("password"),
								rs.getString("name"),
								rs.getTimestamp("regdate"));
						member.setId(rs.getLong("ID"));
						return member;
					}
				});
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
			new RowMapper<Member>() {
			public Member mapRow(ResultSet rs, int rowNum) 
					throws SQLException {
				Member member = new Member(rs.getString("EMAIL"), 
					rs.getString("PASSWORD"), rs.getString("NAME"),
					rs.getTimestamp("REGDATE"));
				member.setId(rs.getLong("ID"));
				return member;
			}
		}, from, to);
		return results;
	}
}
