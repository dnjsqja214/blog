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
</head>
<body>
	<h1>삭제</h1>
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
					<button type="submit">제출</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>