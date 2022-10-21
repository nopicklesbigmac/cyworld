<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="member.profileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("userid");
	String cp = request.getContextPath();
	String saveFolder2 = "/admin/"+id+"/";
	String saveFolder = "C:\\javas\\jsp_workspace\\cyw\\src\\main\\webapp\\img\\"+ id;
	File file = new File(saveFolder);
	profileDAO Dao = new profileDAO();
	if(file.exists() == false)
		file.mkdirs();
	
	int maxSize = 1024 * 1024 * 10; // 10MB
	MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, "utf-8");
	
	String pro = multi.getOriginalFileName("fileUpload");
	String profile = saveFolder2+pro;
	
	Dao.updateP(id,profile);  
	out.print("<script> window.close();</script>");

%>