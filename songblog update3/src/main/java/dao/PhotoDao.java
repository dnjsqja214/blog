package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Photo;

public class PhotoDao {
	// 총개수
	public int photoTotalCount() throws Exception{
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
	    String dburl = "jdbc:mariadb://13.124.231.44/blog";
	    String dbuser = "root";
	    String dbpw = "mariadb1234";
	    conn = DriverManager.getConnection(dburl,dbuser,dbpw);
	    
	    int row = 0;
	    String sql = "SELECT COUNT(*) cnt FROM photo";
	    stmt = conn.prepareStatement(sql);
	    rs = stmt.executeQuery();
	    if(rs.next()) {
			row = rs.getInt("cnt");
		}
	    rs.close();
	    stmt.close();
		conn.close();
		return row;
	}
	// update
	public int updatePhoto(Photo photo) throws Exception{
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
	    String dburl = "jdbc:mariadb://13.124.231.44/blog";
	    String dbuser = "root";
	    String dbpw = "mariadb1234";
	    conn = DriverManager.getConnection(dburl,dbuser,dbpw);
	    
	    int row = 0;
	    String sql = "UPDATE photo SET  photo_title=?, photo_memo=?,update_date=now() where photo_no =? AND photo_pw=?";
	    stmt = conn.prepareStatement(sql);
	    stmt.setString(1, photo.getPhotoTitle());
		stmt.setString(2, photo.getPhotoMemo());
		stmt.setInt(3, photo.getPhotoNo());
		stmt.setString(4, photo.getPhotoPw());
		
		row = stmt.executeUpdate();
	    
		stmt.close();
		conn.close();
	    
		return row;
	}
	// 이미지 이름을 반환하는 메서드
	public String selectPhotoName (int photoNo) {
		String photoName = "";
		// SELECT photo_name FROM photo WHERE pgoto_no = ?
		return photoName;
	}
	
	// 이미지 입력
	public void insertPhoto(Photo photo) throws Exception{
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
	    String dburl = "jdbc:mariadb://13.124.231.44/blog";
	    String dbuser = "root";
	    String dbpw = "mariadb1234";
	    conn = DriverManager.getConnection(dburl,dbuser,dbpw);
	    
	    String sql = "INSERT INTO photo (photo_name , photo_original_name , photo_title, photo_type , photo_pw , writer , photo_memo, create_date, update_date) value (?,?,?,?,?,?,?,now(),now())";
	    stmt = conn.prepareStatement(sql);
	    stmt.setString(1, photo.getPhotoName());
		stmt.setString(2, photo.getPhotoOriginalName());
		stmt.setString(3, photo.getPhotoTitle());
		stmt.setString(4, photo.getPhotoType());
		stmt.setString(5, photo.getPhotoPw());
		stmt.setString(6, photo.getWriter());
		stmt.setString(7, photo.getPhotoMemo());
		stmt.executeUpdate();
	    
		stmt.close();
		conn.close();
	    
		return;
	}
	
	// 이미지 삭제
	public int deletePhoto(int photoNo, String photoPw) throws Exception { 
		int row = 0;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
	    String dburl = "jdbc:mariadb://13.124.231.44/blog";
	    String dbuser = "root";
	    String dbpw = "mariadb1234";
        conn = DriverManager.getConnection(dburl,dbuser,dbpw);
		String sql = "DELECT FROM photo WHRER photo_no=?, photo_pw=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, photoNo);
		stmt.setString(2, photoPw);
		System.out.println(stmt+" <-- sql deletephoto"); 
		row = stmt.executeUpdate();
		
		stmt.close();
		conn.close();
		
		return row;
	}
	
	// 전체 행의 수
	public int selectPhotoTotalRow() {
		int total = 0;
		return total;
	}
	
	// 이미지 목록
	public ArrayList<Photo> selectPhotoListByPage(int beginRow, int rowPerPage) throws Exception {
		ArrayList<Photo> list = new ArrayList<Photo>();
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String dburl = "jdbc:mariadb://13.124.231.44/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
	    conn = DriverManager.getConnection(dburl,dbuser,dbpw);
		String sql = "SELECT photo_no photoNo,photo_name photoName, photo_Title photoTitle,writer,photo_memo photoMemo,create_date createDate FROM photo ORDER BY create_date DESC LIMIT ?,?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		rs = stmt.executeQuery();
		while(rs.next()) {
			Photo p = new Photo();
			p.setPhotoNo(rs.getInt("photoNo"));
			p.setPhotoName(rs.getString("photoName"));
			p.setPhotoTitle(rs.getString("photoTitle"));
			p.setWriter(rs.getString("writer"));
			p.setPhotoMemo(rs.getString("photoMemo"));
			p.setCreateDate(rs.getString("createDate"));
			list.add(p);
		}
		return list;
	
	}
	
	// 이미지 하나 상세보기
	public Photo selectPhotoOne(int photoNo) throws Exception {
		Photo photo = null;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dburl = "jdbc:mariadb://13.124.231.44/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw);
		
		String sql ="SELECT photo_no photoNo,photo_name photoName, photo_title photoTitle, photo_memo photoMemo, writer, create_date createDate FROM photo WHERE photo_no =?";
		
		
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, photoNo);
		rs = stmt.executeQuery();
		if(rs.next()) {
			photo = new Photo(); // 생성자메서드
			photo.setPhotoNo(rs.getInt("photoNo"));
			photo.setPhotoName(rs.getString("photoName"));
			photo.setPhotoTitle(rs.getString("photoTitle"));
			photo.setPhotoMemo(rs.getString("photoMemo"));
			photo.setWriter(rs.getString("writer"));
			photo.setCreateDate(rs.getString("createDate"));
		}
		rs.close();
		stmt.close();
		conn.close();
		
		
		return photo;
	}
}
