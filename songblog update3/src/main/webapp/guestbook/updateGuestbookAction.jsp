<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.GuestbookDao" %>
<%@ page import = "vo.*" %>
<%
	// updateGuestbookForm에서 입력값 받아오기
	// 입력값 매개변수?에 값 넣어주기
	// list로 돌아가기
	int guestbookNo = Integer.parseInt(request.getParameter("guestbookNo"));
	String guestbookContent =  request.getParameter("guestbookContent");
	String guestbookPw = request.getParameter("guestbookPw");
	// 디버깅
	System.out.println(guestbookNo+"<-guestbookNo");
	System.out.println(guestbookContent+"<-guestbookContent");
	System.out.println(guestbookPw+"<-guestbookPw");
	
	GuestbookDao guestbookDao = new GuestbookDao();
	Guestbook guestbook = new Guestbook();
	
	guestbook.guestbookContent = guestbookContent;
	guestbook.guestbookNo = guestbookNo;
	guestbook.guestbookPw = guestbookPw;
	
	guestbookDao.updateGuestbook(guestbook);
	
	response.sendRedirect(request.getContextPath()+"/guestbook/guestbookList.jsp");
%>
