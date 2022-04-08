<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	// photoNo 값 받기
	// delete 입력 테이블 만들기 
	// photoNo랑 pw input넣기
	
	int photoNo = Integer.parseInt(request.getParameter("photoNo"));
	System.out.println(photoNo+"<--delete photoNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이미지 삭제</h1>
	<form method="post" action="<%=request.getContextPath()%>/photo/deletePhotoAction.jsp">
		<table border="1">
			<tr>
				<td>photoNo</td>
				<td>
					<input type="text" name="photoNo" value="<%=photoNo%>" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>photoPw</td>
				<td>
					<input type="password" name="photoPw">
				</td>
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