<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <nav class="navbar navbar-expand-sm bg- navbar-dark">
	  <h1>C A S H B O O K</h1>
		<div class="spinner-grow text-danger"></div>
		<div class="spinner-grow text-warning"></div>
		<div class="spinner-grow text-success"></div>
		<div class="spinner-grow text-info"></div>
		<div class="spinner-grow text-primary"></div>
		<div class="spinner-grow text-muted"></div>
		<div class="spinner-grow text-secondary"></div>
		<div class="spinner-grow text-dark"></div>
	</nav>  
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
</nav>
<br>
<br>
<div class ="container">
<!-- 좌측 인덱스 추가 -->
	<div class="row">
	<div class="col-sm-2">
	<br>
	<br>
	<br>
    <h3>Index</h3>
    <ul class="nav nav-pills flex-column">
		<li class="nav-item">
		  	<a class="nav-link" href="<%=request.getContextPath()%>/board/boardList.jsp">boardList</a>
		</li>
        <li class="nav-item">
          	<a class="nav-link active" href="<%=request.getContextPath()%>/guestbook/guestbookList.jsp">Guestbook</a>
        </li>
        <li class="nav-item">
        	  <a class="nav-link" href="<%=request.getContextPath()%>/photo/photoList.jsp">Photo</a>
        </li>
    </ul>
    </div>
    
