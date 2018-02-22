<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7get-Search</title>
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
	$(function(){		
		$('#searchBtn').click(function(){
			$('#searchHolder form').submit();
		})
		
		$('.companylogo').click(function(){
		 	if('${id}'=='Guest'){
				alert('상세정보를 보려면 회원가입을 가즈아')
			} else{
				location.href="mypage2";		
			}
		});
	});
</script>
<link rel="stylesheet" type="text/css" href="../resources/css/session.css " media="all" flush="false">
<link rel="stylesheet" href="../resources/css/searchMain.css" >


</head>
<body>
	<div id="head">
		<%@ include file="/WEB-INF/views/include/header.jsp" %>
	</div>		
	<div id="all">
		<div id=contect">
	
		
		
		<!-- 여기 안에다 작업하시면 돼요 -->	
		<div id = "searchHolder">
			
			<!-- 검색 -->
			<div>
				<form action="search">
						<table>
							<tr>
								<td> 
									<select>
										<option>&nbsp&nbsp통합</option>
										<option>&nbsp&nbsp기업</option>
										<option>&nbsp&nbsp채용</option>								
									</select>
									<nobr>
										<input name="keyword" type="text">
										<img id="searchBtn" src = "../resources/img/searchBtn.png">
									</nobr>
								</td>
								<td class="filter"> 필터</td>
							</tr>
						</table>
					</form>
				</div>
		</div>

			<div class="container2">	
				
				
				<!-- 기업 정보 -->
				<div id="resultHolder">
					<div class="rh_head">
						<span class="resulttitle">&emsp;기업</span>
					</div>
			
					<hr width="915px" color="#aaa" size="1" class="dt_hr">
					<c:forEach var="company" items="${ companylist }">
					<form>
						<table>
							<tr>
								<td class="companylogo" rowspan=4><img class="companylogo" src="../resources/img/logos/${company.logo }"></td>
								<td class="companytitle" rowspan=4>${company.cname }</td>
								<td colspan=4></td>
								<td rowspan=4><img src="../resources/img/colorheart.jpg"></td>
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
			</div>
				
				
				<div id="infoHolder">
					 <!-- 배너 광고 -->
					 <div class="info_ad">
						<a href="void(0);" onclick="alert('준비중 입니다.');return false;"><img src="../resources/img/ad1.png"></a>
					</div>
					
					<!-- 회원정보 -->
					<div class="infoContHolder">
						<div class="infocontholder_2">

								<p class="head_member">회원 정보</p>
								<hr width="285px" color="#aaa" size="1" class="hr_member">
						
								<div class="ficture">
									<img src="../resources/img/johnpic.jpg">
								</div>
							
								<div class="membership">
									<p>홍길동</p><br>
									<p class="font">1990/02/10</p>
									<p class="font">쾌도대학교 졸업</p>			
								</div>
								
								<input type="button" value="MyPage" class="MyPage_btn" onclick="location.href='mypage';">
						</div>
					</div>
						<!-- 
						<table>
							<tr>
								<td rowspan=3><img src="../resources/img/johnpic.jpg" onClick="location.href='mypage';"></td>
								<td class="myinfo">이름</td>
								<td class="myinfoCont">정주온</td>
							</tr>
							<tr>
								<td class="myinfo">성별</td>
								<td class="myinfoCont">남</td>		
							</tr>
							<tr>
								<td class="myinfo">나이</td>
								<td class="myinfoCont">28</td>		
							</tr>
						</table>
						 -->
						<!-- <img src="dd"> --><!-- 개인 중요도 plot 넣을 자리 -->
				</div>
			</div>
		</div>
	</div>
<div></div>
</body>
</html>