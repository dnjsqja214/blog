<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// gustebookList에서 guestbookListNo 값 받아오기
	// 수정테이블 만들기 (content,pw)
	
	int guestbookNo = Integer.parseInt(request.getParameter("guestbookNo"));
	System.out.println(guestbookNo+"<-updateGuestNo");
	String writer = request.getParameter("writer");
	System.out.println(writer+"<-writer");
	
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
	<div class="row">
	<div class="col-sm-1"></div>
	<div>
 		<h1 class="text-primary">UPDATE</h1>
 		<p class="text-info">Write down the corrections in the text</p>
 	</div>
 	</div>
		<form method="post" action="<%=request.getContextPath()%>/guestbook/updateGuestbookAction.jsp">
			<table class="table table-bordered">
				<tr>
					<td><%=writer%></td>
					<td><input type="number" name="guestbookNo" readonly="readonly"value="<%=guestbookNo%>"></td>
				</tr>
				<tr>
					<td>guestbookContent</td>
					<td colspan="2"><textarea name="guestbookContent" rows="2" cols="60"></textarea></td>
				</tr>
				<tr>
					<td>guestbookPw</td>
					<td><input type="password" name="guestbookPw" value=""></td>
				</tr>
			</table>
			<div>
				<button type="submit" class="btn btn-outline-primary" role="button">수정</button>
			</div>
		</form>
	</div>
</body>
</html>