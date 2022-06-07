 <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%


// categoryName 값 받기
String categoryName = ""; // categoryName 디폴트값
int categoryCnt = 0;		// categoryCnt 디폴트값
if(request.getParameter("categoryName") != null) { // 페이지에서 category를 눌렀다면 정보값을 변수에 등록하기
	categoryName = request.getParameter("categoryName");
}
if(request.getParameter("categoryCnt") != null) { // cnt가 null아니라면 categoryCnt에 값넣기
	categoryCnt=Integer.parseInt(request.getParameter("categoryCnt")); 
}
System.out.println(categoryName+ " <-- categoryName");
System.out.println(categoryCnt+"<--categoryCnt");

// BoardDao list
BoardDao boardDao = new BoardDao();

// category테이블 만들기 
CategoryDao categoryDao = new CategoryDao();
ArrayList<HashMap<String,Object>> categoryList = categoryDao.categoryCnt();
int totalCount = boardDao.selectboardTotalRow();  // 전체 행개수

%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<nav class="navbar navbar-expand-sm bg- navbar-dark">
	<a class="text-dark" href="<%=request.getContextPath()%>/blog/boardList.jsp"><h1>B L O G</h1></a>
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
	<!-- category별 게시글 링크 메뉴 -->
	<div>
		<ul class="list-group list-group-horizontal"> <!--  리스트 그룹으로 함 -->
			<li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center ">
				<a href="<%=request.getContextPath()%>/board/boardList.jsp">전체<br>게시물</a>
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
