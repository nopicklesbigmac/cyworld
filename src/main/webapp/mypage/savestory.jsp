<%@page import="using.cyusingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");  
	String story = request.getParameter("storyRoom");
	String minimi = request.getParameter("minimi");
	String x = request.getParameter("imgx");
	String y = request.getParameter("imgy");
	String id = (String)session.getAttribute("userid");
	
	cyusingDAO using = new cyusingDAO();
	using.usingminimi(id, minimi, "190", "100");
	using.usingstory(id, story);
	   out.print("<script> window.parent.location.href = 'my_main.jsp';</script>");

%>