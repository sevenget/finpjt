<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.company.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	List<String> list = (List<String>) request.getAttribute("company");
	System.out.println(list);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>interestingCompanyList</title>
</head>
<body>
						
						<!-- 연습 -->
						<table style="border:0; clear:both; margin-left:10px;">
							<tr>
							
							<c:forEach items="${company }" var="list" begin="0" end="2">
							
								<td style="width: 220px; height:150px; border:0; clear:both;">

									<img onclick="location.href='./detailpage?cid=${list.cid}'" style="width: 220px; height: 150px;" src="../resources/img/logos/${list.logo}" />

								</td>
								
							</c:forEach>
							
							</tr>
							
							<tr>
							
							<c:forEach items="${company }" var="list" begin="3" end="5">
							
								<td style="width: 220px; height:150px; border:0; clear:both;">

									<img onclick="location.href='./detailpage?cid=${list.cid}'" style="width: 220px; height: 150px;" src="../resources/img/logos/${list.logo}" />

								</td>
								
							</c:forEach>
							
							
							</tr>
							
						</table>
						
						
</body>
</html>
