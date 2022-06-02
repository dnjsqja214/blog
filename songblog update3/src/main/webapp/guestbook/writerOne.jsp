<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	String writer = request.getParameter("writer");
	System.out.println(writer+"<-writer");
	GuestbookDao guestbookDao = new GuestbookDao();
	
	// 한사람이 쓴 글
	ArrayList<Guestbook> list = guestbookDao.guestList(writer, beginRow, rowPerPage);
	
	
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
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
	.jb-wrap { padding: 60px 10px; } /*세로 길이 조절*/
	.text-center {float:none; margin:0 auto;} /* 가운데 정렬 */
</style>
</head>
<body>
<jsp:include page="/guestbook/header.jsp"></jsp:include>
	<!-- 방명록 입력 -->
	<div class="col-sm-10">
	<div class="jb-wrap">
	<!-- 방명록 리스트 출력 -->
	<br>
<%
	for(Guestbook g : list) {
%>
		<div class="card" >
			<div class="card-header">
				<div class="input-group">
					<div class="input-group-prepend">
					<!-- 아이디를 누르시 모아보기 -->
						<button type="button" class="btn btn-primary"><%=g.getWriter()%></button>
					</div>
					<input type="text" class="form-control" value="<%=g.getGuestbookContent()%>" readonly="readonly">
				</div>
			</div>
			<div class="card-body"><%=g.getGuestbookMemo()%></div>
			<div class="card-footer" style="text-align: right;">
				<div class="btn-group" style="float: left;">
					<a href = "<%=request.getContextPath() %>/guestbook/updateGuestbookForm.jsp?guestbookNo=<%=g.getGuestbookNo()%>&writer=<%=g.getWriter()%>" class="btn btn-primary btn-info ">수정</a>
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
	</div>
</div>
</body>
</html> 