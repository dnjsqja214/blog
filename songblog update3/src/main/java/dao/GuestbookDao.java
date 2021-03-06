package dao;
import java.util.ArrayList;
import vo.Guestbook;
import java.sql.*;
public class GuestbookDao {
	// 생성자 메서드
	public GuestbookDao() {}
	
	public ArrayList<Guestbook> guestList(String writer, int beginRow, int rowPerPage) throws Exception{
		ArrayList<Guestbook> list = new ArrayList<Guestbook>();
		Class.forName("org.mariadb.jdbc.Driver");
		
		// 데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dburl = "jdbc:mariadb://13.124.231.44/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		String sql="SELECT guestbook_no guestbookNo, guestbook_content guestbookContent,guestbook_memo  guestbookMemo, writer, create_date createDate FROM guestbook WHERE writer=? ORDER BY create_date DESC LIMIT ?, ?;";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 
		stmt = conn.prepareStatement(sql);
		stmt.setString(1,writer );
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		rs = stmt.executeQuery();
		
		// 데이터 변환(가공)
		while(rs.next()) {
			Guestbook g = new Guestbook();
			g.setGuestbookNo(rs.getInt("guestbookNo"));
			g.setGuestbookContent(rs.getString("guestbookContent"));
			g.setGuestbookMemo(rs.getString("guestbookMemo"));
			g.setWriter(rs.getString("writer"));
			g.setCreateDate(rs.getString("createDate"));
			list.add(g);
		}
		
		// 데이터베이스 자원들 반환
		rs.close();
		stmt.close();
		conn.close();
		
		return list;
	}
	
	// guestbook n행씩 반환 메서드
	public ArrayList<Guestbook> selectGuestbookListByPage(int beginRow, int rowPerPage) throws Exception {
		ArrayList<Guestbook> list = new ArrayList<Guestbook>();
		// guestbook 10행 반환되도록 구현
		Class.forName("org.mariadb.jdbc.Driver");
		
		// 데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dburl = "jdbc:mariadb://13.124.231.44/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		/*
		 SELECT guestbook_no guestbookNo, guestbook_content guestbookContent, writer, create_date createDate 
		 FROM guestbook 
		 ORDER BY create_date 
		 DESC LIMIT ?, ?
		 */
		String sql = "SELECT guestbook_no guestbookNo, guestbook_content guestbookContent,guestbook_memo  guestbookMemo, writer, create_date createDate FROM guestbook ORDER BY create_date DESC LIMIT ?, ?";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		rs = stmt.executeQuery();
		// 데이터베이스 로직 끝
		
		// 데이터 변환(가공)
		while(rs.next()) {
			Guestbook g = new Guestbook();
			g.setGuestbookNo(rs.getInt("guestbookNo"));
			g.setGuestbookContent(rs.getString("guestbookContent"));
			g.setGuestbookMemo(rs.getString("guestbookMemo"));
			g.setWriter(rs.getString("writer"));
			g.setCreateDate(rs.getString("createDate"));
			list.add(g);
		}
		
		// 데이터베이스 자원들 반환
		rs.close();
		stmt.close();
		conn.close();
	
		return list;
	}
	// 수정(guestbookOne, updateGuestbook) 프로세스 구현
	
	public Guestbook selectGuestbookOne(int guestbookNo) throws Exception {
		Guestbook guestbook = null;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dburl = "jdbc:mariadb://13.124.231.44/guestbook";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw);
		
		String sql = "SELECT guestbook_no guestbookNo, guestbook_content guestbookContent FROM guestbook WHERE guestbook_no = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, guestbookNo);
		System.out.println(stmt+" <-- sql selectGuestbookOne");
		rs = stmt.executeQuery();
		if(rs.next()) {
			guestbook = new Guestbook(); // 생성자메서드
			guestbook.setGuestbookNo(rs.getInt("guestbookNo"));
			guestbook.setGuestbookContent( rs.getString("guestbookContent"));
		}
		rs.close();
		stmt.close();
		conn.close();
		return guestbook;
	}
	// updateGuestbookForm.jsp에서 호출
	// updateGuestbookAction.jsp에서 호출
	// 이름 - uddateGuestbook
	// 반환값 - 수정한 행의 수 반환 -> 0수정실패, 1수정성공 -> int
	// 입력 매개값 - guestbookNo, guestbookContent, guestbookPw 3개 -> 하나의 타입 매개변수로 받고 싶다 -> Guestbook 타입을 사용
	public int updateGuestbook(Guestbook guestbook) throws Exception {
		int row = 0;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String dburl = "jdbc:mariadb://13.124.231.44/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 
		
		String sql = "UPDATE guestbook SET guestbook_content=?, guestbook_memo=? WHERE guestbook_no=? AND guestbook_pw=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, guestbook.getGuestbookContent());
		stmt.setString(2, guestbook.getGuestbookMemo());
		stmt.setInt(3, guestbook.getGuestbookNo());
		stmt.setString(4, guestbook.getGuestbookPw());
		System.out.println(stmt+" <-- sql updateGuestbook"); 
		row = stmt.executeUpdate();
		
		stmt.close();
		conn.close();
		
		return row;
	}
	// 삭제(deleteGuestbook) 프로세스 deleteGuestbookAction.jsp 호출
	// 이름 - deleteGuestbook
	// 반환값 - 삭제한 행의 수 반환 -> 0수정실패, 1수정성공 -> int
	// 입력 매개값 - guestbookNo, guestbookPw 2개 -> int, String 타입을 사용 (Guestbook타입을 사용해도 된다.)
	public int deleteGuestbook(int guestbookNo, String guestbookPw) throws Exception {
		int row = 0;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String dburl = "jdbc:mariadb://13.124.231.44/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 
		
		String sql = "DELETE FROM guestbook WHERE guestbook_no=? AND guestbook_pw=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, guestbookNo);
		stmt.setString(2, guestbookPw);
		System.out.println(stmt+" <-- sql deleteGuestbook"); 
		row = stmt.executeUpdate();
		
		stmt.close();
		conn.close();
		
		return row;
	}
	// 입력 프로세스 insertGuestbookAction.jsp에서 호출
	public void insertGuestbook(Guestbook guestbook) throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String dburl = "jdbc:mariadb://13.124.231.44/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		/* INSERT INTO guestbook(
		 	guestbook_content, writer, guestbook_pw, create_date, update_date
		 ) VALUES(?,?,?,NOW(),NOW()) */
		String sql = "INSERT INTO guestbook(guestbook_content,guestbook_memo, writer, guestbook_pw, create_date, update_date) VALUES(?,?,?,?,NOW(),NOW())";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, guestbook.getGuestbookContent());
		stmt.setString(2, guestbook.getGuestbookMemo());
		stmt.setString(3, guestbook.getWriter());
		stmt.setString(4, guestbook.getGuestbookPw());
		int row = stmt.executeUpdate();
		if(row == 1) {
			System.out.println("입력성공");
		} else {
			System.out.println("입력실패");
		}
		stmt.close();
		conn.close();
	}

	// guestbook 전체 행의 수를 반환 메서드
	public int selectGuestbookTotalRow() throws Exception {
		int row = 0;
		Class.forName("org.mariadb.jdbc.Driver");
		// 데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dburl = "jdbc:mariadb://13.124.231.44/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		
		String sql = "SELECT COUNT(*) cnt FROM guestbook";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		if(rs.next()) {
			row = rs.getInt("cnt");
		}
		return row;
	}
	
}
