<%@page import="board.CyBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.CyBoardDAO"%>
<%@page import="using.CyminimiDTO"%>
<%@page import="using.cyusingDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String myminimi ="";
	String storyroom ="";
	String mx ="";
	String my ="";
	int dotory=0;
	String userid ="";
	if (session.getAttribute("userid")!=null){
		 userid = (String)session.getAttribute("userid");
		cyusingDAO dao = new cyusingDAO();
		CyminimiDTO minimi = dao.select(userid);
		myminimi = minimi.getOriginalFileName();
		mx = minimi.getImgx()+"px";
		my = minimi.getImgy()+"px";
		CyminimiDTO sr = dao.selectsr(userid);
		storyroom = sr.getOriginalFileName();
		
	}
	CyBoardDAO bdao = new CyBoardDAO();
	ArrayList<CyBoardDTO> blist= bdao.selectb(userid);
%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">

ul{
    display: inline-block;
    vertical-align: middle;
    padding: 0px 0px 0px 30px;
	font-size : 9pt;

}

body
	{scrollbar-face-color: #FFFFFF;
	 scrollbar-highlight-color: #DBDBDB;
	 scrollbar-3dlight-color: #FFFFFF;
	 scrollbar-shadow-color: #9C92FF;
	 scrollbar-darkshadow-color: #FFFFFF;
	 scrollbar-track-color: #FFFFFF;
	 scrollbar-arrow-color: #9C92FF}
	 
 a{ 
 color: black; text-decoration: none;
 }
 
</style>
 </head>
 <script type="text/javascript" src="/cyworld/resources/js/ajaxUtil2.js"></script>
 <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
 <script type="text/javascript">
 
 $(document).ready(function(){
	    initSet();
	});
 
 function initSet(){
		sendRequest("my_get_MemberBoard.jsp",null,displayInfo,"GET");
}
 

 function displayInfo(){
 	if(httpRequest.readyState==4){
 		if(httpRequest.status==200){
 			str_i = httpRequest.responseText;
 			var memberBoard = document.getElementById("memberBoard");
 			memberBoard.innerHTML = str_i;	
 		}
 	}
 }
 
 function deleteComment(userId){
	 var params = "userId="+userId;
	 sendRequest("my_get_MemberBoard_delete.jsp",params,displayInfo,"GET");
 }
 
 
 function moveToUser(userId){
	 window.open("user_main.jsp?userId="+userId,userId,"width=1090,height=600,location=no,status=no,scrollbars=no");
 }
 </script>

 <body leftmargin="5" topmargin="0">
	<table bgcolor="#DBDBDB" width="440" cellpadding="1" cellspacing="1">
      <tr bgcolor="#FFFFFF" >
         <td colspan="2"><font class="updateBoard"><b>Update Board...</b></font></td>
      </tr>
      <tr bgcolor="#FFFFFF" style="font-size:9pt;">
         <td width="240"> 
         	
         	<%if(blist!=null){ 
         		int len = 5;
         		for(CyBoardDTO list : blist){ 
         			%>
         			<img alt="" src="<%=cp%>/resources/images/<%= list.getType()%>Title.png" width="30px" height="12px">${list.get(i).getSubject() }<br/>
         			<% 
         			len-- ;
         		}
         		for (int i =len; i<=0;i--){
         			%> <br/><%
         		}
         	}
         	if (blist==null) {%> 
            <span style="text-align: center;"><br/>등록된 게시물이 없습니다<br/>소식이 뜸한 친구에게 마음의 한마디를<br/>남겨주세요.<br/><br/><br/></span>
			<%} %> 
         </td>
         <td valign="center">  
           <%//방명록 자리  %>

         </td>
      </tr>
   </table>

	<br/>
	<img src="<%=cp %>/resources/images/bar.jpg" width="440" height="6" border="0" alt="라인">

	<table bgcolor="#DBDBDB" width="440" cellpadding="1" cellspacing="1">
		<tr bgcolor="#FFFFFF" >
			<td align="center"  colspan="2">  
				<font><b>나의 미니미와 스토리룸을 소개합니다.</b></font>	
			</td>
		</tr>
		<tr bgcolor="#FFFFFF">
			<td align="center" colspan="2">  
				<img src="<%=cp%>/img<%=storyroom%>" width="389" height="192" border="0" alt="<%=cp%>/img<%=storyroom%>">
				<img src="<%=cp%>/img<%=myminimi%>" alt="<%=cp%>/img<%=myminimi%>" style="position: absolute; top :120px; left : <%=mx%>;"/>
			</td>
		</tr>
	</table><br/>
		<font color="#8be0ff" size="3pt"><b>일촌평</b></font><hr noshade size="1px" color="#e6e6e6"/>
		<span id="memberBoard"></span>
 </body>
</html>