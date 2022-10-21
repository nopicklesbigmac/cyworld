<%@page import="member.CyUserDTO"%>
<%@page import="member.CyUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");  
	String id = request.getParameter("userId");
	if(id=="") {
		out.print("<script>alert('사용불가능한 아이디');location.href='createUser.jsp';</script>");
	}
	CyUserDAO cyuserDao = new CyUserDAO();
	CyUserDTO cyuser = cyuserDao.selectId(id);
		if (cyuser==null){
			out.print("<script>alert('사용가능한 아이디');location.href='createUser.jsp?&chk=0&idVal="+id+"';</script>");
		}
		else{
			out.print("<script>alert('중복아이디');location.href='createUser.jsp?chk=1';</script>");
		}
	%>
