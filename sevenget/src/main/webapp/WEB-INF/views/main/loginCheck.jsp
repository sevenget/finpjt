<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%
	PrintWriter put = response.getWriter();
	request.setCharacterEncoding("UTF-8");
	String id = null;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
		response.sendRedirect("main");
	}else{
		response.sendRedirect("login");
	}
%>