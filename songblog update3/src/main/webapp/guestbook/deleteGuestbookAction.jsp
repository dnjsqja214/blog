<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	// deleteGuestbookForm에서 no,pw값 받아오기
	int guestbookNo = Integer.parseInt(request.getParameter("guestbookNo"));
	String guestbookPw = request.getParameter("guestbookPw"); 
	System.out.println(guestbookNo+"<-guestbookNo");
	System.out.println(guestbookPw+"<-guestbookPw");
	
	// 변수 생성
	GuestbookDao guestbookDao = new GuestbookDao(); // import="dao.*"추가
	Guestbook guestbook= new Guestbook();  // import="vo.*"추가
	// 변수에 값을 대입
	guestbook.guestbookNo = guestbookNo;
	guestbook.guestbookPw = guestbookPw;
	
	// 메서드 호출
	int row = guestbookDao.deleteGuestbook(guestbookNo, guestbookPw); 
	// 디버깅
	if(row == 1) { // 입력되면
		System.out.println("삭제성공");
		response.sendRedirect(request.getContextPath()+"/guestbook/guestbookList.jsp");
	} else if (row == 0) { // 입력이 안되면
		System.out.println("삭제실패");
		response.sendRedirect(request.getContextPath()+"/guestbook/updateGuestbookForm.jsp?guestNo="+guestbook.guestbookNo);
	} else {
		System.out.println("update 오류");
	}
%>
