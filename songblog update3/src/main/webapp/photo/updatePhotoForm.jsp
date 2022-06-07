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
	<h1 class="text-primary">수정</h1>
	<a class="btn btn-outline-dark" role="button" href="<%=request.getContextPath()%>/photo/photoList.jsp">리스트로 가기</a>
	<form method="post" action="<%=request.getContextPath()%>/photo/updatePhotoAction.jsp">
		<table class="table table-bordered">
			<tr>
				<td>번호</td>
				<td>
					<input type="text" name="photoNo" readonly="readonly" value="<%=photo.getPhotoNo()%>">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=photo.getWriter()%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="photoTitle" value="<%=photo.getPhotoTitle()%>">
				</td>
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
					<textarea rows="5" cols="150" name="photoMemo"><%=photo.getPhotoMemo() %></textarea>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="photoPw">
				</td>
			</tr>
		</table>
		<button class="btn btn-outline-primary" type="submit">수정</button>
	</form>
	</div>
</div>
</body>
</html>