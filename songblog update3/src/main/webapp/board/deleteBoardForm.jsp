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

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<body>
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
			  <div class="col-sm-10"><button type="submit" class="btn btn-outline-danger" onclick="del();">delete</button></div>
			  <div class="col-sm-2">
			  	<a href="<%=request.getContextPath()%>/boadrd/boardList.jsp" class="btn btn-secondary" role="button" class="text-right">리스트로 돌아가기</a>
			 </div>
			</div>
		</form>
	</div>
  </div>
</body>
</html>