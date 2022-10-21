<%@page import="member.CyUserDTO"%>
<%@page import="member.CyUserDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<% /* post방식일때 한글깨짐 방지 */
	request.setCharacterEncoding("UTF-8");  
	String idVal = request.getParameter("idVal");
		if (idVal==null)
			idVal= "";

	
%>
<%
Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);

%>

<%@ include file="../shop/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
function createDay(){
	document.forms["myForm"].userDay.options.length=0;
	var selectYear = document.getElementById("userYear");
	var yearValue = selectYear.options[selectYear.selectedIndex].value;
	var selectMonth = document.getElementById("userMonth");
	var monthValue = selectMonth.options[selectMonth.selectedIndex].value;
	if(yearValue==""||monthValue==""){
		return;
	}
	var lastDay = new Date(yearValue,monthValue,0).getDate();
	for(var i = 1; i <=lastDay ; i++){
		var op = new Option();
		op.value= i;
		op.text = i;
		document.forms["myForm"].userDay.add(op);
	}
}


function pw_search() { 
 	var frm = document.myForm;

	 if (frm.userId.value == "") {
		  alert("아이디를 정확하게 입력해주세요");
		  return;
	 }if (frm.userId.value.length < 1) {
	  alert("이름을 입력해주세요");
	  return;

	 }else
 	frm.method = "post";
 	 frm.action = "findPwService.jsp"; //넘어간화면
 	 frm.submit();  
 	 }
	 
</script>

</head>
<body>

<form action="checkuser.jsp" method="post" name="myForm">

<div id="container">

		<ul class="path">
			<li><a href="#none">홈</a></li>
			<li class="current"><a href="#none">ID/PW 찾기</</a></li>
		</ul>

		<div id="contents">
			<div id="personInpt01">
				<div class="titWrap">
					<h2 class="pTit">PW 찾기</h2>
				</div><br/>


				<div id="personView">
					<div class="joinCopy">
						싸이월드에 오신 것을 환영합니다. <br>
						<strong>로그인 후 <span class="fc01">싸이월드의 다양한 서비스</span>를 만나보세요.</strong>
					</div>
				</div><br/>

				<div class="mgT30" id="def-info">
					<strong class="dpIB flL fs17 fc33">기본정보입력</strong>
					<span class="dpIB flR"><i class="icon required">필수</i> 항목은 필수입력 값입니다.</span>
				</div>
			</div>
			<br/><br/><br/>
			<div id="personInpt02">
				<div class="infoTbl clB">
					<table>
						<caption>회원가입 기본정보</caption>
						<colgroup>
							<col width="150px">
							<col width="*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row"><i class="icon required" aria-required="true">필수</i> 아이디</th>
							<td>
								<input type="text" id="lgn_id" name="userId" style="width:235px;" title="아이디""/>
								
							</td>
						</tr>
						
						
						<tr>
							<th scope="row"><i class="icon required" aria-required="true">필수</i> 이름</th>
							<td>
								<c:if test="${chk==null }">
									<input type="text" id="cst_nm" name="userName" style="width:235px;" title="이름"
									onclick='dupliCheck();' onkeyup='dupliCheck();'>
								</c:if>
								<c:if test="${chk!=null }">
									<input type="text" id="cst_nm" name="userName" style="width:235px;" title="이름">
								</c:if>
							</td>
						</tr>
						
					</table>
					</tbody>
				</div>
					<div id="btnViewP" class="btnWrap cart">
					
						<button class="btnBuy" type="button" style="width:150px;"
						onclick="pw_search();">PW 찾기</button>
						
						<button class="btnBuy" type="button" style="width:150px;"
						onclick="location.href='index.jsp'">돌아가기</button>
						</div><br/><br/><br/><br/>
			</div>
			
		</div>
			


</div>
						
</form>						
</body>
</html>
<%@ include file="../shop/footer.jsp" %>
