<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ include file="/WEB-INF/views/include/filter_include.jsp" %>
<link rel="stylesheet" href="../resources/css/searchBody.css" >
	<script>
		$(function(){
			$('img.interested').click(function(){
				if($(this).attr('src')=='../resources/img/blackheart.jpg'){
					$(this).attr('src', '../resources/img/colorheart.jpg')
					$('span.nothing').load('regInter?cid='+$(this).attr('data-cid'))
				} else{
					$(this).attr('src', '../resources/img/blackheart.jpg')
					$('span.nothing').load('canInter?cid='+$(this).attr('data-cid'))
				}
			})
		})	
	</script>
	<c:forEach var= "loveComp" items="${ interestedComList }">
		<script>
			$(function(){
				$('img[data-cid='+${loveComp.cid}+']').attr('src', '../resources/img/colorheart.jpg')	
			})
		</script>
	</c:forEach>
	<!-- 기업 정보 -->
		<div class="rh_head">
			<span class="resulttitle">&emsp;기업</span>
		</div>

		<hr width="915px" color="#aaa" size="1" class="dt_hr">
		<c:forEach var="company" items="${ companylist }">
		<form>
			<table>
				<tr>
					<td class="companylogo" rowspan=4><img class="companylogo" src="../resources/img/logos/${company.logo}"></td>
					<td class="companytitle" rowspan=4>${company.cname }</td>
					<td colspan=5></td>
					<td class="interested"rowspan=4><img class="interested" src="../resources/img/blackheart.jpg" data-cid="${company.cid}"></td>
				</tr>
				<tr>
					<td class="companyindustry">${company.industry}</td>
					<td class= "c_employee">사원수 ${company.employee}명</td>
					<td rowspan=2>매출액 ${company.sales}</td>
					<td class="c_get">
						<c:if test="${company.dateGet=='T'}">
							데이트
						</c:if>
						<c:if test="${company.marryGet=='T'}">
							결혼
						</c:if>
						<c:if test="${company.babyGet=='T'}">
							육아
						</c:if>
						<c:if test="${company.houseGet=='T'}">
							내집마련
						</c:if>
						<c:if test="${company.relationGet=='T'}">
							인간관계
						</c:if>
						<c:if test="${company.dreamGet=='T'}">
							꿈
						</c:if>
						<c:if test="${company.hopeGet=='T'}">
							희망
						</c:if>
					</td>
					<td>득</td>
				</tr>
				<tr>
					<td colspan=2 class="c_address">${company.location}</td>
					<td class="c_lose">
						<c:if test="${company.dateGet=='F'}">	
							데이트
						</c:if>
						<c:if test="${company.marryGet=='F'}">	
							결혼
						</c:if>
						<c:if test="${company.babyGet=='F'}">	
							육아
						</c:if>
						<c:if test="${company.houseGet=='F'}">	
							내집마련
						</c:if>
						<c:if test="${company.relationGet=='F'}">	
							인간관계
						</c:if>
						<c:if test="${company.dreamGet=='F'}">	
							꿈
						</c:if>
						<c:if test="${company.dateGet=='F'}">	
							희망
						</c:if>					
					</td>
					<td>포</td>
				</tr>
				<tr>
					<td colspan=4></td>
				</tr>
			</table>
		</form>
		<hr width="888px" color="#aaa" size="1" class="dt_hr">
		</c:forEach>
		<span class="nothing">