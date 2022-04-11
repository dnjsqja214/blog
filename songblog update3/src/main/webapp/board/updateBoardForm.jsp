<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="vo.*" %>
<%
	// boardOne에서 boardNo값 받아오기
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	System.out.println(boardNo+"<--UpBoardNo");
	//category테이블 만들기 
	BoardDao boardDao = new BoardDao(); // 메서드 사용을 위한 객체 생성
	Board board = boardDao.selectBoardOne(boardNo); // 정보를 상세보기 해주는 메서드 사용 후 객체에 저장
	
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<String> categoryList = categoryDao.categoryName(board.getCategoryName());
	
	ArrayList<HashMap<String, Object>> categoryList2 = categoryDao.categoryCnt();
	int totalCount = boardDao.selectboardTotalRow();  // 전체 행갯수
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-sm bg- navbar-dark">
	  <h1>B L O G</h1>
		<div class="spinner-grow text-danger"></div>
		<div class="spinner-grow text-warning"></div>
		<div class="spinner-grow text-success"></div>
		<div class="spinner-grow text-info"></div>
		<div class="spinner-grow text-primary"></div>
		<div class="spinner-grow text-muted"></div>
		<div class="spinner-grow text-secondary"></div>
		<div class="spinner-grow text-dark"></div>
	</nav>  
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"></nav>
	<div>
		<ul class="list-group list-group-horizontal"> <!--  리스트 그룹으로 함 -->
				<li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center ">
					<a href="<%=request.getContextPath()%>/board/boardList.jsp">전체</a>
					<span class="badge badge-danger badge-pill"><%=totalCount%></span>
				</li>					
			<%
				for(HashMap<String, Object> m : categoryList2) { // 카테고리를 선택하면 카테고리 테이블페이지가 에러가 남 -->cnt값도 넘겨주자!
			%>	
				  <li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center ">
				  	<a href="<%=request.getContextPath()%>/board/boardList.jsp?categoryName=<%=m.get("categoryName")%>&categoryCnt=<%=m.get("cnt")%>"><%=m.get("categoryName")%> </a>
				  	<span class="badge badge-danger badge-pill"><%=m.get("cnt")%></span> <!--  게시물의 수 -->
				  </li>
			<%		
				}
			%>
		</ul>
	</div>
	<div class="container">
	<div class="row">
	<div class="col-sm-1"></div>
	<div>
 		<h1 class="text-primary">UPDATE</h1>
 		<p class="text-info">Write down the corrections in the text</p>
 	</div>
 	</div>
		<form method="post" action="<%=request.getContextPath()%>/board/updateBoardAction.jsp">
			<table class="table table-bordered">
				<tr class="table-primary">
					<td><strong>boardNo</strong></td>
					<td><input type="text" name="boardNo" value="<%=boardNo%>" readonly="readonly"></td>
				</tr>
				<tr class="table-info">
					<td><strong>categoryName</strong></td>
					<td>
						<select name="categoryName">
							<%
								for(String s : categoryList) {
									if(s.equals(board.getCategoryName())) {
							%>
										<option selected="selected" value="<%=s%>"><%=s%></option>
							<%
									} else {
							%>
										<option value="<%=s%>"><%=s%></option>
							<%		
									}
								}
							%>
						</select>
					</td>
				</tr>
				<tr class="table-primary">
					<td><strong>boardTitle</strong></td>
					<td><input type="text" name="boardTitle" value="<%=board.getBoardTitle()%>"></td>
				</tr>
				<tr class="table-info">
					<td><strong>boardContent</strong></td>
					<td>
						<textarea rows="5" cols="50" name="boardContent"><%=board.getBoardContent()%></textarea>
					</td>
				</tr>
				<tr class="table-primary">	
					<td><strong>boardPw</strong></td>
					<td><input type="password" name="boardPw" value=""></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-outline-primary" role="button">수정</button>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-outline-secondary" role="button" class="text-right">리스트로 돌아가기</a>
		</form>
	<div class="row">
	<div class="col-sm-10">
	</div>
	</div>
	</div>
</body>
</html>