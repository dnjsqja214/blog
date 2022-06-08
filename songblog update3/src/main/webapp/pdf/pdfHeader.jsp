<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<nav class="navbar navbar-expand-sm bg- navbar-dark">
	<a class="text-dark" href="<%=request.getContextPath()%>/pdf/pdfList.jsp"><h1>P D F</h1></a>
		<div class="spinner-grow text-danger"></div>
		<div class="spinner-grow text-warning"></div>
		<div class="spinner-grow text-success"></div>
		<div class="spinner-grow text-info"></div>
		<div class="spinner-grow text-primary"></div>
		<div class="spinner-grow text-muted"></div>
		<div class="spinner-grow text-secondary"></div>
		<div class="spinner-grow text-dark"></div>
</nav>  

<nav class="navbar navbar-expand-sm bg-dark navbar-dark"></nav>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark"></nav>
<br><br>
<div class ="container">
<!-- 좌측 인덱스 추가 -->
	<div class="row">
		<div class="col-sm-2">
		<br><br><br>
	    <a class="text-dark" href="<%=request.getContextPath()%>/inc/upMenu.jsp"><h3>Index</h3></a>
		    <ul class="nav nav-pills flex-column">
				<li class="nav-item">
				  	<a class="nav-link" href="<%=request.getContextPath()%>/board/boardList.jsp">boardList</a>
				</li>
		        <li class="nav-item">
		          	<a class="nav-link" href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp">Guestbook</a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="<%=request.getContextPath()%>/photo/photoList.jsp">Photo</a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link active" href="<%=request.getContextPath()%>/pdf/pdfList.jsp">Pdf</a>
		        </li>
		    </ul>
	    </div>