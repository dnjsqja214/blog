<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="vo.*" %>
<%
	// 선택한 학생번호 값 가져오기
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	System.out.println(boardNo+"<-deleteBoardNo");

	// 편의성을 위해 등록
	Board board = new Board();
	board.setBoardNo(boardNo);
	
	
	//mariadb 드라이버 접속
	Class.forName("org.mariadb.jdbc.Driver");
	// mariadb 주소로 접속
	Connection conn = null;
	String dburl = "jdbc:mariadb://localhost:3306/blog";
	String dbuser = "root";
	String dbpw = "java1234";
	conn = DriverManager.getConnection(dburl, dbuser, dbpw);
	System.out.println(conn + " <-- conn"); // 디버깅
	
	// 쿼리에 저장
	PreparedStatement stmt = conn.prepareStatement("delete from board where board_no=? ");
	stmt.setInt(1, board.getBoardNo());
	
	
	// 디버깅 and 페이지 이동
	int row = stmt.executeUpdate();
	if(row ==  0) {
		System.out.println("삭제 실패");
		response.sendRedirect("./deleteBoardForm.jsp?boardNo="+board.getBoardNo());
	} else {
		System.out.println("삭제 성공");
		response.sendRedirect("./boardList.jsp");
	}
	conn.close();
%>