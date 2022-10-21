
<%@page import="member.profileDTO"%>
<%@page import="member.profileDAO"%>
<%@page import="member.CyUserDTO"%>
<%@page import="member.CyUserDAO"%>
<%@page import="member.memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.CyMemberListDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String userid = (String)session.getAttribute("userid");
	CyMemberListDAO member = new CyMemberListDAO();
	ArrayList<memberDTO> members1 = member.selectmember1(userid,1); 
	ArrayList<memberDTO> members2 = member.selectmember2(userid,1); 
	
	
	//
	CyUserDAO user = new CyUserDAO();
	CyUserDTO userinfo = user.selectId(userid);
	String gender = userinfo.getUserGender(); 
	String birth = userinfo.getUserBirth();
	String name = userinfo.getUserName();
	
	profileDAO ppp = new profileDAO();
	profileDTO profile= ppp.select(userid);
	String prop = profile.getPro();
	String pc = profile.getContent();
	String picm = "/admin/pic/basic_man.jpg";
	String picg = "/admin/pic/basic_girl.jpg";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${resourcePath }/img${fontCss}"/><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<script type="text/javascript" src="/cyworld/resources/js/ajaxUtil2.js"></script>
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
var str_i="";

$(document).ready(function(){
	document.getElementById("profile_info_ok").style.display="none";
	sendRequest("my_get_Info.action",null,displayInfo,"GET");
});


function change_i(){
	document.getElementById("profile_info").style.display="none";
	document.getElementById("profile_info_ok").style.display="block";
	str_i = str_i.replace(/<br\/>/ig, "\n");
	document.getElementById("infoTxt_ok").value=str_i;
	
}

function change_i_ok(){
	document.getElementById("profile_info").style.display="block";
	document.getElementById("profile_info_ok").style.display="none";
	var newInfo = document.getElementById("infoTxt_ok").value;
	 window.parent.location.href = "<%=cp%>/mypage/profileService.jsp?content="+newInfo;
}

function initSet(){
	document.getElementById("profile_info_ok").style.display="none";
	sendRequest("my_get_Info.jsp",null,displayInfo,"GET");
}

function displayInfo(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			str_i = httpRequest.responseText;
			var infoTxt = document.getElementById("infoTxt");
			infoTxt.innerHTML = str_i;	
		}
	}
}



</script>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>Insert title here</title>

 <body bgcolor="#FFFFFF">	
	<table border="0" width="130" bgcolor="#FFFFFF">
		<tr >
			<td bgcolor="#FFFFFF" align="center"><font><div id="profile_status"></div></font></td>
		</tr>
		<tr >
			<td>
				<table bgcolor="#FFFFFF" width="130" cellpadding="1" cellspacing="1">
					<tr bgcolor="#FFFFFF">
						<td>
						<img src="<%=cp%>/img/<%=prop%>" width="128" height="128" border="0" alt="asd"/>
						
						</td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td><img src="<%=cp%>/img/admin/pic/editBtn.jpg" onclick="window.open('my_pic_upload.jsp','','width=400,height=200,location=no,status=no,scrollbars=no');"></td>
					</tr>
				</table>
			</td>

		</tr>
		<tr>
			<td> 
				<font>
					<div id="profile_info" style="overflow-y:scroll; width:140px;  height:100px; padding:0px"><span id="infoTxt" style="font-size:13px;"><%=pc%></span><img src="<%=cp%>/img/admin/pic/editBtn.jpg" style="position: absolute; top:235pt; left:5pt;"onclick="change_i();"/></div>
					<div id="profile_info_ok"><textarea rows="7" cols="20" id="infoTxt_ok" style="font-size:8pt; resize: none;" ><%=pc%></textarea><img src="<%=cp%>/img/admin/pic/editOkBtn.jpg" style="position: absolute; top:235pt; left:5pt;"onclick="change_i_ok();"/></div>
					<img src="<%=cp%>/img/admin/pic/bar.jpg" alt="<%=cp%>/img/admin/pic/bar.jpg" style="position: absolute; top:250pt; left:5pt;" />
				</font>
				<font style="font-size:10pt; position: absolute; top:270pt; left:5pt;" color="#0f3073"><b><%=name %>></b> 
				<%if (gender.equals("남자")) {%>
				<img src="<%=cp%>/img/admin/pic/man.jpg">
				<%} %>
				<%if (gender.equals("여자")) {%>
				<img src="<%=cp%>/img/admin/pic/girl.jpg">
				<%} %>
				<font style="font-size: 7pt;"><%=birth%></font>
				<br/>
				<img src="<%=cp%>/img/admin/pic/member_check_btn.jpg" onclick="window.open('my_member_list.jsp','<%=userid%>memberCheck','width=312,height=380,location=no,status=no,scrollbars=no');"/>
				</font>
				<select id="mySelect" style="background-color: #9cbde7; width:140px; heigt:5px; position: absolute; top:300pt; left:5pt;" onchange="moveToUser();">
					<option value="">★일촌 파도타기</option>
					
					<%
						if (members1 !=null){
							for (memberDTO m :members1){
								%>
								<option value="<%=m.getUserId() %>"><%=m.getUserName()%> (친구)</option>
								<% 
							}
						}
					if (members2 !=null){
						for (memberDTO m :members2){
							%>
							<option value="<%=m.getUserId() %>"><%=m.getUserName()%> (친구)</option>
							<% 
						}
					}
					%>
				</select>
				<img src="<%=cp%>/img/admin/pic/randomBtn.jpg" style="position: absolute; top:315pt; left:20pt;" onclick="random();"/>
			</td>
		</tr>
	</table>	
 </body>
</html>