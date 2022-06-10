<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.GuestbookDao" %>
<%
	int currentPage = 1; //현재페이지
	
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	System.out.println(currentPage+"<--currentPage"); // 디버깅
	
	int rowPerPage = 5;
	int beginRow = (currentPage-1)*rowPerPage;
	
	GuestbookDao guestbookDao = new GuestbookDao();
	// 담고싶은 행 개수만큼 담는 메서드 호출해서 Guestbook Arraylist에 저장
	ArrayList<Guestbook> list = guestbookDao.selectGuestbookListByPage(beginRow,rowPerPage);
	
	
	// 다음페이징 위함
	int lastPage = 0;
	int totalCount = guestbookDao.selectGuestbookTotalRow();
	lastPage = (int)(Math.ceil((double)totalCount / (double)rowPerPage)); // math.ceil사용해서 무조건 올림하기 
	// 4.0 / 2.0 = 2.0 -> 2.0
	// 5.0 / 2.0 = 2.5 -> 3.0으로 올리기
/* 	lastPage = totalCount / rowPerPage;
	if(totalCount % rowPerPage != 0){
		lastPage++;
	} 얘도 가능*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbookList</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
	.jb-wrap { padding: 60px 10px; } /*세로 길이 조절*/
	.text-center {float:none; margin:0 auto;} /* 가운데 정렬 */
</style>
</head>
<body>
<jsp:include page="/guestbook/header.jsp"></jsp:include>
	<!-- 방명록 입력 -->
	<div class="jb-wrap">
	<!-- 방명록 리스트 출력 -->
	<br>
	<div class="col-sm-10">
<%
	for(Guestbook g : list) {
%>
		<div class="card" >
			<div class="card-header">
				<div class="input-group">
					<div class="input-group-prepend">
					<!-- 아이디를 누르시 모아보기 -->
						<a href="<%=request.getContextPath()%>/guestbook/writerOne.jsp?writer=<%=g.getWriter()%>" class="btn btn-primary" role="button"><%=g.getWriter()%></a>
					</div>
					<input type="text" class="form-control" value="<%=g.getGuestbookContent()%>" readonly="readonly">
				</div>
			</div>
			<div class="card-body"><%=g.getGuestbookMemo()%></div>
			<div class="card-footer" style="text-align: right;">
				<div class="btn-group" style="float: left;">
					<a href = "<%=request.getContextPath() %>/guestbook/updateGuestbookForm.jsp?guestbookNo=<%=g.getGuestbookNo()%>&&writer=<%=g.getWriter()%>&&guestbookContent=<%=g.getGuestbookContent()%>&&guestbookMemo=<%=g.getGuestbookMemo()%>" class="btn btn-primary btn-info ">수정</a>
					<a href = "<%=request.getContextPath() %>/guestbook/deleteGuestbookForm.jsp?guestbookNo=<%=g.getGuestbookNo()%>" class="btn btn-danger ">삭제</a>
				</div>
				<%=g.getCreateDate()%>
			</div>
		</div>
		<br>
	<%
		}
	%>
	</div>
	<br>
	<form method="post" action="<%=request.getContextPath()%>/guestbook/insertGuestbookAction.jsp">
	<table class = "table table-bordered">
		<tr>
			<td>글쓴이</td>
			<td><input type = "text" name="writer" class="form-control"></td>
			<td>비밀번호</td>
			<td><input type = "password" name="guestbookPw" class="form-control"></td>	
			<td>제목</td>
			<td><input type = "text" name="guestbookContent" class="form-control" ></td>
		</tr>
		<tr>
			<td colspan="8">
				<textarea name = "guestbookMemo" rows="2" cols="70" class="form-control" placeholder="방명록을 남겨주세요"></textarea>
			</td>
		</tr>
	</table>
	<button type = "submit" class="btn btn-primary float-right" style= "margin-bottom:10px">방명록 등록</button>

	</form>

	<ul class="pagination">
	<%
		if(currentPage > 1){
	%>
			<li class="page-item"><a href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp?currentPage=<%=currentPage-1%>" class="page-link">이전</a></li>
	<%
		}
	
		if(currentPage < lastPage) {
	%>	
			<li class="page-item"><a href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp?currentPage=<%=currentPage+1%>" class="page-link">다음</a></li>
	<%
		}
	%>
	</ul>

	</div>
</div>
</body>
</html> 