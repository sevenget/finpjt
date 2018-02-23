<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	
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
					<td colspan=4></td>
					<td rowspan=4><img class="interested" src="../resources/img/blackheart.jpg" data-cid="${company.cid}"></td>
				</tr>
				<tr>
					<td>${company.industry}</td>
					<td>사원수 ${company.employee}명</td>
					<td rowspan=2>${company.sales}</td>
					<td class="c_get"> 내 집 마련, 꿈, 희망 득
				</tr>
				<tr>
					<td colspan=2 class="c_address">${company.location}</td>
					<td class="c_lose">연애, 결혼, 출산, 인관관계 포기</td>
				</tr>
				<tr>
					<td colspan=4></td>
				</tr>
			</table>
		</form>
		<hr width="888px" color="#aaa" size="1" class="dt_hr">
		</c:forEach>
		<span class="nothing">