<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	//javaScript:location.href='my_picture.jsp?menu=menu3'
	String aa="_ok";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.unselected-Menu{
	border: 1px solid;
	border-left: 0px;
	width: 60px;
	height: 22px;
	padding-top: 6px;
	margin-bottom: 3px;
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
	font-size: 9pt;
	user-select:none;
}
.selected-Menu{
	border: 1px solid;
	border-left: 0px;
	background-color: white;
	width: 60px;
	height: 22px;
	padding-top: 6px;
	margin-bottom: 3px;
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
	font-size: 9pt;
	user-select:none;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">


</script>
<title>Insert title here</title>
</head>
<body>
<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_home.jsp?menu=menu1';">홈</div>
<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_profile.jsp?menu=menu2';">프로필</div>
<div align="center" class="selected-Menu" onclick="">사진첩</div>
<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_board.jsp?menu=menu6';">게시판</div>
<div align="center" class="selected-Menu" onclick="javaScript:location.href='my_setting.jsp?menu=menu7';">관&nbsp;리</div>
</body>
</html>