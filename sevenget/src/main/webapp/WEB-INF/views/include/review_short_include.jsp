<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<c:forEach var="review" items="${reviewList}" begin="0" end="2">
	<div class="review">
		<font class="cr_view">${review.content}</font>

		<font class="cr_date">${review.reviewdate} ${review.writer}</font>
	</div>
</c:forEach>
