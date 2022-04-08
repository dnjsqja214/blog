package dao;


import java.sql.*;
import java.util.ArrayList;

import vo.Photo;

public class PhotoDao {
	// 이미지 이름을 반환하는 메서드
	public String selectPhotoName (int photoNo) {
		String photoName = "";
		// SELECT photo_name FROM photo WHERE pgoto_no = ?
		return photoName;
	}
	
	// 이미지 입력
	public void insertPhoto(Photo photo) {
		// 구현
	}
	
	// 이미지 삭제
	public int deletePhoto(int photoNo, String photoPw) throws Exception { 
		int row = 0;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1234");
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
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1234");
		String sql = "SELECT photo_no photoNo, photo_name photoName FROM photo ORDER BY create_date DESC LIMIT ?,?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		rs = stmt.executeQuery();
		while(rs.next()) {
			Photo p = new Photo();
			p.photoNo = rs.getInt("photoNo");
			p.photoName = rs.getString("photoName");
			list.add(p);
		}
		return list;
	
	}
	
	// 이미지 하나 상세보기
	public Photo selectPhotoOne(int photoNo, String photoName) throws Exception {
		Photo photo = null;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dburl = "jdbc:mariadb://localhost:3306/blog";
		String dbuser = "root";
		String dbpw = "java1234";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw);
		
		String sql ="SELECT photo_no photoNo, photo_name photoName FROM photo WHERE photo_no =?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, photoNo);
		stmt.setString(2, photoName);
		rs = stmt.executeQuery();
		if(rs.next()) {
			photo = new Photo(); // 생성자메서드
			photo.photoNo = rs.getInt("photoNo");
			photo.photoName = rs.getString("photoName");
		}
		rs.close();
		stmt.close();
		conn.close();
		
		
		return photo;
	}
}
