<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import ="dao.*" %>
<%@ page import="vo.*" %>
<%
	String categoryName = "선택안함";

	BoardDao boardDao = new BoardDao(); // 메서드 사용을 위한 객체 생성
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<String> categoryList = categoryDao.categoryName(categoryName);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertBoardForm</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container" >
	<div class="row">
	<div class="col-sm-2">
	   <h1 class="text-success"><strong>글입력</strong></h1>
	</div>
	</div>
	   <form method="post" action="<%=request.getContextPath()%>/board/insertBoardAction.jsp">
	      <table class="table table-striped">
	         <tr>
	            <td class="text-success"><strong>categoryName</strong></td>
	            <td>
	               <select name="categoryName" class="form-select">
	                  <%
	                     for(String s : categoryList) {
	                  %>
	                        <option value="<%=s%>"><%=s%></option>
	                  <%      
	                     }
	                  %>
	               </select>
	            </td>
	         </tr>
	         <tr>   
	            <td class="text-success"><strong>boardTitle</strong></td>
	            <td><input name="boardTitle" type="text" class="form-control"></td>
	         </tr>
	         
	         <tr>   
	            <td class="text-success"><strong>boardContent</strong></td>
	            <td><input name="boardContent" type="text" class="form-control"></td>
	         </tr>
	         
	         <tr>   
	            <td class="text-success"><strong>boardPw</strong></td>
	            <td><input name="boardPw" type="text" class="form-control"></td>
	         </tr>
	      </table>
	     <button type="submit" class="btn btn-success">제출</button>
	   </form>
	      	<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-secondary" role="button" >리스트로 돌아가기</a>
  	</div>
</body>
</html>