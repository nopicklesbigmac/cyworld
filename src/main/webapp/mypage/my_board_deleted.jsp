<%@page import="board.CyBoardDTO"%>
<%@page import="board.CyBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("userid");
String num = request.getParameter("num");

	int n = Integer.parseInt(num);
	CyBoardDAO dao = new CyBoardDAO();
	CyBoardDTO dto = dao.selectNum(n);
	if(id.equals(dto.getUserId())){
		dao.deleteb(n);
	}
	out.print("<script>alert('게시글 삭제 완료'); location.href='my_r_board_page.jsp';</script>");
%>