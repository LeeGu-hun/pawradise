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
import org.springframework.transaction.annotation.Transactional;

import bean.Board;
import bean.Comment;

public class BoardDao {
	private JdbcTemplate jdbcTemplate;

	public BoardDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// RowMapper
	private RowMapper<Board> boardRowMapper = new RowMapper<Board>() {
		@Override
		public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
			Board board = new Board(rs.getInt("seq"), rs.getString("name"), rs.getString("title"),
					rs.getString("content"), rs.getString("fileName"), rs.getDate("regdate"), rs.getInt("readCount"),
					rs.getInt("reply"));
			return board;
		}
	};

	// 글의 갯수 구하기
	public int getListCount() {
		Integer listCount = jdbcTemplate.queryForObject("select count(*) from board ", Integer.class);
		return listCount;
	}

	// 글 목록 모두 가져오기
	public List<Board> getBoardList() {
		List<Board> results = jdbcTemplate.query("select * from board", boardRowMapper);
		return results;
	}

	// 글 내용보기
	public Board getDetail(int seq) {
		List<Board> results = jdbcTemplate.query("select * from board where seq=? ", boardRowMapper, seq);
		return results.isEmpty() ? null : results.get(0);
	}

	// 글 등록하기
	
	@Transactional
	public void add(final Board board) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con
						.prepareStatement("insert into board (seq, name, passwd, title, content, readcount, reply) "
								+ "values (board_seq.NEXTVAL, ?, ?, ?, ?, 0,0);");
				pstmt.setString(1, board.getName());
				pstmt.setString(2, board.getTitle());
				pstmt.setString(3, board.getContent());
				pstmt.setString(4, board.getFileName());
				return pstmt;
			}
		});
	}

	// comment입력
	public void insertComment(final Comment comment) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con
						.prepareStatement("insert into comment_t(c_seq, name, c_content) values (comment_seq.NEXTVAL, ?, ?)");
				pstmt.setString(1, comment.getName());
				pstmt.setString(2, comment.getC_content());
				return pstmt;
			}
		});

	}
	//commnet리스트
	public Comment commentList(int seq){
		List<Comment> results=jdbcTemplate.query("select * from comment_t where c_seq = ?  ", 
				
				new RowMapper<Comment>(){
					@Override
					public Comment mapRow(ResultSet rs, int seq) throws SQLException {
						Comment comment=new Comment(rs.getString("name"), rs.getString("c_content"));
						comment.setC_seq(rs.getInt("c_seq"));
						return comment;
					}				
				},seq);
		return results.isEmpty()?null:results.get(0);
	}

	//http://ojc.asia/bbs/board.php?bo_table=LecSpring&wr_id=252+663 참고
	

	// 조회수 업데이트
	public void readCountUpdate(int seq) {
		jdbcTemplate.update("update board set readcount=readcount+1 where seq=?", seq);
	}

	// 페이지 수
	public int countPage(String srch) {
		Integer count;

		if (srch == null || srch.equals("")) {
			count = jdbcTemplate.queryForObject("select count(*) from board ", Integer.class);
		} else {
			count = jdbcTemplate.queryForObject(
					"select count(*) from board where "
					+ "(title like '%?%' or content like '%?%' or name like '%?%')", 
					Integer.class, srch, srch, srch);
		}
		System.out.println("페이지 count "+count);
		return count;
	}

	
	// 페이징처리
	public List<Board> selectPage(String srch, int startPage, int limit) {
		List<Board> results;
		if (srch == null || srch.equals("")) {
			results = jdbcTemplate.query("select * from (select rownum rnum, seq, name, title, "
					+ "content, filename, regdate, readcount, reply from "
					+ "(select * from board order by seq desc)) where rnum>=? and rnum<=? " ,
					boardRowMapper, startPage, limit);
		} else {
			results = jdbcTemplate.query(
					"select * from (select rownum rnum, seq, name, title, "
					+ "content, filename, regdate, readcount, reply from "
					+ "(select * from board order by seq desc)) where "
					+ "(title like '%"	+ "?" + "%' or content like '%"+ "?"+ "%' or name like '%"+ "?"	+ "%') "
					+ "where rnum>=? and rnum<=? ",
					boardRowMapper, srch, srch, srch, startPage, limit);
		}
		System.out.println("페이징결과 result "+results);
		return results;
	}
	
	// 게시글삭제
	public boolean delete(int seq) {
		boolean result = false;
		jdbcTemplate.update("delete from board where seq = ?", seq);

		return result;
	}


	 // 글 수정하기 
	public void update(Board board) {
	 jdbcTemplate.update("update board set title=?, content=? where seq=?",
	 board.getTitle(), board.getContent(), board.getSeq()); }

}
