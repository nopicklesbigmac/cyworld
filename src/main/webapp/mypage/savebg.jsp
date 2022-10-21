<%@page import="using.cyusingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");  
	String backGround = request.getParameter("backGround");
	String id = (String)session.getAttribute("userid");
	
	cyusingDAO using = new cyusingDAO();
	using.usingbg(id, backGround);
	   out.print("<script> window.parent.location.href = 'my_main.jsp';</script>");

%>