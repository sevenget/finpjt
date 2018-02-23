<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = null;
if(session.getAttribute("id") != null){
id = (String)session.getAttribute("id");
}
System.out.println(id+" 로그인 성공 리다이렉트");
response.sendRedirect("main");

%>