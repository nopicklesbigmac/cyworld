<%@page import="shop.CyitemshopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");  
String sessionid = (String)session.getAttribute("userid");
int num = Integer.parseInt(request.getParameter("num"));
CyitemshopDAO cyitemshopDao = new CyitemshopDAO();
cyitemshopDao.deletecart(sessionid,num);

out.print("<script>location.href='cart.jsp?userid"+sessionid+"';</script>");
%>