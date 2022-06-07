<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg- navbar-dark">
	<a class="text-dark" href="<%=request.getContextPath()%>/photo/photoList.jsp"><h1>P H O T O</h1></a>
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
		        	<a class="nav-link active" href="<%=request.getContextPath()%>/photo/photoList.jsp">Photo</a>
		        </li>
		        <li class="nav-item">
		        	<a class="nav-link" href="<%=request.getContextPath()%>/photo/photoList.jsp">Pdf</a>
		        </li>
		    </ul>
   		</div>