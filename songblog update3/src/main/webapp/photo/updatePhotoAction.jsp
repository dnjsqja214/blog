<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import ="vo.*" %>

<%
	int photoNo = Integer.parseInt(request.getParameter("photoNo"));
	String photoTitle = request.getParameter("photoTitle");
	String photoMemo = request.getParameter("photoMemo");
	String photoPw = request.getParameter("photoPw");
	
	Photo photo = new Photo();
	photo.setPhotoNo(photoNo);
	photo.setPhotoTitle(photoTitle);
	photo.setPhotoMemo(photoMemo);
	photo.setPhotoPw(photoPw);
	
	System.out.println(photoNo+"<--photoNo");
	System.out.println(photoTitle+"<--photoTitle");
	System.out.println(photoMemo+"<--photoMemo");
	System.out.println(photoPw+"<--photoPw");
	
	
	PhotoDao photoDao = new PhotoDao();
	int row = photoDao.updatePhoto(photo);
	if(row == 1){
		response.sendRedirect(request.getContextPath()+"/photo/photoList.jsp");
	} else {
		
	}
%>
