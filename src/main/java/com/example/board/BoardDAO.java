package com.example.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.example.board.BoardVO;
//import com.example.common.JDBCUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	public int insertBoard(BoardVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");

		String sql="insert into BOARD_SPRING (title, writer, content, category) values ("
				+ "'"+vo.getTitle()+"',"
				+ "'"+vo.getWriter()+"',"
				+ "'"+vo.getContent()+"',"
//				+ "'"+vo.getPhoto()+"',"
				+ "'"+vo.getCategory()+"')";

			return jdbcTemplate.update(sql);
	}

	// 글 삭제
	public int deleteBoard(int seq) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		String sql="delete from BOARD_SPRING where seq="+seq;
		return jdbcTemplate.update(sql);
	}
	public int updateBoard(BoardVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		String sql="update BOARD_SPRING set title='"+vo.getTitle()+"',"
				+" writer='"+vo.getWriter()+"',"
				+" content='"+vo.getContent()+"',"
//				+" img='"+vo.getPhoto()+"',"
				+" category='"+vo.getCategory()+"'"
				+" where seq="+vo.getSeq();

		return jdbcTemplate.update(sql);
	}

	class BoardRowMapper implements RowMapper<BoardVO> {
		@Override
		public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			System.out.println("mapRow start");
			BoardVO vo = new BoardVO();
			vo.setSeq(rs.getInt("seq"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setWriter(rs.getString("writer"));
			vo.setCategory(rs.getString("category"));
			vo.setRegdate(rs.getDate("regdate"));
			vo.setModdate(rs.getDate("moddate"));

			System.out.println("seq: "+vo.getSeq()+"  title: "+vo.getTitle()+" regDate: "+vo.getRegdate());
			return vo;
		}
	}


	public BoardVO getBoard(int seq) {
		String sql="select * from BOARD_SPRING where seq="+seq;

		return jdbcTemplate.queryForObject(sql,new BoardRowMapper());
	}

	public List<BoardVO> getBoardList(){
		String sql="select * from BOARD_SPRING order by seq ASC";

		System.out.println("getBoardList start");
		return jdbcTemplate.query(sql,new BoardRowMapper());
	}

//	public String getPhotoFilename(int seq) {
//		String filename = null;
//		try {
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(BOARD_GET);
//			stmt.setInt(1, seq);
//			rs = stmt.executeQuery();
//			if(rs.next()) {
//				filename = rs.getString("photo");
//			}
//			rs.close();
//		}catch (Exception e){
//			e.printStackTrace();
//		}
//		System.out.println(" === > JDBC로 getPhotoFilename() 기능 처리");
//		return filename;
//	}
}