<%@page import="member.CyUserDTO"%>
<%@page import="member.CyUserDAO"%>
<%@page import="using.cyusingDAO"%>
<%@page import="using.CyminimiDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String myminimi ="";
	int dotory=0;
	if (session.getAttribute("userid")!=null){
		String userid = (String)session.getAttribute("userid");
		cyusingDAO dao = new cyusingDAO();
		CyminimiDTO minimi = dao.select(userid);
		myminimi = minimi.getSaveFileName();
		CyUserDAO Dao = new CyUserDAO();
		CyUserDTO user = Dao.selectId(userid); 
		dotory = user.getUserDotory();
	}
	
	
%>

<%@ include file="../shop/header.jsp"%>

<script type="text/javascript">

	//01-08 현종 추가
	// 받은 선물함 팝업창
	function popup() {
		window.open('popup.jsp','${session.getUserId() }_gift',
		'width=312,height=390,location=no,status=no,scrollbars=no');
		
		// 0.650초 뒤에 페이지 리로드
		// 선물함 최신화 하기 위한 것
		setTimeout(() => location.reload(true), 650);
		
		
	}
	
	function popupMember(){
		window.open('my_member_list.jsp','member_list','width=312,height=390,location=no,status=no,scrollbars=no');
	}
	
</script>

<link type="text/css" rel="stylesheet" href="<%=cp %>/resources/css/covid19.css">

<!-- 이미지 슬라이딩 -->
<div class="mainBanner">
	<div class="imgSliderWrap listW">
		<ul class="sliderImg">
			<li
				style="background-image: url('../img/admin/main-bg/gunchim_full.png'); background-position: center; background-repeat: no-repeat;">
				<a href="index.jsp" title="군침이 터져나오는 신상 스킨 구경가기"></a>
			</li>

			<li
				style="background-image: url('../img/admin/main-bg/fimally_full.png'); background-position: center; background-repeat: no-repeat">
				<a href="index.jsp" title="마참내 배경음악 구경가기"></a>
			</li>

			<li
				style=" background-image: url('../img/admin/main-bg/maplefont_full.png'); background-position: center; background-repeat: no-repeat">
				<a href="index.jsp"
				title="메이플스토리체 출시">
				</a>
			</li>

			<li
				style="background-color:; background-image: url('../img/admin/main-bg/minimiclub_full.png'); background-position: center top; background-repeat: no-repeat">	
				<a
				href="index.jsp"
				title="댄스댄스 미니미 보러가기">
				<img src="../img/admin/minimi/test6.gif"
				width="200" height="200"
				style="position:relative; top:210px; left:-100px;">
				<img src="../img/admin/minimi/test5.gif"
				width="200" height="200"
				style="position:relative; top:210px; left:-100px;">
				<img src="../img/admin/minimi/test21.gif"
				width="200" height="200"
				style="position:relative; top:210px; left:-100px;">
				<img src="../img/admin/minimi/test13.gif"
				width="200" height="200"
				style="position:relative; top:210px; left:-100px;">
				</a>
			</li>

			<li
				style="background-color:; background-image: url('../img/admin/main-bg/minimiroom_full.png'); background-position: center top; background-repeat: no-repeat">
				<a href="../shop/product/list.jsp?type=스토리룸" 
				title="스토리룸 보러가기">
				<img src="../img/admin/minimi/test21.gif"
				width="200" height="200"
				style="position:relative; top:260px; left:230px;">
				</a>
			</li>
		</ul>
	</div>

	<div class="ctrl">
		<span class="prev"><a href="#prevB">&nbsp;</a></span> <span><strong>1</strong>/5</span>
		<span class="next"><a href="#nextB">&nbsp;</a></span> <span
			class="pause" id="pause">&nbsp;</span>
	</div>
	<div class="pagingW"></div>

</div>

<script type="text/javascript">
	bannerSlider(".mainBanner", 3500, "fade");
</script>

<!-- 아이템 리스트 -->
<br />
<br />
<div class="mainContBox">
	<div class="titWrap">
		
		<h1 class="tit" style="font-size: 20px;">
		<c:if test="${sessionScope.userid!=null }">
		${sessionScope.username } 
		</c:if>
		<c:if test="${sessionScope.userid==null }">
		guest
		</c:if>
		</h1>
		<h1 class="tit" style="font-weight:lighter;">님, 환영합니다. :)</h1>
		<br />
		<br /> <br />
	</div>

<!-- 마이페이지를 가운데에 둘거면 div 배치 가운데로 오게 해야함 -->
<div class="prdtList saleList">
	<ul>
		<li class="fstRow myCyworld"
			style="width:516px; ">
			<div class="itemWrap" 
				style="height:360px; border:5px solid lightgray;"> 
				
				<c:if test="${sessionScope.userid!=null }">
					<div class="itemTit" style="float:left; width:70%;">
						<p class="name" style="font-size: 20px; color:black;">
						<b>${sessionScope.username }</b> 님의 싸이월드</p>
					</div>
					<div class="itemTit" style="float:left; width:30%;">
					<button type="button"
						style="font-size: 15px; padding: 5px 15px 5px 15px; box-shadow: 1px 1px 2px 1px lightgray; color: gray; border-radius: 2px;"
						onclick="javascript:location.href='<%=cp%>/homepage/logout.jsp';">
						<b>로그아웃</b>
						</button>
					</div><br/>
					<div style="padding-top:10px;">
						<hr style="display:block; clear:both; padding: 0;
						border-top: orange 5px solid; height: 0px; opacity: 1;
						margin:0; margin-bottom: 5px;"/>
					</div>
				</c:if>
				
				
				<!-- 회원 정보가 있을 경우의 마이페이지 좌측-->
				<c:if test="${sessionScope.userid!=null }">
				<div>
					<div style="float:left; width:50%">
					<a href="" onclick="window.open('my_main.jsp','${sessionScope.userid }',
						'width=1090,height=600,location=no,status=no,scrollbars=no');"
						class="itemImg" title="${sessionScope.username } 님의 싸이월드"
						style="width:218; height:218;">	
					<img
						src="<%=cp %>/img<%=myminimi %>"
						alt="${sessionScope.username } 님의 미니미">
						<!-- myMinimi가 뜨다 안뜨다 하는 것 같소 -->
					</a>
						<div style="text-align:center;">
						내정보관리 | 사생활보호설정 
						</div>
					</div>
				</div>
					<!-- 마이페이지 우측 --> 	
				<div style="float:left; width:50%; padding-top:40px; 
				font-size:15px; line-height:180%">
					
					<div style="float:left; width:50%;">	
						내 도토리<br/>
						오늘방문자<br/>
						새게시물<br/>
						일촌신청<br/>
						선물함<br/>
						
					</div>
					<div style="float:left; width:50%"> 
					<!-- 이 부분 데이터랑 연동해줘야돼! -->
						
						
						
						<img src="../img/dotori.png" 
							width="18" height="18" name="도토리" />
						<font style="color:orange;"><%=dotory %></font><br/>						
					</div>
				</div>

				<div class="itemTit"
					style="clear: both; padding-top: 30px; text-align: center;">
					<button type="button"
						style="font-size: 18px; background-color: orange; padding: 10px 20px 10px 20px; box-shadow: 2px 2px 4px 2px lightgray; color: white; border-radius: 5px;"
						onclick="window.open('../mypage/my_main.jsp','${sessionScope.userid }','width=1090,height=600,location=no,status=no,scrollbars=no');">
						<b>내 미니홈피 가기 ▶</b>
					</button>
				</div>
			</c:if>
							
				<!-- 회원 정보가 없을 경우의 마이페이지 -->
				<c:if test="${sessionScope.userid==null }">
					<a href="" onclick="alert('로그인 후 이용하실 수 있습니다.')"
						class="itemImg" title="guest 님의 싸이월드"> 
					<img
						src="../img/admin/minimi/basic_man.png"
						alt="guest 님의 미니미"> 
					</a>
				</c:if>				
			
			<c:if test="${sessionScope.userid==null }">
				<div class="itemTit" style="width:100%; height:50;">
					<p class="name" 
					style="font-size: 18px;">
					다양한 친구들과 일촌이 되어보세요!</p>
				</div>
				<div class="itemTit" style="width:100%;">
					<p class="name" 
					style="font-size: 15px; height:50;">
					싸이월드에 가입하시면 풍성한 혜택을 누리실 수 있습니다.</p>
					<center><button type="button" float="center"
					style="border-radius:10px; border:1px solid gray; background-color:lightgray;
					padding:5px;"
					onclick="javascript:location.href='createUser.jsp';">
					<b><font style="font-size:15px">가입하러 가기!</font></b>
					</button>
					<button type="button" float="center"
					style="border-radius:10px; border:1px solid gray; background-color:lightgray;
					padding:5px;"
					onclick="javascript:location.href='login.jsp';">
					<b><font style="font-size:15px">로그인</font></b>
					</button>
					</center>
				</div>
			</c:if>
			
			</div>
		</li>
		
		
		<li class="fstRow" style="width: 500px; height: 408px; padding: 10px;
			padding-top:none;">
			
			<!-- weather widget -->
			<a
				class="weatherwidget-io"
				href="https://forecast7.com/en/37d57126d98/seoul/"
				data-label_1="SEOUL" data-label_2="South Korea"
				data-icons="Climacons Animated" data-days="5" data-theme="retro-sky">SEOUL
					South Korea</a>
			<script>
				!function(d, s, id) {
					var js, fjs = d.getElementsByTagName(s)[0];
					if (!d.getElementById(id)) {
						js = d.createElement(s);
						js.id = id;
						js.src = 'https://weatherwidget.io/js/widget.min.js';
						fjs.parentNode.insertBefore(js, fjs);
					}
				}(document, 'script', 'weatherwidget-io-js');
			</script>
			
			<!-- Covid19 Widget -->
			<h2 class="tit" style="text-align:center; color:black; padding-top:8px;">
				Covid-19 Stats in South Korea</h2>
			<div id="covid-widget" style="padding-top:5px; padding-bottom:5px;"></div>	
			<script type="text/javascript" src="<%=cp %>/resources/js/covid19stats.js"></script>
			<script>
			  $.covid19stats({
			  element: "#covid-widget", // Target element ID
			  countryCode: "KR", // ISO Country Code (get the list here : https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)
			  showImg: true, // True or false to show the left covid image
			  showCases: true, // True or false to show the "cases" stat
			  showDeaths: true, // True or false to show the "deaths" stat
			  showRecovered: true, // True or false to show the "recovered" stat
			  showRightLabel: true // True or false to show the "right label"
			});
			</script>
			
		</li><br/>
	</ul>
		<div class="titWrap" style="padding-top:50px;">
			<h1 class="tit">싸이월드 회원들과 일촌을 맺어보세요!</h1>
			<br />
			<br /> <br />
		</div>
	
	</div>
</div>

<%@ include file="../shop/footer.jsp"%>


