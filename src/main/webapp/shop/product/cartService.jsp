<%@page import="shop.CyCartDTO"%>
<%@page import="shop.CyitemshopDTO"%>
<%@page import="shop.CyitemshopDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int num= Integer.parseInt(request.getParameter("num")); 
 	CyitemshopDAO cyitemshopDao = new CyitemshopDAO();
	CyitemshopDTO dto = cyitemshopDao.selectnum(num);
	String sessionid = (String)session.getAttribute("userid");
	if (cyitemshopDao.selectcart(sessionid, num)==1){
		out.print("<script>window.close();</script>");
	}else{
    	if (dto==null){
    		out.print("<script>window.close();</script>");
		}else{
        	cyitemshopDao.insert(dto,sessionid);
        	out.print("<script>window.close();</script>");
       	}
    }
%>