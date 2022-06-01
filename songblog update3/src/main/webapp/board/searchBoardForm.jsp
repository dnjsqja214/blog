<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	// list창에 seachForm에 이동링크를 만들기
	// 출력창에 테이블을 text만들기

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/board/header.jsp"></jsp:include>
	<div class="container">
		<h1 class="text-warning"><strong>검색</strong></h1>
		<form method="post" action="<%=request.getContextPath()%>/board/searchBoardAction.jsp">
		<table class="table table-dark table-hover">
			<tr>
				<td class="text-warning"><strong>category_name</strong></td>
				<td><input type="text" name="categoryName"></td>
			</tr>
			<tr>
				<td class="text-warning"><strong>board_title</strong></td>
				<td><input type="text" name="boardTitle"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn btn-outline-warning" class="spinner-border text-warning">seach</button>
					<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-secondary" role="button" class="text-right">리스트로 돌아가기</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>