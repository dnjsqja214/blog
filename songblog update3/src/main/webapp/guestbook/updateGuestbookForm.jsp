<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// gustebookList에서 guestbookListNo 값 받아오기
	// 수정테이블 만들기 (content,pw)
	
	int guestbookNo = Integer.parseInt(request.getParameter("guestbookNo"));
	System.out.println(guestbookNo+"<-updateGuestNo");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>수정</h1>
	<form method="post" action="<%=request.getContextPath()%>/guestbook/updateGuestbookAction.jsp">
		<table>
			<tr>
				<td>guestbookNo</td>
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
			<button type="submit" role="button">수정</button>
		</div>
	</form>
</body>
</html>