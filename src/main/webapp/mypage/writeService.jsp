<%@page import="board.CyBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="board.CyBoardDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = (String)session.getAttribute("userid");
	String username = (String)session.getAttribute("username");
	
	String saveFolder = "C:\\javas\\jsp_workspace\\cyw\\src\\main\\webapp\\img\\upload" + id ;
	File file = new File(saveFolder);
	if(file.exists() == false)
		file.mkdirs();
	
	int maxSize = 1024 * 1024 * 10; // 10MB
	MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, "utf-8");
	
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String upfile = multi.getOriginalFileName("upfile");
	
	out.print("subject : " + subject + "<br>");
	out.print("content : " + content+ "<br>");
	out.print("username : " + username+ "<br>");
	out.print("upfile : " + upfile+ "<br>");
	
	CyBoardDTO board = new CyBoardDTO(); 
	board.setSubject(subject);
	board.setContent(content);
	board.setUserName(username);
	board.setUserId(id);
	board.setHitCount(0);
	
	Date date = new Date(); 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	board.setCreated(sdf.format(date));
	board.setSaveFileName(upfile);
	
	CyBoardDAO dao = new CyBoardDAO();
	dao.write(board);   
	out.print("<script>alert('게시글 작성 완료'); location.href='my_r_board_page.jsp';</script>");
%>
