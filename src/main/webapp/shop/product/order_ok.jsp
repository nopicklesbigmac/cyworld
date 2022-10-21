<%@page import="shop.CyitemshopDTO"%>
<%@page import="shop.CyitemshopDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");  
	String sessionid = (String)session.getAttribute("userid");
	String[] number = request.getParameterValues("num");
	int num ;
	CyitemshopDAO cyitemshopDao = new CyitemshopDAO();
	String list ="";  
	
	for(int i=0; i<number.length; i++){
	      String str = number[i];
	      num = Integer.parseInt(str);
	         if (cyitemshopDao.selectmyitem(sessionid,num)){//
	        	 cyitemshopDao.deletecart(sessionid,num);
	         }else{ 
	        	 CyitemshopDTO cartitem = cyitemshopDao.selectnum(num);
	               cyitemshopDao.byitem(cartitem,sessionid);
	               cyitemshopDao.dotory(sessionid,cartitem.getItemPrice());
	               cyitemshopDao.deletecart(sessionid,num);
	            list += "&num="+num;
	            
	      } 
	      
	      
	   }
	out.print("<script>location.href='orderComplete.jsp?"+list+"';</script>");
%>