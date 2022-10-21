<%@page import="shop.CyitemshopDTO"%>
<%@page import="shop.CyitemshopDAO"%>
<%@page import="member.CyUserDTO"%>
<%@page import="member.CyUserDAO"%>
<%@page import="board.CyBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.CyBoardDAO"%>
<%@page import="using.CyminimiDTO"%>
<%@page import="using.cyusingDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String useminimi ="";
	String usestoryroom ="";
	String basicminimi ="";
	String basicstoryroom ="";
	String mx ="";
	String my ="";
	int dotory=0;
	String userid ="";
	if (session.getAttribute("userid")!=null){
		userid = (String)session.getAttribute("userid");
		cyusingDAO dao = new cyusingDAO();
		CyminimiDTO minimi = dao.select(userid);
		useminimi = minimi.getOriginalFileName();
		mx = minimi.getImgx();
		my = minimi.getImgy();
		CyminimiDTO sr = dao.selectsr(userid);
		usestoryroom = sr.getOriginalFileName();
		CyUserDAO user = new CyUserDAO();
		CyUserDTO cyuser = user.selectId(userid);
		if(cyuser.getUserGender().equals("남자")){
			basicminimi = "/admin/minimi/basic_man.png";
		}else{
			basicminimi = "/admin/minimi/basic_girl.png";
		}
		basicstoryroom = "/admin/room/basic_room.png";
		
		
	} 
	CyitemshopDAO item = new CyitemshopDAO();
	
	ArrayList<CyitemshopDTO> storylsit = item.mylist(userid,"스토리룸");
	ArrayList<CyitemshopDTO> minimilsit = item.mylist(userid,"미니미");
	CyBoardDAO bdao = new CyBoardDAO();
	ArrayList<CyBoardDTO> blist= bdao.selectb(userid);
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

.minimiImg {
	position: absolute;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript">
var boxXy="388px,183px";
var section = document.querySelector("#section1");
var container = section.querySelector(".storyImg");
var box = section.querySelector(".minimiImg");
var offset = {x:0,y:0};
var boxX ="";
var boxY ="";
$(document).ready(function(){
	$("#sendBtn").click(function(){
		var storyRoom= document.myForm.storyRoom.value;
		var minimi = document.myForm.minimi.value;
		params="storyRoom="+storyRoom+"&minimi="+minimi+"&imgx="+boxX+"&imgy="+boxY;
		document.myForm.action = "<%=cp%>/mypage/savestory.jsp?"+params;
		document.myForm.submit();
	 });
	
	

	
	container.onclick = function(e){
			boxX = box.style.left;
			boxY = box.style.top;
			box.style.left = (e.pageX-46)+"px";
			box.style.top = (e.pageY-60)+"px";
			
	}


	});
function changeStory(src){
	var src = document.myForm.storyRoom.value;
	var src = "url(<%=cp%>/img"+src+")";
	$("#storyImg2").css("background-image", src);
}

function changeMinimi(src){
	var src = document.myForm.minimi.value;
	var src = "url(<%=cp%>/img"+src+")";
	$("#minimiImg").css("background-image", src);
}
	
window.addEventListener("load", function(){
	
});
	
</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<form name="myForm">
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>	
	<div align="left" style="width: 420px; height:370px; padding-left: 5px;font: 굴림;font-size: 10pt;border: 0px solid black;">
	<section id="section1" class="section1">
	<div style="background-image: url('<%=cp%>/img<%=usestoryroom%>'); width: 399px; height: 200px; display:flex; justify-content: center; align-items: center;" id="storyImg2" class="storyImg2" >
		<div style="width : 349px; height: 142px;" border="0" id="storyImg" class="storyImg"/>
	</div>
	<div style="background-image: url('<%=cp%>/img<%=useminimi%>'); width: 90px; height: 90px; top: <%=my+"px"%>; left: <%=mx+"px"%>>; " id="minimiImg" class="minimiImg"/>
	</section>
	<table style="width: 420px; height:150px;">
		<tr>								
			<td style="width: 210px; height: 150px;">
				<div style="overflow-y:scroll; width:210px;  height:150px; padding:0px">
				<%if (usestoryroom.equals(basicstoryroom)){
					%>
					<input type="radio" name="storyRoom" value="<%=basicstoryroom%>" checked="checked"  onclick="changeStory(this.value)"><img alt="<%=cp%>/img<%=basicstoryroom%>" src="<%=cp%>/img<%=basicstoryroom%>" width="120px"><br/>&nbsp;&nbsp;&nbsp;기본<br/>   
					<%
				}
				if (!usestoryroom.equals(basicstoryroom)){
					%>
					<input type="radio" name="storyRoom" value="<%=basicstoryroom%>"  onclick="changeStory(this.value)"><img alt="<%=cp%>/img<%=basicstoryroom%>" src="<%=cp%>/img<%=basicstoryroom%>" width="120px"><br/>&nbsp;&nbsp;&nbsp;기본<br/>   
					<%
				}
				if(storylsit!=null){
					for(CyitemshopDTO story : storylsit){
						if (usestoryroom.equals(story.getOriginalFileName())){
							%>
							 <input type="radio" name="storyRoom" value="<%=story.getOriginalFileName()%>" checked="checked" onclick="changeStory(this.value)"><img alt="<%=cp%>/img<%=story.getOriginalFileName()%>" src="<%=cp%>/img<%=story.getOriginalFileName()%>" width="120px" ><br/>&nbsp;&nbsp;&nbsp;<br/>
                       
							<%
						}
						if (!usestoryroom.equals(story.getOriginalFileName())){
							%>
							 <input type="radio" name="storyRoom" value="<%=story.getOriginalFileName()%>"onclick="changeStory(this.value)"><img alt="<%=cp%>/img<%=story.getOriginalFileName()%> " src="<%=cp%>/img<%=story.getOriginalFileName()%>" width="120px" ><br/>&nbsp;&nbsp;&nbsp;<br/>
                       
							<%
						}
					}
				}
				%> 
            </div>
         </td>
         <td style="width: 210px; height: 150px;">
            <div style="overflow-y:scroll; width:210px;  height:150px; padding:0px">
            <%if (useminimi.equals(basicminimi)){
					%>
					<input type="radio" name="minimi" value="<%=basicminimi%>" checked="checked"  onclick="changeMinimi(this.value)"><img alt="<%=cp%>/img<%=basicminimi%>" src="<%=cp%>/img<%=basicminimi%>" width="120px"><br/>&nbsp;&nbsp;&nbsp;기본<br/>   
					<%
				}
				if (!useminimi.equals(basicminimi)){
					%>
					<input type="radio" name="minimi" value="<%=basicminimi%>"onclick="changeMinimi(this.value)"><img alt="<%=cp%>/img<%=basicminimi%>" src="<%=cp%>/img<%=basicminimi%>" width="120px"><br/>&nbsp;&nbsp;&nbsp;기본<br/>   
					<%
				}
				if(minimilsit!=null){
					for(CyitemshopDTO minimi : minimilsit){
						if (useminimi.equals(minimi.getOriginalFileName())){
							%>
							 <input type="radio" name="minimi" value="<%=minimi.getOriginalFileName()%>" checked="checked" onclick="changeMinimi(this.value)"><img alt="<%=cp%>/img<%=minimi.getOriginalFileName()%>" src="<%=cp%>/img<%=minimi.getOriginalFileName()%>" width="120px" ><br/>&nbsp;&nbsp;&nbsp;<br/>
                       
							<%
						}
						if (!useminimi.equals(minimi.getOriginalFileName())){
							%>
							 <input type="radio" name="minimi" value="<%=minimi.getOriginalFileName()%>"onclick="changeMinimi(this.value)"><img alt="<%=cp%>/img<%=minimi.getOriginalFileName()%> " src="<%=cp%>/img<%=minimi.getOriginalFileName()%>" width="120px" ><br/>&nbsp;&nbsp;&nbsp;<br/>
                       
							<%
						}
					}
				}
				%> 
				</div>
			</td>
		<tr>
	</table>			
	</div>
	<input type="button" id="sendBtn" value ="저장" onclick="saveStoryMinimi()"/>
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
</form>
</body>
</html>