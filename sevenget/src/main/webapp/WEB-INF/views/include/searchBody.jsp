<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ include file="/WEB-INF/views/include/filter_include.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<link rel="stylesheet" href="../resources/css/searchBody.css" >
	<script>
		$(function(){
			$('img.interested').click(function(){
				if("${id}"=="Guest"){
					alert("관심기업 등록 및 해지는 로그인 이후 사용이 가능합니다");
					return false;
				}
				
				if($(this).attr('src')=='../resources/img/whiteheart.jpg'){
					$(this).attr('src', '../resources/img/colorheart.jpg')
					$('span.nothing').load('regInter?cid='+$(this).attr('data-cid'))
				} else{
					$(this).attr('src', '../resources/img/whiteheart.jpg')
					$('span.nothing').load('canInter?cid='+$(this).attr('data-cid'))
				}
			})
			
			$('.requestdetail').click(function(){
				if('${id}'=="Guest"){
					alert('상세보기는 로그인 후 이용할 수 있습니다'); 
					return false;
				}
				$('#form_'+$(this).attr('data-cid')).submit();
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
		<c:if test="${fn:length(companylist)==0}">
			<img src="../resources/img/searchnothing.png" style="margin:20px 100px; width:80%">
		</c:if>
		<c:forEach var="company" items="${ companylist }" begin="0" end="20">
		<form action="detailpage" id="form_${company.cid}">
			<input type="hidden" name= "cid" value="${company.cid }">
			<table>
				<tr>
					<td class="companylogo requestdetail" rowspan=4 data-cid="${company.cid }"><img class="companylogo" src="../resources/img/logos/${company.logo}"></td>
					<td class="companytitle" rowspan=4><b  class="requestdetail" data-cid="${company.cid }"><nobr>${company.cname}</nobr></b></td>
					<td colspan=5></td>
					<td class="interested"rowspan=4><img class="interested" src="../resources/img/whiteheart.jpg" data-cid="${company.cid}"></td>
				</tr>
				<tr>
					<td class="companyindustry">${company.industry}</td>
					<td class= "c_employee">사원수 ${company.employee}명</td>
					<td rowspan=2>매출액 ${company.sales}</td>
					<td class="c_get">
						<c:if test="${company.dateGet=='T'}">
							<nobr>데이트</nobr>
						</c:if>
						<c:if test="${company.marryGet=='T'}">
							<nobr>결혼</nobr>
						</c:if>
						<c:if test="${company.babyGet=='T'}">
							<nobr>육아</nobr>
						</c:if>
						<c:if test="${company.houseGet=='T'}">
							<nobr>내집마련</nobr>
						</c:if>
						<c:if test="${company.relationGet=='T'}">
							<nobr>인간관계</nobr>
						</c:if>
						<c:if test="${company.dreamGet=='T'}">
							<nobr>꿈</nobr>
						</c:if>
						<c:if test="${company.hopeGet=='T'}">
							<nobr>희망</nobr>
						</c:if>
					</td>
					<td>득</td>
				</tr>
				<tr>
					<td colspan=2 class="c_address">${company.location}</td>
					<td class="c_lose">
						<c:if test="${company.dateGet=='F'}">	
							<nobr>데이트</nobr>
						</c:if>
						<c:if test="${company.marryGet=='F'}">	
							<nobr>결혼</nobr>
						</c:if>
						<c:if test="${company.babyGet=='F'}">	
							<nobr>육아</nobr>
						</c:if>
						<c:if test="${company.houseGet=='F'}">	
							<nobr>내집마련</nobr>
						</c:if>
						<c:if test="${company.relationGet=='F'}">	
							<nobr>인간관계</nobr>
						</c:if>
						<c:if test="${company.dreamGet=='F'}">	
							<nobr>꿈</nobr>
						</c:if>
						<c:if test="${company.dateGet=='F'}">	
							<nobr>희망</nobr>
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
		<span class="nothing"></span>