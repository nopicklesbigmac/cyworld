<%@page import="board.CyBoardDAO"%>
<%@page import="board.CyBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String n = request.getParameter("num");
	int num = 0;
	num = Integer.parseInt(n);
	CyBoardDAO dao = new CyBoardDAO();
	CyBoardDTO dto = dao.selectNum(num);
	int hitcount = dto.getHitCount();
	hitcount++;
	dao.incrementHit(num, hitcount);
	
%>
<%
%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul{
  	list-style:none;
    display: inline-block;
    vertical-align: middle;
    padding: 0px 0px 0px 0px;
	font-size : 9pt;
}
 a:link { color:#243354; text-decoration: none;}
 a:visited { color:#243354; text-decoration: none;}
 a:hover { color:#243354; text-decoration: none;}

</style>
</head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="/cyworld/resources/js/ajaxUtil2.js"></script>
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    initSet();
});

function moving(folderNameToMove,num,folderName){	
	location.replace('my_board_move_ok.jsp?num='+num+'&newFolderName='+folderNameToMove+"&folderName="+folderName);
}

function moveFolder(folderName,num){
	window.open("my_board_move.jsp?folderName="+folderName+"&num="+num,"movingmovingmovingvmon","width=250,height=300,location=no,status=no,scrollbars=no");
}
function deleteFile(num){
	document.upload.action="my_board_deleted.jsp?num="+num;
	document.upload.submit();
}
function listMenu(folderName){
	var pageNum = "${pageNum}";
	document.upload.action="my_r_board_page.jsp?pageNum="+pageNum+"&folderName="+folderName;
	document.upload.submit();
}


function initSet(){
	var params = "num=${dto.getNum()}";
	sendRequest("my_board_getReple.jsp",params,displayInfo,"GET");
}

function repleSend(){
	var params = "num=${dto.getNum()}";
	var str = document.getElementById("contentReple").value;
	str = str.replace(/(<([^>]+)>)/gi, "");
	str = str.replace(/\n/gi, "<br/>");
	document.getElementById("contentReple").value = "";
	params += "&reple="+str;
	if(str == ""){
		alert("????????? ???????????????");
		return;
	}
	var url = "my_board_getReple.jsp?"+params;
	url = encodeURI(url);
	sendRequest(url,null,displayInfo,"GET");
}

function displayInfo(){
	if(httpRequest.readyState==4){
		if(httpRequest.status==200){
			str_i = httpRequest.responseText;
			var reple = document.getElementById("reple");
			reple.innerHTML = str_i;	
		}
	}
}

function deleteReple(repleNum){
	var params = "repleNum="+repleNum;
	params += "&num=${dto.getNum()}";
	sendRequest("my_board_deleteReple.jsp",params,displayInfo,"GET");
}

</script>


 <body>

 <form action="" name="upload" method="post" enctype="multipart/form-data">


	<table align="center" border="0" bgcolor="#FFFFFF" width="420" cellpadding="1" cellspacing="1">
		<tr bgcolor="#FFFFFF" height="30px">
			<td  align="left" bgcolor="#FFFFFF">
				<font  style="font-size:12pt;"><b><%=dto.getSubject() %></b></font>
			</td>
			<td align="right">
				<img src="<%=cp%>/resources/images/listBtn.png" onclick ="listMenu('<%=dto.getFolderName() %>');"/>
				<img src="<%=cp%>/resources/images/moveBtn.png" onclick = "moveFolder('<%=dto.getFolderName() %>','<%=dto.getNum() %>');"/>
				<img src="<%=cp%>/resources/images/deleteBtn.png" onclick = "deleteFile('<%=dto.getNum() %>');"/>
			<td>
		</tr>
	</table> 
	<hr style="border: solid 1px #ccd5cc;"/>
	<table align="center" border="0" bgcolor="#FFFFFF" width="420" cellpadding="1" cellspacing="1">
		<tr bgcolor="#FFFFFF" height="30px">
			<td width="60" bgcolor="#FFFFFF" align="left"><font style="font-size:9pt; color: #335599;"><%=dto.getUserName() %></font></td>
			<td width="360" align="right"><font style="font-size:9pt;">
				<%=dto.getCreated() %></font> <font style="color:#99aa99; font-size:9pt;">?????????</font> <font style="color: #ff5500; font-size:9pt;"><%=hitcount %></font>
			</td>
		</tr>	
	</table>
	<hr style="border: dotted 1px #ccd5cc;"/>
	<table align="center" border="0" cellpadding="0" cellspacing="0" width="420">
		<%if(dto.getOriginalFileName() == null) { %>
		<tr>
			<td align="right">  <font style="color:#99aa99; font-size:9pt;">???????????? :</font> <a href="javascript:location.href='my_r_download.jsp?saveFileName=<%=dto.getSaveFileName() %>&userid=<%=dto.getUserId() %>"><%=dto.getSaveFileName() %></a>
			</td>
		</tr>
		<%} %>
		<tr height="300px" valign="top">
			<td align="left"> 
				<%=dto.getContent() %>
			</td>
		</tr>
	</table>
	<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
	<hr style="border: solid 1px #ccd5cc;"/>
	<img alt="" src="<%=cp%>/resources/images/reple.png"><br/>
	<div style="background-color: #f6f6f6" id="reple"></div>
	<div style="background-color: #f6f6f6" align="center">
	<input type="text" id="contentReple" style="width: 80%;"/><img alt="" src="<%=cp%>/resources/images/okBtn.png" onclick="repleSend();"><br/>
	</div>
</form>

 </body>
</html>