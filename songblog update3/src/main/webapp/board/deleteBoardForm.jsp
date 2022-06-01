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
<jsp:include page="/board/header.jsp"></jsp:include>
    <div  class="container">
	<div class="row">
	 	<div class="col-sm-5"></div>
			<h1 class="text-danger">번호 삭제</h1>
		</div>
 			<h2>input boardNo</h2>
		<div  class="form-group">
			<label for="usr">boardNo:</label>
			<input type="text" class="form-control" name="boardNo" readonly="readonly"value="<%=boardNo%>">
		</div>
		<!-- 삭제버튼을 누르실 경고창 -->
		<script type="text/javascript">
			function del() {
			  if (confirm("정말 삭제하시겠습니까?"))
			    list_ok.submit();
			 }
		</script>
	  	<a href="<%=request.getContextPath()%>/board/deleteBoardAction.jsp?boardNo=<%=boardNo%>" class="btn btn-outline-danger" onclick="del();">삭제</a>
	  	<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-secondary" role="button" class="text-right">리스트로 돌아가기</a>
	</div>
</body>
</html>