<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%
	// boardList에서 categoryName, boardTitle, boardContent 값 받아오기
	// 바로 값받으면 list창으로 이동
	
	// 한글 패치
	request.setCharacterEncoding("utf-8");
	// 값넘겨받기
	String categoryName = request.getParameter("categoryName");
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	String boardPw = request.getParameter("boardPw");
	
	// 디버깅
	System.out.println(categoryName+"<--categoryName");
	System.out.println(boardTitle+"<--boardTitle");
	System.out.println(boardContent+"<--boardContent");
	System.out.println(boardPw+"boardPw");
	
	BoardDao boardDao = new BoardDao();
	Board board = new Board();
	
	board.categoryName=categoryName;								
	board.boardTitle=boardTitle;										//-->board에 가져온 파라미터값 넣기
	board.boardContent=boardContent;
	board.boardPw=boardPw;
	
	boardDao.insertBoard(board);
	
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
%>