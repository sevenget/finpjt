<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.company.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	List<String> list = (List<String>) request.getAttribute("company");
%>


	<div class="clist_table">
		<div class="clist_tr">
			<c:forEach items="${company }" var="list" begin="0" end="2">
	
				<div class="clist_td">
	
					<img onclick="location.href='./detailpage?cid=${list.cid}'"
					style="width: 200px; height: 150px;"
					src="../resources/img/logos/${list.logo}" />
	
				</div>
	
			</c:forEach>
	
		</div>
	
		<div class="clist_tr">
	
			<c:forEach items="${company }" var="list" begin="3" end="5">
	
				<div class="clist_td">
	
					<img onclick="location.href='./detailpage?cid=${list.cid}'"
					style="width: 200px; height: 150px;"
					src="../resources/img/logos/${list.logo}" />
	
				</div>
	
			</c:forEach>
		</div>
	</div>
	
	
	
	
