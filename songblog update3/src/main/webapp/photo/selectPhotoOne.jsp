<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>
<%
	// photoNo값 받아오기
	// 테이블에 만들어서 출력하기
	// 수정, 삭제 파워링크 달기
	
	int photoNo = Integer.parseInt(request.getParameter("photoNo"));
	String photoName = request.getParameter("photoName");
	// 디버깅
	System.out.println(photoNo+"<--photoNo");
	System.out.println(photoName+"<--photoName");
	
	PhotoDao photoDao = new PhotoDao();
	Photo photo = new Photo();
	photo.photoNo = photoNo;
	photo.photoName = photoName;
	
	photoDao.selectPhotoOne(photoNo, photoName);
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>photoOne</h1>
	<img src="<%=request.getContextPath()%>/upload/<%=photoName%>" width="300" height="300">
	<table  border="1">
		<tr>
			<td>photoNo</td>
			<td><%=photo.photoNo%></td>
		</tr>
		<tr>
			<td>photoName</td>
			<td><%=photo.photoName%></td>
		</tr>
	</table>
	<div>
		<a href="<%=request.getContextPath()%>/photo/updatePhotoForm.jsp">수정</a>
		<a href="<%=request.getContextPath()%>/photo/deletePhotoForm.jsp?photoNo=<%=photoNo%>">삭제</a>
	</div>
</body>
</html>