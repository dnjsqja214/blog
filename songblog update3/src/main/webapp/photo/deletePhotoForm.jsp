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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<br>
<jsp:include page="/photo/photoHeader.jsp"></jsp:include>
	<div class="col-sm-10">
	<h2>이미지 삭제</h2>
	<a class="btn btn-outline-dark" role="button" href="<%=request.getContextPath()%>/photo/photoList.jsp">리스트로 가기</a>
	<form method="post" action="<%=request.getContextPath()%>/photo/deletePhotoAction.jsp">
		<table class="table table-bordered">
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
		</table>
		<button class="btn btn-outline-danger" type="submit">제출</button>
	</form>
	</div>
</body>
</html>