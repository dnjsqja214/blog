<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "java.io.*" %>
<%
	// 1) 테이블 데이터 삭제
	// 2) upload폴더에 이미지 삭제

	int photoNo = Integer.parseInt(request.getParameter("photoNo"));
	String photoPw = request.getParameter("photoPw");
	
	PhotoDao photoDao = new PhotoDao();
	
	String photoName = photoDao.selectPhotoName(photoNo);
	
	// 1) 데이블 데이터 삭제
	int delRow = photoDao.deletePhoto(photoNo, photoPw);
	
	// 2) 폴더 이미지 삭제
	if(delRow == 1) { // 테이블 데이터 삭제 성공
		String path = application.getRealPath("upload");
		File file = new File(path+"\\"+photoName); // 잘못 저장된 파일을 불러온다. java.io.File  
		file.delete(); // 잘못 업로드된 파일을 삭제
	} else {
		System.out.println("삭제 실패!");
	}
	
%>
