<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>interestingCompanyList</title>
</head>
<body>
						
						<!-- 
						
						<c:forEach var="item" items="${itemList}">
							<C:out value="${item.itemId}" />
						</c:forEach>
						
						 -->
						
						<!-- 연습 -->
						<table style="border:1px solid red ; clear:both; margin-left:10px;">
							<tr>
							<%-- <c:forEach var="item" items="${inter_list}"> --%>
								<td style="width: 220px; height:150px; border:1px solid red ; clear:both;">
									<img style="width: 220px; height: 150px;" src="c://img//kakao.png" />
								</td>
								<td style="width: 220px; height:150px; border:1px solid red ; clear:both;">
									
									<c:forEach var="item" items="${list}">
									<c:out value="${list.img}"></c:out>
									
									</c:forEach>
								</td>
								<td style="width: 220px; height:150px; border:1px solid red ; clear:both;"></td>
							</tr>																																		
							<tr>																																
								<td style="width: 220px; height:150px; border:1px solid red ; clear:both;"></td>
								<td style="width: 220px; height:150px; border:1px solid red ; clear:both;"></td>
								<td style="width: 220px; height:150px; border:1px solid red ; clear:both;"></td>
							</tr>
							<%-- </c:forEach> --%>
						</table>
						
						
</body>
</html>