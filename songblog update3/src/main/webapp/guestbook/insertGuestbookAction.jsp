<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.GuestbookDao" %>
<%@ page import = "vo.*" %>
<%
	// guestbookList에서 writer, guestbookContext, guestbookPw 값 받아오기
	// 바로 값받으면 list창으로 이동
	
	// 한글 패치
	request.setCharacterEncoding("utf-8");
	// 값넘겨받기
	String writer = request.getParameter("writer");
	String guestbookContent = request.getParameter("guestbookContent");
	String guestbookMemo = request.getParameter("guestbookMemo");
	String guestbookPw = request.getParameter("guestbookPw");
	
	// 디버깅
	System.out.println(writer+"<--writer");
	System.out.println(guestbookContent+"<--guestbookContent");
	System.out.println(guestbookPw+"<--guestbookPw");
	
	GuestbookDao guestbookDao = new GuestbookDao();
	Guestbook guestbook = new Guestbook();
	
	guestbook.setGuestbookContent(guestbookContent);	
	guestbook.setGusetbookMemo(guestbookMemo);
	guestbook.setGuestbookPw(guestbookPw);										//-->guestbook에 가져온 파라미터값 넣기
	guestbook.setWriter(writer);
	
	guestbookDao.insertGuestbook(guestbook);
	
	response.sendRedirect(request.getContextPath()+"/guestbook/guestbookList.jsp");
%>
