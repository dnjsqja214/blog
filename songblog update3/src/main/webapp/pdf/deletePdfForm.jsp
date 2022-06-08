<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int pdfNo = Integer.parseInt(request.getParameter("pdfNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePdfForm</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<br>
	<!-- 메인 메뉴 -->
	<jsp:include page="/pdf/pdfHeader.jsp"></jsp:include>
	<!-- include시 컨텍스명(프로젝트이름)을 명시하지 않는다. -->
	<!-- 메인 메뉴 끝 -->
	<div class="col-sm-10">
	<form method="post" action="<%=request.getContextPath()%>/pdf/deletePdfAction.jsp">
	<h2>PDF 삭제</h2>
	<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp" class="btn btn-light float-right">이전으로</a>
	<table class="table">
	<tr>
		<td>번호</td>
		<td>
			<input type="number" name="pdfNo" value="<%=pdfNo%>" readonly="readonly" class="form-control">
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pdfPw" class="form-control" placeholder="Enter password">
		</td>
	</tr>
	<tr>
		<td>
			<button type="submit" class="btn btn-dander text-light">삭제</button>
		</td>
	</tr>
	</table>
	</form>
	</div>
</body>
</html>