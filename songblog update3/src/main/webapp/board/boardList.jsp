<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%
	// boardList 테이블
	int currentPage = 1; // 현재 페이지 디폴트 값
	int rowPerPage = 10; // 행갯수 디폴트값
	if (request.getParameter("currentPage") != null) { // 현재 페이지 이동
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	
	if(request.getParameter("rowPerPage") != null) { // 행갯수 설정 값
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
	}
	System.out.println(currentPage+"<--currentPage");
	int beginRow = (currentPage - 1) * rowPerPage;
	System.out.println(rowPerPage+"<--rowPerPage");
	
	
	// categoryName 값 받기
	String categoryName = ""; // categoryName 디폴트값
	int categoryCnt = 0;		// categoryCnt 디폴트값
	if(request.getParameter("categoryName") != null) { // 페이지에서 category를 눌렀다면 정보값을 변수에 등록하기
		categoryName = request.getParameter("categoryName");
	}
	if(request.getParameter("categoryCnt") != null) { // cnt가 null아니라면 categoryCnt에 값넣기
		categoryCnt=Integer.parseInt(request.getParameter("categoryCnt")); 
	}
	System.out.println(categoryName+ " <-- categoryName");
	System.out.println(categoryCnt+"<--categoryCnt");
	
	// BoardDao list
	BoardDao boardDao = new BoardDao();
	ArrayList<Board> list = boardDao.selectBoardListByPage(categoryName, beginRow, rowPerPage);
	
	// category테이블 만들기 
	CategoryDao categoryDao = new CategoryDao();
	ArrayList<HashMap<String,Object>> categoryList = categoryDao.categoryCnt();
	
	// 마지막 페이지만들기
	
	int totalCount = boardDao.selectboardTotalRow();  // 전체 행개수
	if(categoryCnt != 0) { // categoryName이 선택 되었다면 출력되는 totalCount에 값넣어주기 
		totalCount = categoryCnt; // 이유: categoryList 선택했을때 totalCount값이 바뀌고 총개수가 바뀌면 lastPage등도 값 바껴서
	}
	System.out.println(totalCount+"<--totalCount");
	int lastPage =0;
	if(totalCount%rowPerPage > 0) {
		lastPage = (totalCount/rowPerPage) + 1;
	} else {
		lastPage = totalCount/rowPerPage;
	}
	System.out.println(lastPage+"<--lastPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/board/header.jsp"></jsp:include>
	<div class="container">
	<hr class="d-sm-none">
	<div class="row">
	<div class="col-sm-2"></div>
		<div>
			<h2  class="font-weight-bold">게시글 목록<span class="badge badge-dark">(total : <%=totalCount%>)</span></h2>
		</div>
	<!-- rowPerPage 갯수 정하기 -->
	<div class="col-sm-5"></div>
		<div class="dropdown">
			<button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">행 갯수</button>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="<%=request.getContextPath()%>/board/boardList.jsp?rowPerPage=5& currentPage=<%=currentPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">5</a>
			<a class="dropdown-item" href="<%=request.getContextPath()%>/board/boardList.jsp?rowPerPage=10& currentPage=<%=currentPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">10</a>
		</div>
	</div>
	</div>
	<!-- 좌측 인덱스 추가 -->
	<div class="row">
	<div class="col-sm-2">
    <h3>Index</h3>
    <ul class="nav nav-pills flex-column">
		<li class="nav-item">
		  	<a class="nav-link active" href="<%=request.getContextPath()%>/board/boardList.jsp">boardList</a>
		</li>
        <li class="nav-item">
          	<a class="nav-link" href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp">Guestbook</a>
        </li>
        <li class="nav-item">
        	  <a class="nav-link" href="<%=request.getContextPath()%>/photo/photoList.jsp">Photo</a>
        </li>
    </ul>
    </div>
    <div class="col-sm-10">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th class="text-center">categoryName</th>
				<th>boardTitle</th>
				<th class="text-right">createDate</th>
			</tr>
		</thead>
		<!-- boardTitle링크 -->
		<tbody>
			<%
				for(Board b : list) {
			%>		
					<tr>
						<td class="text-center"><%=b.getCategoryName()%></td>
						<td><a href="<%=request.getContextPath()%>/board/boardOne.jsp?boardNo=<%=b.getBoardNo()%>"class="text-info" data-toggle="tooltip" title="check information"><%=b.getBoardTitle()%></a></td>
						<td class="text-right"><%=b.getCreateDate()%></td>
					</tr>
			<%		
				}
			%>
		</tbody>
	</table>
	</div>
	</div>
	
	<!-- 숫자페이지 만들기 -->
		<ul class="pagination justify-content-center" >
			<% 
				if(currentPage >1) { // 1페이지빼고 이전페이지에 이전버튼 나오게 하기
			%>
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage-1%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">Previous</a></li>
			<%
				} else if(currentPage == 1) { // 첫페이지일때 previous버튼 안눌리게 하기
			%>
					<li class="page-item disabled"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage-1%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">Previous</a></li>
			<%
				} 
				// ex)lastPage가 123 lastPage라면 숫자링크 3개 15 lastPage라면 5개를 만들어주는 조건식 
				if(lastPage/10 == (currentPage-1)/10){ // ++ 만약 버그가 생긴다면 {lastPage-(lastPage%10)<currentPage} 공식으로 사용
					for(int i=1; i<=lastPage%10;i=i+1){ 
					System.out.println(i+"<--i");
						// 현재 페이지를 알기 위해서 부트스트랩 추가 -> 숫자링크에서 현재 페이지가 파란색으로 표시됨
						if((currentPage%10)!=i && currentPage%10 != 0) { 
			%>
							<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=((currentPage-1)/10)*10+i%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">[<%=((currentPage-1)/10)*10+i%>]</a></li>
			<%
						} else if(currentPage%10 == i) {
			%>
							<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=((currentPage-1)/10)*10+i%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">[<%=((currentPage-1)/10)*10+i%>]</a></li>
			<%
						} else if(currentPage%10 == 0 &&  i !=10) {
			%>		
							<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=((currentPage-1)/10)*10+i%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">[<%=((currentPage-1)/10)*10+i%>]</a></li>
			<%		
						} else {
			%>				
							<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=((currentPage-1)/10)*10+i%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">[<%=((currentPage-1)/10)*10+i%>]</a></li>
			<% 
						}
					}
				} else {
					for(int i=1;i<=10;i=i+1) { // 기본10개씩페이지 숫자링크 보여주기 ex)1~10,11~20, ..., 1~lastPage(n*10)
						// 현재 페이지를 알기 위해서 부트스트랩 추가 -> 숫자링크에서 현재 페이지가 파란색으로 표시됨
						if((currentPage%10)!=i && currentPage%10 != 0) { 
			%>
							<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=((currentPage-1)/10)*10+i%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">[<%=((currentPage-1)/10)*10+i%>]</a></li>
		
			<%
						} else if(currentPage%10 == i) {
			%>
							<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=((currentPage-1)/10)*10+i%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">[<%=((currentPage-1)/10)*10+i%>]</a></li>
			<%
						} else if(currentPage%10 == 0 &&  i !=10) {
			%>		
							<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=((currentPage-1)/10)*10+i%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">[<%=((currentPage-1)/10)*10+i%>]</a></li>
			<%		
						} else {
			%>				
							<li class="page-item active"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=((currentPage-1)/10)*10+i%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">[<%=((currentPage-1)/10)*10+i%>]</a></li>
			<% 
						}
					}
				}
				 if(currentPage == lastPage) { // 마지막 페이지빼고 다음 버튼이 나오게 하기
			%>
					<li class="page-item disabled"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage+1%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">Next</a></li>
			<%		
				 } else if(currentPage < lastPage) { // 마지막페이지가 나오면 다음버튼이 안나오게 하기
			%>
					<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/board/boardList.jsp?currentPage=<%=currentPage+1%>&rowPerPage=<%=rowPerPage%>&categoryName=<%=categoryName%>&categoryCnt=<%=categoryCnt%>">Next</a></li>	
			<%
				}
			%>
		</ul>
	<div class="row">
		<div class="col-sm-3"></div>
		<a href="<%=request.getContextPath()%>/board/insertBoardForm.jsp?" class="btn btn-outline-success" role="button" >게시글 입력</a>
	</div>
</div>
</html>