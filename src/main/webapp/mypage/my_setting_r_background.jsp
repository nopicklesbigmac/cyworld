<%@page import="shop.CyitemshopDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.CyitemshopDAO"%>
<%@page import="member.CyUserDTO"%>
<%@page import="member.CyUserDAO"%>
<%@page import="using.CyminimiDTO"%>
<%@page import="using.cyusingDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String pathUserId=(String)request.getAttribute("pathUserId");
	String usebg ="";
	String basicbg ="";
	int dotory=0;
	String userid ="";
	if (session.getAttribute("userid")!=null){
		userid = (String)session.getAttribute("userid");
		cyusingDAO dao = new cyusingDAO();
		CyminimiDTO bg = dao.selectbg(userid);
		usebg = bg.getOriginalFileName();
		CyminimiDTO sr = dao.selectsr(userid);
		CyUserDAO user = new CyUserDAO();
		CyUserDTO cyuser = user.selectId(userid); 
		if(cyuser.getUserGender().equals("남자")){
			basicbg = "/admin/background/basic_man.jpg";
		}else{
			basicbg  = "/admin/background/basic_girl.jpg";
		}

		
		
	} 
	CyitemshopDAO item = new CyitemshopDAO();
	 
	ArrayList<CyitemshopDTO> bglsit = item.mylist(userid,"스킨");
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
 	
 input[type="radio"] {
  margin-top: -1px;
  vertical-align: middle;
}
 	
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
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript">

<%-- function saveBg(){
	document.myForm.action = "<%=cp %>/cy/setting/saveBackGround.action";
	document.myForm.submit();
} --%>
$(document).ready(function(){
$("#sendBtn").click(function(){
	var usingBg= document.myForm.backGround.value;	
	params="backGround="+usingBg;
	 window.parent.location.href = "<%=cp%>/mypage/savebg.jsp?backGround="+usingBg;

 });
});

function changeBg(src){
	var src = document.myForm.backGround.value;
	var src = "<%=cp%>/img"+src;
	window.top.document.getElementById("backBg").style.backgroundRepeat = "no-repeat";
	window.top.document.body.style.background = "#f3f3f3 url('"+src+"') no-repeat";
}
	
</script>
</head>
<body>
<form name="myForm">
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
	
	<div align="left" style="width: 420px; height:370px; padding-left: 5px;font: 굴림;font-size: 10pt;border: 0px solid black;">
	<%if (usebg.equals(basicbg)){
					%>
					<input type="radio" name="backGround" value="<%=basicbg%>" checked="checked"  onclick="changeBg(this.value)"><img alt="<%=cp%>/img<%=basicbg%>" src="<%=cp%>/img<%=basicbg%>" width="120px"><br/>&nbsp;&nbsp;&nbsp;기본<br/>   
					<%
				}
				if (!usebg.equals(basicbg)){
					%>
					<input type="radio" name="backGround" value="<%=basicbg%>"  onclick="changeBg(this.value)"><img alt="<%=cp%>/img<%=basicbg%>" src="<%=cp%>/img<%=basicbg%>" width="120px"><br/>&nbsp;&nbsp;&nbsp;기본<br/>   
					<%
				}
				if(bglsit!=null){
					for(CyitemshopDTO story : bglsit){
						if (usebg.equals(story.getOriginalFileName())){
							%>
							 <input type="radio" name="backGround" value="<%=story.getOriginalFileName()%>" checked="checked" onclick="changeBg(this.value)"><img alt="<%=cp%>/img<%=story.getOriginalFileName()%>" src="<%=cp%>/img<%=story.getOriginalFileName()%>" width="120px" ><br/>&nbsp;&nbsp;&nbsp;<br/>
                       
							<%
						}
						if (!usebg.equals(story.getOriginalFileName())){
							%>
							 <input type="radio" name="backGround" value="<%=story.getOriginalFileName()%>"onclick="changeBg(this.value)"><img alt="<%=cp%>/img<%=story.getOriginalFileName()%> " src="<%=cp%>/img<%=story.getOriginalFileName()%>" width="120px" ><br/>&nbsp;&nbsp;&nbsp;<br/>
                       
							<%
						}
					}
				}
				%> 
	
	</div>
	<input type="button" id="sendBtn" value ="저장" />
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
</form>
</body>
</html>