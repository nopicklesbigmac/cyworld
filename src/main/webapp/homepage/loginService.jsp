<%@page import="member.CyUserDTO"%>
<%@page import="member.CyUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");  
String id = request.getParameter("userId");
String pw = request.getParameter("userPw");
CyUserDAO cyuserDao = new CyUserDAO();
CyUserDTO cyuser = cyuserDao.selectId(id);

	if (cyuser==null){
		out.print("<script>alert('없는 아이디');history.back();</script>");
	return;
	}
	if (cyuser.getUserPw().equals(pw)){
		session.setAttribute("userid", cyuser.getUserId());
		session.setAttribute("username", cyuser.getUserName());
		response.sendRedirect("/cyw/homepage/index.jsp");
	}else{
		out.print("<script>alert('비밀번호 틀림');history.back();</script>");
		return;
	}
	
%>
