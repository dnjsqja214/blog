<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.PdfDao" %>
<%@ page import = "vo.Pdf" %>
<%@ page import = "newBadge.*" %>
<%@ page import = "java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	PdfDao pdfDao = new PdfDao();
	// 페이지
	int currentPage = 1; // 현재 페이지
	if(request.getParameter("currentPage")!=null) { // 이전(-1), 다음(+1)을 통해 들어왔다면
		currentPage = Integer.parseInt(request.getParameter("currentPage")); // 값 적용하기
	}
	System.out.println("[pdf.currentPage] : " + currentPage);
	int beginRow = 0; // 페이지마다 시작 게시글 번호
	int rowPerPage = 5; // 한 페이지당 게시글 수
	beginRow = (currentPage-1)*rowPerPage;
	int totalRow = pdfDao.selectPdfTotalRow(); // 전체 게시글 수
	int lastPage = (int)(Math.ceil((double)totalRow / (double)rowPerPage)); // 마지막 페이지
	
	// 최근 일주일 날짜 목록 불러오기
	Badge badge = new Badge();
	ArrayList<String> currentSevenDays = badge.currentSevenDays();
	
	// pdf 목록보기
	ArrayList<Pdf> list = pdfDao.selectPdfListByPage(beginRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdfList</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<!-- 메인 메뉴 -->
	
	<!-- include시 컨텍스명(프로젝트이름)을 명시하지 않는다. -->
	<!-- 메인 메뉴 끝 -->
	<br>
	<jsp:include page="/pdf/pdfHeader.jsp"></jsp:include>
	<div class="col-sm-10">
	<h2>PDF 자료실<span class="badge badge-danger badge-pill text-light"><%=totalRow%></span></h2>
	 : 파일명 클릭 시 다운로드 됩니다.<br>
		<table class="table table-hover">
			<thead class="bg-dark text-light">
				<tr>
					<th>번호</th>
					<th>pdf 다운로드</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Pdf p : list) {
				%>
					<tr>
						<td><%=p.getPdfNo() %></td>
						<td>
							<a href="<%=request.getContextPath()%>/uploadPdf/<%=p.getPdfName()%>" download="<%=p.getPdfOriginalName()%>"><%=p.getPdfOriginalName()%>
							<%
								// 최근 7일 pdf에 new 뱃지 추가
								for(String s : currentSevenDays) {
									if(s.equals(p.getCreateDate().substring(0,10))) {
							%>
									 	<span class="badge badge-danger">new</span>
							<%
									}
								}
							%>
							</a>
						</td>
						<td><%=p.getWriter() %></td>
						<td><%=p.getCreateDate() %></td>
						<td>
							<a href="<%=request.getContextPath()%>/pdf/deletePdfForm.jsp?pdfNo=<%=p.getPdfNo()%>" class="text-danger">삭제</a>
						</td>
					</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<div>
			<%
				if(currentPage>1) {
			%>
					<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-outline-warning btn-sm text-dark">이전</a>
			<%		
				}
				if(lastPage>currentPage) {
			%>
					<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-outline-warning btn-sm text-dark">다음</a>
			<%
				}
			%>
		</div>
		<a href="<%=request.getContextPath()%>/pdf/insertPdfForm.jsp" class="btn btn-light text-danger">pdf 등록</a>
	</div>
</body>
</html>