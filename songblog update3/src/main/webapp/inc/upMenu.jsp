<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPhotoForm.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<!--  다른페이지의 부분으로 사용되는 페이지 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
 <nav class="navbar navbar-expand-sm bg- navbar-dark">
	  <h1>I N D E X</h1>
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
	<div class="conStainer">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<div>
					<h3>board</h3>
					<a href="<%=request.getContextPath()%>/board/boardList.jsp"><img src="<%=request.getContextPath()%>/upload/blog2.png"  class="img-thumbnail" alt="Cinque Terre" width="500" height="500"></a>
				</div>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<div>
					<h3>guestbook</h3>
					<a href="<%=request.getContextPath()%>/board/boardList.jsp"><img src="<%=request.getContextPath()%>/upload/guestbook.png"  class="img-thumbnail" alt="Cinque Terre" width="500" height="500"></a>
				</div>
			</div>
		</div>
		<br><br><br>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<div>
					<h3>photok</h3>
					<a href="<%=request.getContextPath()%>/photo/photoList.jsp"><img src="<%=request.getContextPath()%>/upload/photo.png"  class="img-thumbnail" alt="Cinque Terre" width="500" height="500"></a>
				</div>
			</div>
			<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<div>
					<h3>pdf</h3>			
					<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp"><img src="<%=request.getContextPath()%>/upload/pdf.png"  class="img-thumbnail" alt="Cinque Terre" width="500" height="500"></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
