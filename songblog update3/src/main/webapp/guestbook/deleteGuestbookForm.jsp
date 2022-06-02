<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// guestbookList에서 번호랑 비빈번호값 받아오기
	int guestbookNo = Integer.parseInt(request.getParameter("guestbookNo"));
	System.out.println(guestbookNo+"<--deleteguestNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/guestbook/header.jsp"></jsp:include>
 	<div class="col-sm-10">
	 <br>
	 <br>
		<h1 class="text-danger">삭제</h1>
	<form  method="post" action="<%=request.getContextPath()%>/guestbook/deleteGuestbookAction.jsp">
		<table>
			<tr>
				<td>guestbookNo</td>
				<td><input type="text" name="guestbookNo" value="<%=guestbookNo%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>guestbookPw</td>
				<td><input type="password" name="guestbookPw" ></td>
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn btn-outline-danger">삭제</button>
					<a href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp" class="btn btn-outline-secondary" role="button" class="text-right">방명록 돌아가기</a>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>