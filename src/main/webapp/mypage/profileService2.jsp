<%@page import="member.profileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	profileDAO Dao = new profileDAO();

	String id = (String)session.getAttribute("userid");
	String pro = request.getParameter("pro");
	Dao.updateP(id,pro);  
	   out.print("<script> window.parent.location.href = 'my_main.jsp';</script>");

%>