<%@page import="member.profileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	profileDAO Dao = new profileDAO();

	String id = (String)session.getAttribute("userid");
	String content = request.getParameter("content");
	Dao.updateC(id,content);  
	   out.print("<script> window.parent.location.href = 'my_main.jsp';</script>");

%>