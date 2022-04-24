<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import= "vo.*" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8"); // 한글 패치
	// seachBoardForm에서 값 받아오기
	String categoryName = request.getParameter("categoryName");
	System.out.println(categoryName+"<--seachName");
	String boardTitle = request.getParameter("boardTitle");
	
	//mariadb 드라이버 접속
	Class.forName("org.mariadb.jdbc.Driver");
	// mariadb 주소로 접속
	Connection conn = null;
	String dburl = "jdbc:mariadb://localhost:3306/blog";
	String dbuser = "root";
	String dbpw = "java1234";
	conn = DriverManager.getConnection(dburl, dbuser, dbpw);
	System.out.println(conn + " <-- conn"); // 디버깅
	
	// 쿼리문 LIKE 명령문
	String seachSql = "SELECT * FROM board WHERE category_name= ? AND board_title LIKE ?";
	PreparedStatement stmt = null;
	stmt = conn.prepareStatement(seachSql);
	
	// 변수에 LIKE문  만들기
	String likeTitle = '%'+boardTitle+'%'; 
	stmt.setString(1, categoryName);
	stmt.setString(2, likeTitle);
	
	// 실행
	ResultSet rs = stmt.executeQuery();
	System.out.println(rs);
	
	// 변수생성후 값을 등록
	ArrayList<Board> boardList = new ArrayList<Board>();
	Board board = null;
	while(rs.next()) {
		board = new Board();
		board.setCategoryName(rs.getString("category_name"));
		board.setBoardTitle(rs.getString("board_title"));
		board.setBoardContent(rs.getString("board_content"));
		board.setCreateDate(rs.getString("create_date"));
		board.setUpdateDate(rs.getString("update_date"));
		boardList.add(board);
	}
	System.out.println(board.getCategoryName()+"<-board.categoryName"+board.getBoardTitle()+"board.boardTitle");
	// 출력창에 테이블 만들기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>category_name</th>
				<th>board_title</th>
				<th>board_content</th>
				<th>create_date</th>
				<th>update_date</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Board m : boardList) {
			%>
				<tr>
					<th><%=m.getCategoryName()%></th>
					<th><%=m.getBoardTitle()%></th>
					<th><%=m.getBoardContent()%></th>
					<th><%=m.getCreateDate()%></th>
					<th><%=m.getUpdateDate()%></th>
				</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>