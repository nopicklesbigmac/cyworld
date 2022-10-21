
<%@page import="member.profileDAO"%>
<%@page import="using.cyusingDAO"%>
<%@page import="using.CyminimiDTO"%>
<%@page import="member.CyUserDTO"%>
<%@page import="member.CyUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");  
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	String name = request.getParameter("userName");
	String gender = request.getParameter("userGender");
	
	String year = request.getParameter("userYear");
	String month = request.getParameter("userMonth");
	String day = request.getParameter("userDay");
	String bir = year + "-"+ month+ "-"+ day;
		
	CyUserDAO cyuserDao = new CyUserDAO();
	CyUserDTO cyuser = cyuserDao.selectId(id);
	String man = "/admin/minimi/basic_man.png";
	String girl = "/admin/minimi/basic_girl.png";
	String room = "/admin/room/basic_room.png";
	String manbg = "/admin/background/basic_man.jpg";
	String girlbg = "/admin/background/basic_girl.jpg";
	String picm = "/admin/pic/basic_man.jpg";
	String picg = "/admin/pic/basic_girl.jpg";

	if (cyuser==null){
			CyUserDTO user = new CyUserDTO();
			user.setUserId(id);
			user.setUserPw(pw);
			user.setUserName(name);
			user.setUserGender(gender);
			user.setUserBirth(bir);
			user.setCheckDay("");
			user.setUserDotory(300);
			user.setToDay(0);
			user.setTotalDay(0);
			cyuserDao.insert(user);
			// 기본 미니미 설정 
			cyusingDAO mdao = new cyusingDAO();
			CyminimiDTO  storyroom =new CyminimiDTO();
			storyroom.setUserid(id);
			storyroom.setSaveFileName(room);
			storyroom.setOriginalFileName(room);
			mdao.insertroom(storyroom);
			if (gender.equals("남자")){
				CyminimiDTO  minimi =new CyminimiDTO();
				minimi.setUserid(id);
				minimi.setSaveFileName(man);
				minimi.setOriginalFileName(man);	
				minimi.setImgy("100");
				minimi.setImgx("190");
				mdao.insert(minimi);
				
				CyminimiDTO  bg =new CyminimiDTO();
				bg.setUserid(id);
				bg.setSaveFileName(manbg);
				bg.setOriginalFileName(manbg);
				mdao.insertbg(bg);
				
				profileDAO pd = new profileDAO();
				pd.insert(id, picm, "자기소개 없음"); 
				
				out.print("<script>location.href='createUser_ok.jsp';</script>");
			}else{
				CyminimiDTO  minimi =new CyminimiDTO();
				minimi.setUserid(id);
				minimi.setSaveFileName(girl);
				minimi.setOriginalFileName(girl);
				minimi.setImgy("100");
				minimi.setImgx("190");
				mdao.insert(minimi);
				
				CyminimiDTO  bg =new CyminimiDTO();
				bg.setUserid(id);
				bg.setSaveFileName(girlbg);
				bg.setOriginalFileName(girlbg);
				mdao.insertbg(bg);
				
				profileDAO pd = new profileDAO();
				pd.insert(id, picg, "자기소개 없음"); 
				
				
				out.print("<script>location.href='createUser_ok.jsp';</script>");
			}
			
			
			
		}else{
			out.print("<script>alert('중복아이디');history.back();</script>");
		}
	%>
