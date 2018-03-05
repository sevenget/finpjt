<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.company.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	List<String> list = (List<String>) request.getAttribute("company");
%>
			
						
						<table style="border:0; clear:both; margin-left:145px;">
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
						
						


