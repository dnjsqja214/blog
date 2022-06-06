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
	photo.setPhotoNo(photoNo);
	
	photo = photoDao.selectPhotoOne(photoNo);
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/photo/photoHeader.jsp"></jsp:include>
	<div class="col-sm-10">
	<h1>사진 상세보기</h1>
	<a class="btn btn-outline-dark" role="button" href="<%=request.getContextPath()%>/photo/photoList.jsp">이전으로</a>
	<table class="table table-bordered">
		<tr>
			<td>번호</td>
			<td><%=photo.getPhotoNo()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=photo.getWriter()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=photo.getPhotoTitle()%></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				<img src="<%=request.getContextPath()%>/upload/<%=photo.getPhotoName()%>" width="800" height="500">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea rows="5" cols="150" readonly="readonly"><%=photo.getPhotoMemo() %></textarea>
			</td>
		</tr>
	</table>
	<div>
		<a class="btn btn-outline-primary" role="button" href="<%=request.getContextPath()%>/photo/updatePhotoForm.jsp?photoNo=<%=photo.getPhotoNo()%>">수정</a>
		<a class="btn btn-outline-danger" role="button" href="<%=request.getContextPath()%>/photo/deletePhotoForm.jsp?photoNo=<%=photo.getPhotoNo()%>">삭제</a>
	</div>
	</div>
</body>
</html>