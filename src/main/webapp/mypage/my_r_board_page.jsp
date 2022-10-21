<%@page import="board.CyBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.CyBoardDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String name = (String)session.getAttribute("username");
	String userid = (String)session.getAttribute("userid");
	
	CyBoardDAO dao = new CyBoardDAO();
	
	ArrayList<CyBoardDTO> list = dao.selectAll(userid);   
%> 
<% 
%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: grey;}
a:hover {text-decoration: underline; color: red;}
 	
body{
	scrollbar-face-color: #FFFFFF;
	 scrollbar-highlight-color: #DBDBDB;
	 scrollbar-3dlight-color: #FFFFFF;
	 scrollbar-shadow-color: #9C92FF;
	 scrollbar-darkshadow-color: #FFFFFF;
	 scrollbar-track-color: #FFFFFF;
	 scrollbar-arrow-color: #9C92FF
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/cyworld/resources/js/ajaxUtil2.js"></script>
<script type="text/javascript">
function sendBoard(num){
	document.board.action = "my_r_board_article.jsp?num="+num+"&pageNum=${pageNum}";
	document.board.submit();
}

</script>
</head>
<body>
<form name="board" method="post" action="">
	<table border="0" width="420" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td align="left">
				<%=name %>
			</td>
			<td align="right">
				<img alt="글쓰기" src="<%=cp %>/resources/images/writeBtn.png" onclick="javascript:location.href='my_r_board_write.jsp?folderName=${folderName }&pageNum=${pageNum }';">				
			</td>
		</tr>
	</table>

	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>

	<!-- 사진 ----------------------------------------------------------------------------------------------- -->
	<table width = "100%" >	
		<tr style="font-size: 10pt; text-align: center;">
			<td width="10%"></td>
			<td width="40%"><b>제목</b></td>
			<td width="20%"><b>작성자</b></td>
			<td width="20%"><b>작성일</b></td>
			<td width="10%"><b>조회</b></td>
		</tr>
	</table>
	<hr width="93%" style="border: solid 1px #e6e6e6;"/>
	
	<%
	if(list==null){
	%>
	<table border="0" width="420" height="300" cellpadding="1" cellspacing="1" align="center">
		<tr valign="middle">
			<td align="center">
				<font  style="font-size:10pt;font-weight: bold;">
					등록된 글이 없습니다.
				</font>
			</td>
		</tr>
	</table> 
		 
	<%}
	if(list!=null){
		for(CyBoardDTO board : list){ 
	%><table width = "100%" >
		<tr style="font-size: 8pt; text-align: center;"onclick="location.href='my_r_board_article.jsp?num=<%=board.getNum()%>'">
			<td width="10%"><%=board.getNum() %> </td>  
			<td width="40%" style="text-align: left"> <%=board.getSubject() %></td>
			<td width="20%"><font color="#47678d"><%=board.getUserName() %></font></td> 
			<td width="20%"><%=board.getCreated() %></td>
			<td width="10%"><%=board.getHitCount() %></td> 
		</tr>	
		</table>	
	<%} 
		} 
		%> 
	

	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
	<br/><br/><br/>
</form>
</body> 
</html>