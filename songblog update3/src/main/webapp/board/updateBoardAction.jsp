<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<% 
	
	// updateForm에서 테이블에 입력한 값 가져오기
	// dao를 이용해 update하기
	// 잘 수정되었는지 확인 할 수 있게 페이지는 boardOne으로 이동
	
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String categoryName = request.getParameter("categoryName");
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	String boardPW = request.getParameter("boardPw");
	
	System.out.println(boardNo+"<--boardNo");
	System.out.println(categoryName+"<--CategoryName");
	System.out.println(boardTitle+"<--boardTitle");
	System.out.println(boardContent+"<--boardContent");
	System.out.println(boardPW+"<--boardPw");
	
	BoardDao boardDao = new BoardDao();
	Board board = new Board();
	
	board.setCategoryName(categoryName);
	board.setBoardTitle(boardTitle);
	board.setBoardContent(boardContent);
	board.setBoardNo(boardNo);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect(request.getContextPath()+"/board/boardOne.jsp");
%>