<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="vo.Board"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 값 받아오기
	int boardNo = Integer.parseInt(request.getParameter("boardNo")); // 상세보기 할 게시물의 번호 받아오기
	System.out.println(boardNo+"<-one.boardNo");
	BoardDao boardDao = new BoardDao(); // 메서드 사용을 위한 객체 생성
	Board board = boardDao.selectBoardOne(boardNo); // 정보를 상세보기 해주는 메서드 사용 후 객체에 저장
	
	// 카테고리 목록
	CategoryDao categoryDao = new CategoryDao(); 
	ArrayList<HashMap<String, Object>> categoryList = categoryDao.categoryCnt();
	
	int totalCount = boardDao.selectboardTotalRow();  // 전체 행갯수
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boardOne</title>
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
				for(HashMap<String, Object> m : categoryList) { // 카테고리를 선택하면 카테고리 테이블페이지가 에러가 남 -->cnt값도 넘겨주자!
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
		<h1 class="text-center">board 상세보기</h1>
 			<table class="table table-dark table-striped">
			<tr>
				<td width=150>번호</td>
				<td><%=board.getBoardNo()%></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><%=board.getCategoryName()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=board.getBoardTitle()%></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><%=board.getBoardContent()%></td>
			</tr>
			<tr>
				<td>생성 날짜</td>
				<td><%=board.getCreateDate()%></td>
			</tr>
			<tr>
				<td>업데이트 날짜</td>
				<td><%=board.getUpdateDate()%></td>
			</tr>
		</table>
		<div>
			<a href="<%=request.getContextPath()%>/board/updateBoardForm.jsp?boardNo=<%= board.getBoardNo() %>" class="btn btn-outline-primary" role="button">수정</a>
			<a href="<%=request.getContextPath()%>/board/deleteBoardForm.jsp?boardNo=<%= board.getBoardNo() %>" class="btn btn-outline-danger" role="button">삭제</a>
		</div>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp"  role="button" class="btn btn-outline-secondary">리스트로 돌아가기</a>
		</div>
</body>
</html>