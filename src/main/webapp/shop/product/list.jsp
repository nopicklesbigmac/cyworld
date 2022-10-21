<%@page import="shop.CyCartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.CyitemshopDTO"%>
<%@page import="shop.CyitemshopDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String type= request.getParameter("type"); 
 	CyitemshopDAO cyitemshopDao = new CyitemshopDAO();
	ArrayList<CyitemshopDTO> lists = cyitemshopDao.selectlist(type);
	if (type.equals("all")){
		lists = cyitemshopDao.selectall();
 	}else{
 		
 	}
	String sessionid = (String)session.getAttribute("userid");
%> 
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	
<%@ include file="/shop/header_item.jsp" %>
  
<style>
	.logo {
	padding-top:10px;
	padding-left: 25px;
	height:45;
	}
</style>

<script type="text/javascript">

	
	function sendIt_Cart() {
		
		if('${sessionScope.userid}'==null) {
			swal('로그인이 필요합니다', '로그인 창으로 이동합니다.', 'warning', {
        		closeOnClickOutside: false,
            	closeOnEsc: false,
           		buttons : {
                confirm : {
                	text : '확인',
                	value : true,
                	className : 'btn btn-outline-primary'
                	}
        	}
        	}).then((result) => {
        		if(result){
        			location.href='/cyw/homepage/login.jsp';
        			}
        		});
        	return;
        	}
	}

	function insert(select,num){
		if('${sessionScope.userid }'=="") {
			swal('로그인이 필요합니다', '로그인 창으로 이동합니다.', 'warning', {
        		closeOnClickOutside: false,
            	closeOnEsc: false,
           		buttons : {
                confirm : {
                	text : '확인',
                	value : true,
                	className : 'btn btn-outline-primary'
                	}
        	}
        	}).then((result) => {
        		if(result){
        			location.href='/cyw/homepage/login.jsp';
        			}
        		});
        	return;
        	}

        		window.open("../product/cartService.jsp?num="+num,"장바구니","width=1, height=1")
    			window.focus();
        		swal('장바구니에 상품이 추가되었습니다.', '장바구니로 이동하시겠습니까?', {
    				icon: "success",
    				buttons: {
    				cancel: '아니오',
    				confirm: {
    		   	 	    text: '네',
    		    	    value: true,
    		   	  	 	},
    			},
    			}).then((result => {
    				if(result) {
    					document.myForm.action = '../product/cart.jsp?userId=' + '${sessionScope.userid }';
    					document.myForm.submit();
    					return false;
    					}
    				})
    				);
	}
	
	
</script>

	<br />
	<br />
	<form action="" name="myForm" method="post">

		<div class="mainContBox">
			<div class="titWrap">
				<h1 class="tit">일촌들에게 아이템을 선물해보세요!</h1>
				<p class="cmnt">
					<a href="<%=cp%>/shop/product/list.jsp?type=all">전체보기</a>
				</p>
				<br />
				<br />
			</div>

			<div class="row">
		<%for(CyitemshopDTO dto:lists){ %>
		<div class="col-lg-4 col-md-4 mb-4">
			<div class="card h-100">
				<a href="javascript:location.href='<%=cp%>/shop/product/listdetail.jsp?num=<%=dto.getNum()%>';">
					<img class="card-img-top" src="<%=cp%>/img<%=dto.getSaveFileName() %>"/></a>
	
					<div class="card-body">
						<h5 class="card-title">
							<a href="javascript:location.href='<%=cp%>/shop/product/listdetail.jsp?num=<%=dto.getNum()%>';">
							<input type="hidden" value="<%=dto.getNum() %>" name="num"/>
							[<%=dto.getType()%> ] <%=dto.getItemName() %><span class="ic_new_ss"></span></a>
						</h5>
						<h6>
							<!-- fmt option 활용하여 가격 출력 format 수정 -->
							<img src="<%=cp%>/img/dotori.png" width="18" height="18" name="도토리" />
							<b><%=dto.getItemPrice() %></b>
						</h6>
					</div>
				<div class="card-footer">
					<input type="button"
					onclick="insert(<%=cyitemshopDao.selectcart(sessionid, dto.getNum()) %>,<%=dto.getNum()%>);" 
					value="장바구니에 담기"/>
				</div>
			</div>
		</div><%} %>
	
	</div>
		</div>
	</form>
<%@ include file="/shop/footer.jsp" %>

