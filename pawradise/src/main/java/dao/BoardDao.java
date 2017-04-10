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
					rs.getInt("reply"),rs.getInt("pub"),rs.getInt("userNum"));
			return board;
		}
	};

	// 글의 갯수 구하기
	public int getListCount() {
		Integer listCount = jdbcTemplate.queryForObject("select count(*) from board", Integer.class);
		return listCount;
	}

	// 글 목록 가져오기
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
				PreparedStatement pstmt = con.prepareStatement("insert into board (seq, name, title, content, filename, readcount, reply, pub, userNum) "
								+ "values (board_seq.NEXTVAL, ?, ?, ?, ?, 0,0,?,?)");
				pstmt.setString(1, board.getName());
				pstmt.setString(2, board.getTitle());
				pstmt.setString(3, board.getContent());
				pstmt.setString(4, board.getFileName());
				pstmt.setInt(5, board.getPub());
				pstmt.setInt(6, board.getUserNum());
				return pstmt;
			}
		});
	}

	// comment입력
	public void insertComment(final Comment comment,final int seq) {
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement("insert into comment_t(seq, c_seq, name, c_content, userNum) "
								+ "values (?, comment_seq.NEXTVAL, ?, ?, ?)");
				pstmt.setInt(1, seq);
				pstmt.setString(2, comment.getName());
				pstmt.setString(3, comment.getC_content());
				pstmt.setInt(4, comment.getUserNum());
				return pstmt;
			}
		});

	}
	
	//commnet리스트
	public List<Comment> commentList(int seq){
		
		List<Comment> results=jdbcTemplate.query("select * from comment_t where seq = ? ORDER BY regDATE desc ",
				
				new RowMapper<Comment>(){
					@Override
					public Comment mapRow(ResultSet rs, int c_seq) throws SQLException {
						Comment comment=new Comment(rs.getInt("c_seq"), rs.getString("name"), 
								rs.getString("c_content"),  rs.getDate("regdate"), rs.getInt("userNum"));
						return comment;
					}				
				},seq);
		
		return results;
	}

	
	//commnet 갯수
		public void getCountComment(int seq) {
			jdbcTemplate.update("update board set reply=(select count(*) from comment_t where seq = ?) where seq=?",seq, seq);
		}

	
	// comment 1개만 삭제
	public boolean commnet1Delete(int c_seq) {
		boolean result = false;
		jdbcTemplate.update("delete from comment_t where c_seq = ?", c_seq);

		return result;
	}
	
	// 게시글 삭제시 comment 삭제
	public boolean commnetDelete(int seq) {
		boolean result = false;
		jdbcTemplate.update("delete from comment_t where seq = ?", seq);

		return result;
	}

	// 페이지 수
	public int countPage(String srch) {
		Integer count;

		if (srch == null || srch.equals("")) {
			count = jdbcTemplate.queryForObject("select count(*) from board where pub=1", Integer.class);
		} else {
			count = jdbcTemplate.queryForObject(
					"select count(*) from board where "
					+ "(name like '%' || ? || '%' or title like '%' || ? || '%' or content like '%' || ? || '%') and pub=1", 
					Integer.class, srch, srch, srch);
		}
		System.out.println("페이지 count "+count);
		return count;
	}

	// 마이페이지 수
	public int countMyPage(String srch, int userNum) {
		Integer count;

		if (srch == null || srch.equals("")) {
			count = jdbcTemplate.queryForObject("select count(*) from board where userNum=? ", Integer.class, userNum);
		} else {
			count = jdbcTemplate.queryForObject(
					"select count(*) from board where "
					+ "(name like '%' || ? || '%' or title like '%' || ? || '%' or content like '%' || ? || '%') and userNum=? ", 
					Integer.class, srch, srch, srch, userNum);
		}
		System.out.println("페이지 count "+count);
		return count;
	}
	
	//마이페이지 페이징처리
	public List<Board> selectMyPage(String srch, int startPage, int limit, int userNum) {
			List<Board> results;
			if (srch == null || srch.equals("")) {
				results = jdbcTemplate.query("select * from (select rownum rnum, seq, name,"
						+ "title, content, filename, regdate, readcount, reply, pub, userNum from (select rownum rnum, seq, name,"
						+ "title, content, filename, regdate, readcount, reply, pub, userNum from "
					    + "(select * from board order by seq desc))where usernum=?) where rnum>=? and rnum<=?" ,
						boardRowMapper, userNum, startPage, (startPage+limit));
			} else {
				results = jdbcTemplate.query(
						"select * from (select rownum rnum, seq, name, title, content, filename, regdate, readcount, reply, pub, userNum from "
					               + "(select * from board order by seq desc)) where "
					               + "(name like '%' || ? || '%' or title like '%' || ? || '%' or content like '%' || ? || '%') and userNum=?",
						boardRowMapper, srch, srch, srch,userNum);
			}
			System.out.println("srch "+srch+" startPage: "+startPage+" limit: "+ (startPage+limit));
			System.out.println("페이징결과 result "+results);
			return results;
		}
	
	
	
	
	// 페이징처리
	   public List<Board> selectPage(String srch, int startPage, int limit) {
	      List<Board> results;
	      if (srch == null || srch.equals("")) {
	         results = jdbcTemplate.query("select * from (select rownum rnum, seq, name,"
						+ "title, content, filename, regdate, readcount, reply, pub, userNum from (select rownum rnum, seq, name,"
						+ "title, content, filename, regdate, readcount, reply, pub, userNum from "						
						+ "(select * from board order by seq desc))where pub=1) where rnum>=? and rnum<=?",
	               boardRowMapper, startPage, (startPage+limit));
	      } else {   
	         results = jdbcTemplate.query(
	               "select * from (select rownum rnum, seq, name, title, content, filename, regdate, readcount, reply, pub, userNum from "
	               + "(select * from board order by seq desc)) where "
	               + "(name like '%' || ? || '%' or title like '%' || ? || '%' or content like '%' || ? || '%') and pub=1",
	               boardRowMapper, srch, srch, srch);
	      }
	      System.out.println("srch "+srch+" startPage: "+startPage+" limit: "+ (startPage+limit));
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

	// 조회수 업데이트
	public void readCountUpdate(int seq) {
		jdbcTemplate.update("update board set readcount=readcount+1 where seq=?", seq);
	}


}
