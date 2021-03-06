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
import xml.Data;
import xml.MemData;

public class MemberDao {
	private JdbcTemplate jdbcTemplate;

	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private RowMapper<Member> memRowMapper = new RowMapper<Member>() {
		@Override
		public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
			Member member = new Member(rs.getString("name"), rs.getString("password"), rs.getString("email"),
					rs.getString("Phone"), rs.getDate("regdate"));
			member.setUserNum(rs.getInt("userNum"));
			return member;
		}
	};

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int count2() {
		List<Integer> results = jdbcTemplate.query("select count(*) from member ", new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
				return rs.getInt(1);
			}
		});
		return results.get(0);
	}

	public int count() {
		Integer count = jdbcTemplate.queryForObject("select count(*) from member ", Integer.class);
		return count;
	}

	public Member selectByEmail(String email) {
		List<Member> results = jdbcTemplate.query("select * from member where email=? ", memRowMapper, email);
		return results.isEmpty() ? null : results.get(0);
	}

	public void insert(final Member member) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con
						.prepareStatement("insert into Member (userNum, name, password, email, phone) "
								+ "values(member_seq.NEXTVAL,?,?,?,?)");
				pstmt.setString(1, member.getName());
				pstmt.setString(2, member.getPassword());
				pstmt.setString(3, member.getEmail());
				pstmt.setString(4, member.getPhone());
				return pstmt;
			}
		});

	}

	public boolean update(String newPassword, String email) {
		boolean result = false;
		jdbcTemplate.update("update member set password=? where email=?", newPassword, email);
		return result;
	}

	public List<Member> selectAll() {
		List<Member> results = jdbcTemplate.query("select * from member ", memRowMapper);
		return results;
	}

	public int countPage(Date from, Date to) {
		Integer count = jdbcTemplate.queryForObject("select count(*) from member " + "where REGDATE between ? and ? ",
				Integer.class, from, to);
		return count;
	}

	public List<Member> selectPage(Date from, Date to, int startPage, int limit) {
		List<Member> results = jdbcTemplate.query("select * from member " + "where REGDATE between ? and ? "
				+ "order by regdate desc, id desc " + "limit ?,? ", memRowMapper, from, to, startPage, limit);
		return results;
	}

	public boolean memberDelete(int userNum) {
		boolean result = false;
		jdbcTemplate.update("delete from MEMBER where usernum = ?", userNum);
		return result;
	}

	public List<Member> selectByRegdate(Date from, Date to) {
		List<Member> results = jdbcTemplate.query(
				"select * from MEMBER where REGDATE between ? and ? " + "order by REGDATE desc ", memRowMapper, from,
				to);
		return results;
	}

	public Member selectByUserNum(int userNum) {
		List<Member> results = jdbcTemplate.query("select * from member where usernum=? ", memRowMapper, userNum);
		return results.isEmpty() ? null : results.get(0);
	}

	// xml 마이페이지
	public List<MemData> xmlMyList(int userNum) {

		List<MemData> results = jdbcTemplate.query("select * from member where userNum=? ",

				new RowMapper<MemData>() {
					@Override
					public MemData mapRow(ResultSet rs, int c_seq) throws SQLException {
						MemData memdata = new MemData(rs.getString("name"), rs.getString("password"),
								rs.getString("email"), rs.getString("phone"), rs.getInt("userNum"));
						return memdata;
					}
				}, userNum);

		return results;
	}
}
