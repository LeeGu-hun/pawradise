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
import org.springframework.transaction.annotation.Transactional;

import bean.Board;
import bean.Member;

public class BoardDao2 {
	private JdbcTemplate jdbcTemplate;
	
	public BoardDao2(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	//RowMapper
		private RowMapper<Board> boardRowMapper=new RowMapper<Board>() {
			@Override
			public Board mapRow(ResultSet rs, int rowNum) throws SQLException {
				Board board=new Board(
						rs.getInt("num"), 
						rs.getString("writer"), 
						rs.getString("subject"), 
						rs.getString("content"),
						rs.getString("file"), 
						rs.getInt("re_ref"), 
						rs.getInt("re_lev"), 
						rs.getInt("re_seq"), 
						rs.getInt("readcount"), 
						rs.getDate("regdate")
						);
				return board;
			}
		};

		//글의 갯수 구하기
		public int getListCount(){
			Integer listCount=jdbcTemplate.queryForObject("select count(*) from board ", Integer.class);
			return listCount;
		}
		
		//글 목록 모두 가져오기
		public List<Board> getBoardList(){
			List<Board> results=jdbcTemplate.query(
					"select * from board order by num desc", boardRowMapper);
			return results;
		}

		//글 내용보기
		public Board getDetail(int num){
			List<Board> results=jdbcTemplate.query(
					"select * from board where num=? ", boardRowMapper, num);
			return results.isEmpty()?null:results.get(0);
		}

		//글 등록하기
		@Transactional
		public void writeBoard(final Board board){
			KeyHolder keyHolder = new GeneratedKeyHolder();
			jdbcTemplate.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(
						Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(
					"insert into Board (writer, subject, content, file, "
					+ "re_ref, re_lev, re_seq, regdate) " 
					+ "values(?,?,?,?,?,?,?,now())", new String[] { "num" });
				pstmt.setString(1, board.getWriter());
				pstmt.setString(2, board.getSubject());
				pstmt.setString(3, board.getContent());
				pstmt.setString(4, board.getFile());
				pstmt.setInt(5, board.getRe_ref());
				pstmt.setInt(6, board.getRe_lev());
				pstmt.setInt(7, board.getRe_seq());
				return pstmt;
				}
			}, keyHolder);
			Number keyValue = keyHolder.getKey();
			int num = keyValue.intValue();
			jdbcTemplate.update("update board set re_ref=? where num=?", 
					num, num);
		}
		
		//글 수정하기
		public void update(Board board){
			jdbcTemplate.update("update board set subject=?, content=? where num=?", 
					board.getSubject(), board.getContent(), board.getNum());
		}
		
		//조회수 업데이트
		public void readCountUpdate(int num){
			jdbcTemplate.update("update board set readcount=readcount+1 where num=?", num);			
				}
		
		
		//검색 
		public int countPage(String srch) {
			Integer count;
			if(srch == null || srch.equals("")){
				count = jdbcTemplate.queryForObject("select count(*) from board ", Integer.class);
			} else {
				count = jdbcTemplate.queryForObject(
					"select count(*) from board where( "
					+ "subject like '%?%' or "
					+ "content like '%?%' or "
					+ "writer like '%?%' ) ", 
					Integer.class, srch, srch, srch);
			}
			return count;
		}
		
		
		//페이징처리
		public List<Board> selectPage(String srch,int startPage, int limit) {
			List<Board> results;
			if(srch == null || srch.equals("")){				
				results = jdbcTemplate.query(
						"select num, (select name from member where id=num) "
						+ "writer, subject, content, "
						+ "file, re_ref, re_lev, re_seq, readcount, regdate from board limit ?,? ",
						boardRowMapper, startPage, limit);
			} else {
				results = jdbcTemplate.query(
					"select num, (select name from member where id=num) writer, subject, content, "
					+ "file, re_ref, re_lev, re_seq, readcount, regdate from board where( "
					+ "subject like '%?%' or "
					+ "content like '%?%' or "
					+ "writer like '%?%' ) limit ?,?", 
					boardRowMapper, srch, srch, srch, startPage, limit);
			}
			return results;
		}

		//게시글삭제
		public void getDelete(int num) {
			jdbcTemplate.update("delete from board where num = ?",	num);
		}
	
	
}
