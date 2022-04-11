<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%
	
	int boardNo=0;
	if(request.getParameter("boardNo")!= null) {
		boardNo = Integer.parseInt(request.getParameter("boardNo"));
	}
	System.out.println(boardNo+"<-boardNo");

	// 카테고리 목록
	BoardDao boardDao = new BoardDao();
	CategoryDao categoryDao = new CategoryDao(); 
	ArrayList<HashMap<String, Object>> categoryList = categoryDao.categoryCnt();
	
	int totalCount = boardDao.selectboardTotalRow();  // 전체 행갯수
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
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
<div class="container-fluid">
	<div class="row">
	 <div class="col-sm-5"></div>
		<h1 class="text-danger">번호 삭제</h1>
	</div>
    <div  class="container">
 		<h2>input boardNo</h2>
		<form method="post" action="<%=request.getContextPath()%>/board/deleteBoardAction.jsp">
    		<div  class="form-group">
     		 <label for="usr">boardNo:</label>
     			 <input type="text" class="form-control" name="boardNo" readonly="readonly"value="<%=boardNo%>">
    		</div>
	 	 <div>
			<script type="text/javascript">
			function del() {
			  if (confirm("정말 삭제하시겠습니까?"))
			    list_ok.submit();
			 }
			</script>
		</div>
	  		<div class="row">
			  <div class="col-sm-10">
			  	<button type="submit" class="btn btn-outline-danger" onclick="del();">delete</button></div>
			  <div class="col-sm-2">
			  	<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-secondary" role="button" class="text-right">리스트로 돌아가기</a>
			 </div>
			</div>
		</form>
	</div>
  </div>
</body>
</html>