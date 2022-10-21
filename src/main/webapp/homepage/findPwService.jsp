<%@page import="member.CyUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("userId");
    String userName = request.getParameter("userName");
    
      
	 CyUserDAO dao = new CyUserDAO();
	 String mpw = dao.findPw(userId, userName); //아이디를 디비에서 가져옴..실패시 널
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 찾기</title>
<%@ include file="../shop/header.jsp" %>
</head>
<body>

  <form action="checkuser.jsp" method="post" name="myForm">
      <%
       if (mpw != null) {
      %>
      
      <div id="personView">
			<div class="joinCopy">
	     <br><br><br>
	      		회원님의 비밀번호는 <strong><%=mpw%></strong>입니다 
	     </div>
	     	<div id="btnViewP" class="btnWrap cart">
	     <button class="btnBuy" type="button" style="width:150px;" onclick="location.href='/cyw/homepage/login.jsp'">로그인</button>
	     <button class="btnBuy" type="button" style="width:150px;" onclick="location.href='index.jsp'">돌아가기</button>
       	</div><br/><br/><br/><br/>
       
      <%
  } else {
 %>
 		
			<div class="joinCopy">
	     <br><br><br>
	      		<strong>등록된 정보가 없습니다</strong> 
	     </div>
	    <div id="btnViewP" class="btnWrap cart">
			<button class="btnBuy" type="button" style="width:150px;" onclick="location.href='/cyw/homepage/findPw.jsp'">다시 찾기</button>
			<button class="btnBuy" type="button" style="width:150px;" onclick="location.href='/cyw/homepage/createUser.jsp'">회원가입</button>
       </div>  
       <%
  }
 %> 
      </form>
      </body>
</html>
<%@ include file="../shop/footer.jsp" %>